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
    @StateObject private var podcastVM = PodcastVM()
    @StateObject private var blogVM = BlogVM()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(feedVM)
                .environmentObject(athleteVM)
                .environmentObject(podcastVM)
                .environmentObject(blogVM)
                .onAppear{
                      
//                    modelData.loadData()
//                    modelData.loadData()
                }
        }
    }
}
