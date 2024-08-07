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
    
    @State var readyToShow =  false;
    @State var opacity = 1.0
    
    @State var homeOpacity = 1.0
    var body: some Scene {
        
        WindowGroup {
            Group{
//                EditProfileView(athlete: Athlete.defaultAthlete())
                ZStack{
                    
                    HomePageView()
                        .opacity(homeOpacity)
                        .animation(.easeInOut(duration: 0.6), value: homeOpacity)

                    .zIndex(4)
                    LandingPageView()
                            .opacity(opacity)
                            .animation(.easeInOut(duration: 0.6), value: opacity)
                            .zIndex(5)
                    if(feedVM.isSigningUp){
                        VStack{
                            SignupIndicatorView()
                            Spacer()
                                .frame(height: 8/9 * deviceHeight)
                        }
                        .zIndex(10000)

                        
                    }

                        
                    
                    if(readyToShow){
                        ContentView()
                            .toolbar(.hidden, for: .navigationBar)
//
                        //.opacity(opacity > 0.0 ? 0.0 : 1.0)
                        //.opacity(opacity)
                        //.animation(.easeInOut(duration: 0.3), value: opacity)
                    }
                    else{

                    }
                }
                

            }
            .toolbar(.hidden, for: .navigationBar)
//            .onAppear{
//                DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
//                    feedVM.videosHaveLoaded = true
//                }
//            }

            .environmentObject(feedVM)
            .environmentObject(athleteVM)
            .environmentObject(podcastVM)
            .environmentObject(blogVM)
            .onChange(of: feedVM.loggedIn, perform: { value in
                if(value == true){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation(.easeIn){
                            homeOpacity = 0.0
                            readyToShow = true
                        }
                    }
                }
            })
            .onChange(of: feedVM.videosHaveLoaded, perform: { value in
                print("VIDEOS HAVE LAODED")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.easeIn){
                        print("VIDEO IS PLAYING: " + String(feedVM.youtubePlayers[0].isPlaying))
                        if(feedVM.loggedIn){
                            readyToShow = true
                            feedVM.youtubePlayers[0].pause()
                            print("ACTUALLY PAUSING")

                        }
                        print("PLAYER STATE")
                        print(feedVM.youtubePlayers[0].state)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
                            if(!feedVM.youtubePlayers[0].isPlaying){
                                feedVM.youtubePlayers[0].play()
                            }
                            print("VIDEO IS PLAYING: " + String(feedVM.youtubePlayers[0].isPlaying))

                        }
                    }
                }


//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                                withAnimation{
//                                    opacity = 0.0
//                                }
//
//                            }
            }
            )
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    print("SHOULD BE SHOWING")
                    opacity = 0.0
                    readyToShow = true
                }
                feedVM.loggedIn = false
                feedVM.loadData()
                //feedVM.loggedIn = false //placeholder
                //TODO: STore these ids in user defaults or something
//                feedVM.fetchVideoIds()
                let defaults = UserDefaults.standard

                feedVM.loggedIn = defaults.value(forKey: "User Type") != nil

                if(feedVM.loggedIn){
                    homeOpacity = 0.0
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
//                        feedVM.videosHaveLoaded = true
//                    }
                }
                else{
                    homeOpacity = 1.0
                    opacity = 0.0
                }
                //CODE FOR DETECTING IF WE ALREADY CREATED USER SO WE SHOULD GO TO FEED VIEW
                print(defaults.value(forKey: "User Type"))
                feedVM.loadVideoIds()
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
