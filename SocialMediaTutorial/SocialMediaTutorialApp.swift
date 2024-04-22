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
    
    @State var loggedIn: Bool?
    @State var readyToShow = false;
    @State var opacity = 1.0
    var body: some Scene {
        
        WindowGroup {
            Group{
                if let loggedIn{
                    if(loggedIn){
                        ZStack{
                            
                            ContentView()
                                .environmentObject(feedVM)
                                .environmentObject(athleteVM)
                                .environmentObject(podcastVM)
                                .environmentObject(blogVM)
                                .opacity(opacity > 0.0 ? 0.0 : 1.0)
                            if(opacity != 0){
                                LandingPageView()
                                    .opacity(opacity)
                                    .animation(.easeInOut(duration: 0.3), value: opacity)
                            }
                            
                            
                            
                            
                            
                            
                        }
                        .onChange(of: feedVM.videosHaveLoaded, perform: { value in
                            withAnimation(.easeIn){
                                opacity = 0.0
                            }
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                                withAnimation{
//                                    opacity = 0.0
//                                }
//                                
//                            }
                        }
                        )
                    }
                    else{
                        HomePageView()
                    }
                }
                else{
                    LandingPageView()
                }
            }
            .onAppear{
                loggedIn = false
                //CODE FOR DETECTING IF WE ALREADY CREATED USER SO WE SHOULD GO TO FEED VIEW
//                let defaults = UserDefaults.standard
//                print(defaults.value(forKey: "User Type"))
//                loggedIn = defaults.value(forKey: "User Type") != nil
            }
            
//            .onAppear{
//                withAnimation{
//                    opacity = 1.0
//
//                }
//                //feedVM.loadData()
//                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                        withAnimation{
//                            print("TRYING TO PLAY")
//                            opacity = 0.1
//                            //feedVM.youtubePlayers[0].play()
//                        }
//                            
//                    }
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
//                        withAnimation{
//                            opacity = 0
//                        }
//                            
//                    }
//                }
                    
            }
        
    }
}
