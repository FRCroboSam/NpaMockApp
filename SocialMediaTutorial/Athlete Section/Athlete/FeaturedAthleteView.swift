//
//  AthleteListView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/21/24.
//

import SwiftUI

struct FeaturedAthleteView: View {
    
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
                HStack(alignment: .center){
                    Image(athlete.profile_img)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 200)
                    
                        .clipped()
                        .clipShape(Rectangle())
                        .cornerRadius(10)
                        .overlay(alignment: .bottomLeading) {
                            Text("Age 17")
                                .bold()
                                .foregroundStyle(Color.white)
                                .background{
                                    RoundedRectangle(cornerRadius: 12)
                                        .foregroundStyle(Color.teal.opacity(0.8))
                                        .padding(-10)
                                        .shadow(radius: 3)
                                }
                                .offset(x: 15, y: -15)
                            
                        }
                        .overlay(alignment: .topLeading) {
                                HStack(spacing: 0){
                                    Image(systemName: "flame.fill")
                                        .font(.system(size: 20))
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
                    Spacer()
                        .frame(width: 10)
                    VStack(alignment: .leading, spacing: 10){
                        VStack(alignment: .leading){
                            Text(athlete.first_name.uppercased())
                                .font(.subheadline)
                            Text(athlete.last_name.uppercased())
                                .font(.headline)
                        }
                        HStack{
                            Text("Oakridge High School")
                        }
                        HStack{
                            Text(athlete.city + ", " + athlete.state)
                                .font(.subheadline)

                        }
                        HStack{
                            Image(systemName: "basketball.fill")
                            Text(athlete.gender.capitalized + " " + athlete.sport )
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                        Button{
                            
                        }label:{
                            Text("Follow 1.5K")
                                .font(.system(size: 16))
                        }.buttonStyle(BigButtonStyle(height: 30, cornerRadius: 9, color: .blue, padding: 30 ))
                        

                    }
                }
                
                .background{
                    Color.blue
                        .opacity(0.1)
                        .cornerRadius(10)
                        .shadow(radius: 1)
                        .padding(.leading, -10)

                        .padding(.trailing, -20)
                        .padding(.vertical, -10)

                }
//                    .clipShape(Parallelogram(angle: 10))
                
                Spacer()

                
                
            }
            .frame(width: deviceWidth, height: 120)
            .background(Color(.white))//UIColor.systemGray4))
//            Spacer()

        }


//        .onAppear{
//            athlete_text = String(athlete.height) + " | " + String(athlete.weight) + " | " +  String(athlete.year) + " | " + athlete.gender
//        }
    }
}

#Preview {
    var athlete2 = Athlete(first_name: "Bobby", last_name: "Williams", gender: "male", sport: "Basketball", height: "6'9", year: "Class of '25", city: "Omaha", state: "Nebraska", age: 12, weight: 110, GPA: 3.8, ACT_OR_SAT: 1400, about: "Passionate Player", profile_img: "male_athlete3")
    return FeaturedAthleteView(athlete: athlete2)
}

