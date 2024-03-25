//
//  AthleteListView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/21/24.
//

import SwiftUI

struct AthleteBannerView: View {
    
    var athlete: Athlete
    @State var athlete_text: String = ""
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    var body: some View {

            HStack {
                Spacer()
                    .frame(width: 20)
                Image(athlete.profile_img)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)

                    .clipped()
                    .clipShape(Parallelogram(angle: 30))
                VStack(alignment: .leading){
                    Text(athlete.first_name.uppercased())
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    Text(athlete.last_name.uppercased())
                        .font(.headline)
                        .foregroundStyle(.white)

                    Text(athlete.city + ", " + athlete.state)
                        .foregroundStyle(.white)

                }
                Spacer()
                Image(systemName: "chevron.down")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .rotationEffect(.degrees(270))
                    .padding(.trailing, 30)
                
                
            }
            .frame(width: deviceWidth, height: 100)
            .background(Color.blue)
            Spacer()
        


//        .onAppear{
//            athlete_text = String(athlete.height) + " | " + String(athlete.weight) + " | " +  String(athlete.year) + " | " + athlete.gender
//        }
    }
}

#Preview {
    var athlete2 = Athlete(first_name: "Bobby", last_name: "Williams", gender: "male", sport: "Basketball", height: "6'9", year: "Class of '25", city: "Omaha", state: "Nebraska", age: 12, weight: 110, GPA: 3.8, ACT_OR_SAT: 1400, about: "Passionate Player", profile_img: "male_athlete3")
    return AthleteBannerView(athlete: athlete2)
}
struct Parallelogram: Shape {
    let angle: CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let angleAdjustment: CGFloat = angle // Adjust this value to change the angle
        path.move(to: CGPoint(x: rect.minX + angleAdjustment, y: rect.minY)) // Top left
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))    // Top right
        path.addLine(to: CGPoint(x: rect.maxX - angleAdjustment, y: rect.maxY)) // Bottom right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))    // Bottom left
        path.closeSubpath()
        return path
    }
}

