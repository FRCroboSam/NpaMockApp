//
//  DiscoverView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/21/24.
//

import SwiftUI

struct DiscoverView: View {
    @EnvironmentObject var athleteVM: AthleteVM
    @State private var searchTeacher = ""
    @State private var selected_athlete: Athlete?
    @State private var goToAthleteProfile = false
    @State private var filterViewOffset = 0.0
    @State private var startSlidingDown = false
    var body: some View{
        NavigationStack{
            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 15)
//                Text("Athletes")
//                    .font(.title)
//                    .bold()
//                    .padding(.leading, 20)

                    VStack(spacing: 0){
                        HStack{
                            Spacer()
                                .frame(width: 10)
                            HStack{
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                                TextField("Discover, sponsor your favorite athletes!", text: $searchTeacher)
                                    .foregroundColor(.black)
                                    .textContentType(.newPassword)
                                    .keyboardType(.asciiCapable)
                                    .autocorrectionDisabled()
                                    .listRowSeparator(.hidden)
                            }.modifier(customViewModifier(roundedCornes: 30, startColor: Color(UIColor.systemGray5), endColor: Color(UIColor.systemGray5), textColor: .black, ratio: 0.925))
//                                .padding(.top, 10)
//                                .offset(y: 20)
                            Button{
                                filterViewOffset = 500
                                if(athleteVM.showingFilters){
                                    startSlidingDown = true
                                }
                                else{
                                    athleteVM.showingFilters = true

                                }
                                
                            } label: {
                                HStack{
                                    Image(systemName: "line.3.horizontal.decrease")
                                        //.resizable()
                                        .font(.system(size: 20))
                                        .foregroundStyle(.white)
                                        .frame(width: 50, height: 50)

                                        .background{
                                            Color(UIColor.gray)
                                                .clipShape(.circle)
                                        }
//                                    Text("Filter")
                                }
                                .padding(.trailing, 10)
                            }
                        }
                        //                    Spacer()
                        //                        .frame(height: 30)
                        Spacer()
                            .frame(height: 10)
                        ScrollView(.horizontal){
                            HStack(spacing: 15){
                                //                            Text("Sponsor and interact with your favorite athletes!")
                                //                                .bold()
                                //                                .font(.subheadline)
                                Spacer()
                                    .frame(width: 2)
                                Text("Sport")
                                    .foregroundStyle(Color(UIColor.systemGray2))
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 7)
                                    .background{
                                        RoundedRectangle(cornerRadius: 20)
                                            .strokeBorder(Color(UIColor.systemGray4))
                                            .cornerRadius(15)
                                    }
                                Text("Gender")
                                    .foregroundStyle(Color(UIColor.systemGray2))
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 7)
                                    .background{
                                        RoundedRectangle(cornerRadius: 20)
                                            .strokeBorder(Color(UIColor.systemGray4))
                                            .cornerRadius(15)
                                    }

                                Text("Men's")
                                    .foregroundStyle(Color.gray)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 7)
                                    .background{
                                        RoundedRectangle(cornerRadius: 20)
                                            .strokeBorder(Color.blue, lineWidth: 2)
                                            .cornerRadius(15)
                                    }



                                Text("Basketball")
                                    .foregroundStyle(Color.orange)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 7)
                                    .background{
                                        RoundedRectangle(cornerRadius: 20)
                                            .strokeBorder(.orange)
                                            .cornerRadius(15)
                                    }

                                Text("High School")
                                    .foregroundStyle(Color.teal)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 7)
                                    .background{
                                        RoundedRectangle(cornerRadius: 20)
                                            .strokeBorder(.teal)
                                            .cornerRadius(15)
                                    }
                                
                                
                                
                                
                            }
                        }.scrollIndicators(.hidden)
                        Spacer()
                            .frame(height: 15)
                        Divider()
                        VStack{
                            Spacer()
                                .frame(height: 15)
                            
                            HStack{
                                Text("48 results")
                                    .foregroundStyle(.gray)
                                    .padding(.leading, 15)
                                Spacer()
                                Text("Most Relevant")
                                    .foregroundStyle(Color(hex: "#2E8BC0"))
                                Image(systemName: "chevron.down")
                                    .font(.subheadline)
                                    .foregroundStyle(Color(hex: "#2E8BC0"))
                                Spacer()
                                    .frame(width: 15)

                            }
                            Spacer()
                                .frame(height: 15)

                        }
                        Divider()
                        ZStack{
                            ScrollView{
                                Spacer()
                                    .frame(height: 20)
                                HStack(spacing: 0){
                                    
                                    Text("Featured")
                                        .bold()
                                        .font(.title)
                                        .padding(.leading, 20)
                                    Spacer()
                                    
                                    
                                }
                                Spacer()
                                    .frame(height: 10)
                                FeaturedAthletes()
                                Spacer()
                                    .frame(height: 20)
                                Divider()
                                VStack(spacing: 0){
                                    ForEach(athleteVM.athletes){ athlete in
                                        
                                        NavigationLink{
                                            AthleteProfileView(athlete: athlete)
                                        }label: {
                                            AthleteBannerView(athlete: athlete)
                                                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                                            
                                            Divider()
                                            
                                            
                                        }
                                    }
                                    Spacer()
                                        .frame(height: 50)
                                }
                                
                                
                                .onAppear{
                                    goToAthleteProfile = false
                                    print(String(
                                        athleteVM.athletes.count))
                                }
                            }
                            if(athleteVM.showingFilters){
                                
                                
                                FilterView()
                                    .offset(y: filterViewOffset)
                                    .animation(.easeIn, value: filterViewOffset)
                                    .onAppear{
                                        withAnimation(.easeIn.speed(3.5)){
                                            let y = print("SHOWING COMMENT SECTION")
                                            filterViewOffset = 100
                                        }
                                    }
                                    .onChange(of: startSlidingDown) { value in
                                        if(value == true){
                                            withAnimation(.easeIn.speed(3.5)){
                                                filterViewOffset = 500
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                                startSlidingDown = false
                                                athleteVM.showingFilters = false
                                                
                                            }
                                        }
                                    }
                                
                            }
                        }
                    }
                    
                    
                    
                
            }

        }

    }
}
struct BigButtonStyle: ButtonStyle {
    let height: CGFloat
//    @State var width: CGFloat?
    @State var cornerRadius: CGFloat =  12
//    @State var percentWidth = 0.75
    @State var color: Color = .orange
    @State var textColor: Color = .white
    let padding: CGFloat?
    @Environment(\.isEnabled) private var isEnabled: Bool
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .padding(padding ?? 20)
            //.frame(width: percentWidth * deviceWidth)
            .foregroundColor(isEnabled ? textColor : Color(UIColor.systemGray3))
            .background(isEnabled   ? color: Color(UIColor.systemGray5))
            .frame(height: height)
            
            .cornerRadius(cornerRadius)
            .overlay{
                if configuration.isPressed{
                    Color(white: 1.0, opacity: 0.2)
                        .cornerRadius(12)
                }
            }
    }
}
//#Preview {
//    let sports = ["Swimming", "Tennis", "Baseball", "Football", "Lacrosse", "Badminton", "Soccer", "Rugby",
//                  "Basketball", "Pickleball", "Cross Country", "Track and Field"]
//    DiscoverView()
//}

#Preview {
    DiscoverView()
        .environmentObject(AthleteVM())
}
