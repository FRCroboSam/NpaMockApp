//
//  SocialMediaTutorialApp.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

@main
struct SocialMediaTutorialApp: App {
    @StateObject private var feedVM = FeedVM()
    @StateObject private var athleteVM = AthleteVM()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(feedVM)
                .environmentObject(athleteVM)
                .onAppear{
                      
//                    modelData.loadData()
//                    modelData.loadData()
                }
        }
    }
}
