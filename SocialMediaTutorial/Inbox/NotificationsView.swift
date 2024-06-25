//
//  AthleteScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/11/24.
//

import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject var athleteVM: AthleteVM
    @State var query: String = ""
    var body: some View {

        ScrollView{
            Spacer()
                .frame(height: 10)
            HStack{
                Spacer()
                    .frame(width: 10)
                Button{
                    athleteVM.feedOrCommentSection = 2
                    withAnimation(.easeIn.speed(0.5)){
                        print("ANIMATING DONE")
                        athleteVM.feedOrCommentSection = 1
                    }
                }label:{
                    Image(systemName: "chevron.down")
                        .font(.title2)
                        .foregroundStyle(.gray)
                        .rotationEffect(.init(degrees: -270))
                        .padding(.leading, 10)
                }
                
                Text("Notifications")
                    .font(.title)
                    .bold()
                    .padding(.leading, 10)
                Spacer()
            }
            VStack(spacing: 0){
                ForEach(athleteVM.athletes.indices, id: \.self){ index in
                    if(index == 0){
                        HStack{
                            Text("NEW")
                                .foregroundStyle(.blue.opacity(0.7))
                                .font(.headline)
                                .bold()
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background{
                                    Color.blue.opacity(0.1)
                                        .roundedCorner(5, corners: .allCorners)
                                }
                                .padding(.leading, 35)
                            Spacer()
                        }
                    }
                    else if(index == 1){
                        HStack{
                            Text("Older")
                                .font(.headline)
                                .bold()
                                .padding(.leading, 35)
                            Spacer()
                        }
                    }
                    let athlete = athleteVM.athletes[index]
                    let name = athlete.first_name + " " + athlete.last_name
                    NotificationView(profile_img: athlete.profile_img, text: "is now a fan of you!", name: name)
                        .padding(.leading, 20)
                        .padding(.trailing, 10)
                }
                Spacer()
                    .frame(height: 50)
            }
            Spacer()
            
        }
        .toolbar(.hidden, for: .navigationBar)

        
    }
}

//#Preview {
//    AthleteScrollView()
//}
