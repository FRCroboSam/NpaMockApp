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
    @State var readyToShow = false;
    @State var opacity = 0.0
    var body: some Scene {

        WindowGroup {
            ZStack{
                
                ContentView()
                    .environmentObject(feedVM)
                    .environmentObject(athleteVM)
                    .environmentObject(podcastVM)
                    .environmentObject(blogVM)
                if(opacity != 0){
                    LandingPageView()
                        .opacity(opacity)
                        .animation(.easeInOut(duration: 0.3), value: opacity)
                }

             
                
                    

                
            }
            .onAppear{
                withAnimation{
                    opacity = 1.0

                }
                feedVM.loadData()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation{
                            opacity = 0.1
                        }
                            
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                        withAnimation{
                            opacity = 0
                        }
                            
                    }
                }
                    
            }
    }
}
