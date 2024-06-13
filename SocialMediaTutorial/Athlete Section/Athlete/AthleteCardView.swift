//
//  AthleteCardView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/15/24.
//

import SwiftUI

struct AthleteCardView: View {
    let athlete: Athlete
    var fireValue: Int = 0
    var body: some View {
        VStack{
            Image(athlete.profile_img)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
            
                .clipped()
                .clipShape(Circle())
//                .roundedCorner(5, corners: .topRight)
//                .roundedCorner(5, corners: .topLeft)

                .overlay(alignment: .bottomTrailing) {
                    Image(systemName: "checkmark.seal.fill")
                        .font(.title)
                        .foregroundStyle(.blue)
                        .clipped()
                        .offset(x: 10, y: 5)

                }
            Text(athlete.first_name + " " + athlete.last_name)
                .font(.system(size: 15))
                .lineLimit(1)
            
            HStack{
                Text(athlete.city + ", " + athlete.state)
                    .font(.caption)
                    .lineLimit(1)
                    .foregroundColor(.gray)

            }
            Spacer()
                .frame(height: 15)
            
            Button{
                
            }label:{
                Text("Follow")
                    .font(.system(size: 16))
            }.buttonStyle(BigButtonStyle(height: 30, cornerRadius: 9, color: .blue, padding: 20 ))
        }
        .frame(width: 130)
        .padding(.top, 10)
        .background{
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color(UIColor.systemGray5))
                .padding(.bottom, -10)
        }
//        .overlay(alignment: .topLeading) {
//            if(fireValue != 0){
//                HStack(spacing: 0){
//                    Image(systemName: "flame.fill")
//                        .foregroundStyle(Color(hex: "0A66C2"))
//                    
//                   
//                }
//                
//                .background{
//                    Circle()
//                        .foregroundStyle(Color(UIColor.white))
//                        .padding(-10)
//                        .shadow(radius: 3)
//                    
//                }
//                .offset(x: -10, y: -10)
//            }
//        }

    }
}

#Preview {
    AthleteCardView(athlete: Athlete.defaultAthlete(), fireValue: 1)
}
