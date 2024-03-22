//
//  AthleteListView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/21/24.
//

import SwiftUI

struct AthleteListView: View {
    
    let athlete: Athlete
    @State var athlete_text: String = ""
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    var body: some View {
        ZStack {
            // Overlay to capture taps
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    print(athlete_text)
                }
            
            HStack(){
                CircularProfileImage(size: 40)
                    .padding(.leading, 20)
                VStack(alignment: .leading){
                    Text(athlete_text)
                    Text(athlete.city + ", " + athlete.state)
                }
                Spacer()
            }
        }
        .frame(width: deviceWidth, height: 80)
        .onAppear{
            athlete_text = String(athlete.height) + " | " + String(athlete.weight) + " | " +  String(athlete.year) + " | " + athlete.gender
        }
    }
}

//#Preview {
//    AthleteListView(athlete: Athlete)
//}
