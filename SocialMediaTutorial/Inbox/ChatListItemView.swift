//
//  AthleteListView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/21/24.
//

import SwiftUI

struct ChatListItemView: View {
    
    var athlete: Athlete
    @State var athlete_text: String = ""
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    var body: some View {
        VStack(spacing: 0){
            HStack {
                Spacer()
                    .frame(width: 20)
                Image(athlete.profile_img)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                
                    .clipped()
                    .clipShape(Circle())
//                    .clipShape(Parallelogram(angle: 10))
                VStack(alignment: .leading){
                    Text(athlete.first_name + " " + athlete.last_name)
                        .foregroundStyle(.black)
                    Text("Seen 10 minutes ago")
                        .foregroundStyle(Color(UIColor.lightGray))

                    
                }
                Spacer()
                
                
            }
            .frame(width: deviceWidth, height: 90)
            .background(Color(.white))//UIColor.systemGray4))
//            Spacer()
            Divider()
                .overlay(Color.gray)
        }


//        .onAppear{
//            athlete_text = String(athlete.height) + " | " + String(athlete.weight) + " | " +  String(athlete.year) + " | " + athlete.gender
//        }
    }
}

#Preview {
    var athlete2 = Athlete(first_name: "Bobby", last_name: "Williams", gender: "male", sport: "Basketball", height: "6'9", year: "Class of '25", city: "Omaha", state: "Nebraska", age: 12, weight: 110, GPA: 3.8, ACT_OR_SAT: 1400, about: "Passionate Player", profile_img: "male_athlete3")
    return AthleteBannerView(athlete: athlete2)
}



