//
//  AthleteListView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/21/24.
//

import SwiftUI

struct AthleteProfileView: View {
    @Environment(\.dismiss) var dismiss

    var athlete: Athlete
    @State var athleteHeadline: String = ""
    @State var athlete_text: String = ""
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    var body: some View {
        VStack(spacing: 0){
            AthleteNavBar(athleteName: athlete.first_name.prefix(1) + ". " + athlete.last_name)
            Spacer()
                .frame(height: 40)
            HStack(alignment: .top) {
                Spacer()
                    .frame(width: 20)
                
                Image(athlete.profile_img)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 150)
                
                    .clipped()
                    .clipShape(.rect(cornerRadius: 20))
                VStack(alignment: .leading){
                    Spacer()
                        .frame(height: 10)
                    HStack{
                        Text(athlete.first_name.uppercased())
                            .font(.subheadline)
                        
                    }
                    Text(athlete.last_name.uppercased())
                        .font(.headline)
                    Spacer()
                        .frame(height: 10)
                    Text(athleteHeadline) //option-shift-9 for the dot
                    Text(athlete.sport)
                        .foregroundStyle(.gray)
                    HStack{
                        Button{
                            
                        }label:{
                            Text("Follow")
                                .font(.system(size: 12))
                        }.buttonStyle(BigButtonStyle(height: 30, padding: 10))
                        Spacer()
                            .frame(width: 20)
                        Button{
                            
                        }label:{
                            HStack(spacing: 5){
                                Image(systemName: "dollarsign.arrow.circlepath")
                                Text("Support")
                                    .font(.system(size: 12))
                            }
                        }.buttonStyle(BigButtonStyle(height: 30, padding: 5))
                        Spacer()
                            .frame(width: 20)
                        Image(systemName: "ellipsis.message.fill")
                            .font(.system(size: 27))
                            .foregroundStyle(.blue)
                    }
                    
                    Divider()
                    
                }
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .rotationEffect(.degrees(270))
                Spacer()
                
                
            }
            .frame(width: deviceWidth, height: 100)
            Divider()
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Label("Back", systemImage: "arrow.left.circle")
                }
            }
        }
        .ignoresSafeArea(.all, edges: .top)


        .onAppear{
            athleteHeadline = String(athlete.height) + " | " + String(athlete.weight) + " | " +  String(athlete.year) + " | " + athlete.gender
        }
    }
}

#Preview {
    var athlete2 = Athlete(first_name: "Bobby", last_name: "Williams", gender: "male", sport: "Basketball", height: "6'9", year: "Class of '25", city: "Omaha", state: "Nebraska", age: 12, weight: 110, GPA: 3.8, ACT_OR_SAT: 1400, about: "Passionate Player", profile_img: "male_athlete3")
    let athlete_headline = athlete2.height + " · " + String(athlete2.weight) + " lbs" + " · " + athlete2.year
    return AthleteProfileView(athlete: athlete2)
}
