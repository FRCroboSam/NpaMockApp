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
    var body: some View {
        HStack{
            CircularProfileImage(size: 20)
            VStack{
                Text(athlete_text)
                Text(athlete.city + ", " + athlete.state)
            }
            
        }
        .onAppear{
            athlete_text = String(athlete.height) + " | " + String(athlete.weight) + " | " + "Class of '" + String(athlete.year) + " | " + athlete.gender
        }
    }
}

//#Preview {
//    AthleteListView(athlete: Athlete)
//}
