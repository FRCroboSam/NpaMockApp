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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(feedVM)
                .onAppear{
//                    modelData.loadData()
//                    modelData.loadData()
                }
        }
    }
}
