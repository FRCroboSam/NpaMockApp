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
    @State var opacity = 0.0
    
    @State var homeOpacity = 0.0
    var body: some Scene {
        
        WindowGroup {
            Group{
//                EditProfileView(athlete: Athlete.defaultAthlete())
                ZStack{
                    HomePageView() //this is the thing with the buttons
                        .opacity(homeOpacity)
                        .animation(readyToShow ? .easeInOut(duration: 0.6) : nil, value: homeOpacity)
                        .zIndex(3)

                    LandingPageView() // landing page when logged in
                        .opacity(opacity)
                        .animation(readyToShow ? .easeInOut(duration: 0.6) : nil, value: opacity)
                        .zIndex(4)
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
                            print("CHANGING")
                            homeOpacity = 0.0
                            readyToShow = true
                        }
                    }
                }
            })
            .onChange(of: feedVM.videosHaveLoaded, perform: { value in
                print("VIDEOS HAVE LAODED")
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    withAnimation(.easeIn){
                        print("VIDEO IS PLAYING: " + String(feedVM.youtubePlayers[0].isPlaying))
                        opacity = 0.0
                        readyToShow = true
                        if(feedVM.loggedIn){
                            feedVM.youtubePlayers[0].pause()
                            print("ACTUALLY PAUSING")

                        }
                        print("PLAYER STATE")
                        print(feedVM.youtubePlayers[0].state)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 6.5){
                    if feedVM.loggedIn{
                        opacity = 0.0
                        readyToShow = true
                    }
                }
                feedVM.loggedIn = false
                feedVM.loadData()
                //TODO: STore these ids in user defaults or something
//                feedVM.fetchVideoIds()
                let defaults = UserDefaults.standard

                feedVM.loggedIn = defaults.value(forKey: "User Type") != nil

                if(feedVM.loggedIn){
                    opacity = 1.0
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
//                        feedVM.videosHaveLoaded = true
//                    }
                }
                else{
                    homeOpacity = 1.0
                }
                //CODE FOR DETECTING IF WE ALREADY CREATED USER SO WE SHOULD GO TO FEED VIEW
                print(defaults.value(forKey: "User Type"))
                feedVM.loadVideoIds()
            }
            }

        
   }
}
