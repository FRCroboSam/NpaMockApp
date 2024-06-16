//
//  AthleteScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/11/24.
//

import SwiftUI
import NukeUI
struct BioScrollView: View {
    @EnvironmentObject var athleteVM: AthleteVM
    @State var athletes: [Athlete] = [
        Athlete.defaultAthlete(), Athlete.defaultAthlete(), Athlete.defaultAthlete(),
        Athlete.defaultAthlete()
    ]
    @State var names: [String]?
    @State var images: [String]?
    @State var locations: [String]?
    @State var imageURLS: [String]?
    var body: some View {
        VStack(spacing: 0){


            ScrollView(.horizontal){
                
                HStack(spacing: 10){
                    Spacer()
                        .frame(width: 10)
                    if let names, locations != nil, images != nil {
                        ForEach(names.indices, id: \.self){ index in
                            if let imageURLS {
                                LazyImage(url: URL(string: imageURLS[index])){phase in
                                    if let image = phase.image{
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 170, height: 220)
                                        .roundedCorner(15, corners: .allCorners)
                                        .overlay(alignment: .bottom){
                                            VStack{
                                                HStack{
                                                    VStack(alignment: .leading){
                                                        let components = names[index].split(separator: " ")
                                                        let firstName = components.first
                                                        let lastName = components.last
                                                        Text(String(firstName!))
                                                            .font(.system(size: 20))
                                                            .bold()
                                                            .foregroundStyle(.white)
                                                            .shadow(radius: 5)
                                                        Text(lastName!)
                                                            .font(.system(size: 20))
                                                            .bold()
                                                            .foregroundStyle(.white)
                                                            .shadow(radius: 5)
                                                        
                                                        Text(locations![index])
                                                            .font(.caption)
                                                            .bold()
                                                            .foregroundStyle(.white)
                                                            .shadow(radius: 5)
                                                            .lineLimit(1)
                                                    }
                                                    Spacer()
                                                }
                                                .frame(width: 7/8 * 180)

                                                .background{
                                                    Color(hex: "0A66C2")
                                                        .opacity(0.4)
                                                        .blur(radius: 10)
                                                        .frame(height: 75)
                                                        //.mask(Rectangle().padding(.top, 20)) /// here!
                                                }
                                                Spacer()
                                                    .frame(height: 15)
                                                
                                            }
                                            
                        //                    .frame(width: 120)

                                        }
                                    }
                                    else{
                                        LoadingView(width: 170, height: 220)
                                    }
                                }
                            }
                            else {BioCard(athlete: Athlete.generateAthlete(name: names[index], location: locations![index], profile_img: images![index]))
                                    .zIndex(10000)
                                
                                    .padding(.horizontal, 5)
                            }
                        }
                    }
                    else{
                        ForEach(athleteVM.athletes.indices, id: \.self) { index in
                            BioCard(athlete: athleteVM.athletes[index] )
                                .zIndex(10000)
                            
                                .padding(.horizontal, 5)           
                        }
                    }
                }
                .padding(.top, 45)
                .padding(.bottom, 35)

                Spacer()
                
                
            }
            .padding(.top, -35)

            .zIndex(200)
            .scrollIndicators(.hidden)
            Text("Tap to read")
                .font(.headline)
                .padding(.top, -35)
                .padding(.leading, -10)
                .padding(.bottom, 15)
                .italic()
                .foregroundStyle(.gray.opacity(0.7))
            
        }
    }
}

//#Preview {
//    AthleteScrollView()
//}
