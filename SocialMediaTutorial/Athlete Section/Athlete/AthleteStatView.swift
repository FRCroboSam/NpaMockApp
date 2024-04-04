//
//  AthleteStatView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/28/24.
//

import Foundation
import SwiftUI


struct AthleteStatView: View {
    var athlete: Athlete
    @State var numPosts: Int
    @State var followers: Int
    @State var following: Int



    var body: some View{
        VStack{
            //use this for the actual stats view
//            Text("Profile Stats")
//                .foregroundStyle(.white)
//                .frame(width: 2/3 * deviceWidth, height: 20)
//                .background{
//                    Color(hex: "0A66C2")
//                }
//                .clipShape(
//                    .rect(
//                        topLeadingRadius: 20,
//                        bottomLeadingRadius: 0,
//                        bottomTrailingRadius: 0,
//                        topTrailingRadius: 20
//                    )
//                )

            HStack{
                Spacer()
                VStack{
                    Text(String(followers))
                    Text("Fans")
                }
                Spacer()
                Divider()
                    .frame(width: 1, height: 60)
                    .overlay(Color(hex: "0A66C2"))
                Spacer()
                VStack{
                    Text(String(following))
                    Text("Following")
                }
                Spacer()
                Divider()
                    .frame(width: 1, height: 60)
                    .overlay(Color(hex: "0A66C2"))
                Spacer()
                VStack{
                    Text(String(numPosts))
                    Text("Posts")
                }
                Spacer()
            }
//            .frame(height: 100)///3/4 * deviceWidth, height: 300)
//            .background{
//                RoundedRectangle(cornerRadius:5).strokeBorder(Color(hex: "0A66C2"), lineWidth: 3)
//
//            }
//            .clipShape(
//                .rect(
//                    topLeadingRadius: 20,
//                    bottomLeadingRadius: 0,
//                    bottomTrailingRadius: 0,
//                    topTrailingRadius: 20
//                )
//            )
            
            
        }

        
        
    }
}
#Preview {

    return AthleteStatView(athlete: Athlete.defaultAthlete(), numPosts: 13, followers: 389, following: 12)
}

