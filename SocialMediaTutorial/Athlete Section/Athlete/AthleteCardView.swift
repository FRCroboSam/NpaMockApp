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
                .frame(width: 90, height: 90)
            
                .clipped()
                .clipShape(Rectangle())
                .cornerRadius(15)
                .overlay(alignment: .bottomTrailing) {
                    Image(systemName: "basketball")
                        .font(.title)
                        .background{
                            Color.orange
                        }
                        .clipped()
                        .clipShape(Circle())

                        .offset(x: 10, y: 5)
                }
            Text(athlete.first_name + " " + athlete.last_name)
                .font(.system(size: 15))
                .lineLimit(1)
            Text("1.5K Followers")
                .font(.caption)
            Divider()
            Button{
                
            }label:{
                Text("Follow")
                    .font(.system(size: 16))
            }.buttonStyle(BigButtonStyle(height: 30, cornerRadius: 9, color: .blue, padding: 20 ))
        }
        .frame(width: 110)
        .background{
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color(UIColor.systemGray5))
                .padding(.vertical, -10)
                .padding(.horizontal, -3)
        }
        .overlay(alignment: .topLeading) {
            if(fireValue != 0){
                HStack(spacing: 0){
                    Image(systemName: "flame.fill")
                        .foregroundStyle(Color(hex: "0A66C2"))
                    
                    Text(String(fireValue))
                        .bold()
                        .foregroundStyle(Color(hex: "0A66C2"))
                }
                
                .background{
                    Circle()
                        .foregroundStyle(Color(UIColor.white))
                        .padding(-10)
                        .shadow(radius: 3)
                    
                }
                .offset(x: -10, y: -10)
            }
        }

    }
}

#Preview {
    AthleteCardView(athlete: Athlete.defaultAthlete(), fireValue: 1)
}
