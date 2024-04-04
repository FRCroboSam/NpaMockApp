//
//  AthleteHeadline.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/2/24.
//
import SwiftUI
import Foundation
struct AthleteHeadline: View {
    let athlete: Athlete
    
    
    var body: some View{
        HStack{
            Text(athlete.height)
            Text("|")
            Text(String(athlete.weight) + " lbs")
            Text("|")
            Text(athlete.year)
        }

    }
}
