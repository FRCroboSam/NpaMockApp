//
//  TabbarView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI
import YouTubePlayerKit

struct TabbarView: View {
    @EnvironmentObject var athleteVM: AthleteVM

    @EnvironmentObject var vm: FeedVM
    @State private var selected = 1
    @State private var lastSelected = 1
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var urls = ["1", "2"]
    @State var selected2 = 1
    @State var filterViewOffset = 600.0
    @State var filterFeed = false
    
    @State var slidingTabOffset = 50.0
    let tabOffsets = [50.0, 130.0, 205, 285.0, 156.0 + 1/2 * deviceWidth]
    @State private var startSlidingDown = false
    var body: some View {
        
        ZStack{
            if(!vm.showCommentSection){
                VStack{
                    
                    Rectangle()
                        .fill(Color(hex: "0A66C2"))
                        .frame(width: 40, height: 2.0)
                        .offset(x: slidingTabOffset - 1/2 * deviceWidth, y: -5)
                        .animation(.easeIn, value: slidingTabOffset)
                    HStack {
                        Spacer()
                        VStack{
                            Button(action: {
                                withAnimation(.easeIn){
                                    self.selected = 1
                                    slidingTabOffset = tabOffsets[self.selected - 1]
                                }
                            } ) {
                                Image("home_icon")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFill()
                                    .scaleEffect(1.25)
                                    .frame(width: 25, height: 25)
                                    .padding(3)
                                //Image(systemName: self.selected == 1 ? "house.fill" : "house") // Tab icon for HomeView

                                    .foregroundStyle(self.selected == 1 ? Color(hex: "0A66C2") : .gray)
                            }
                            .frame(height: 25)

                            Text("Home")
                                .font(.caption)
                                .foregroundStyle(self.selected == 1 ? Color(hex: "0A66C2") : .gray)
                        }
                        .frame(width: 50)

                        Spacer()
                        VStack{
                            Button(action: {
                                withAnimation(.easeIn){
                                self.selected = 2
                                slidingTabOffset = tabOffsets[self.selected - 1]



                            } } ) {
                                Image("discover_icon") // Tab icon for Search View
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFill()
                                    .scaleEffect(1.2)
                                    .frame(width: 25, height: 25)
                                    .font(.system(size: 25))
                                    //bold(self.selected == 2)
                                    .tint(self.selected == 2 ? Color(hex: "0A66C2") : .gray)
                                
                            }
                            .frame(height: 25)

                            Text("Explore")
                                .font(.caption)
                                .foregroundStyle(self.selected == 2 ? Color(hex: "0A66C2") : .gray)

                        }
                        .frame(width: 50)

                        Spacer()
                        VStack{
                            Button(action: {                                 withAnimation(.easeIn){
                                self.selected = 3
                                slidingTabOffset = tabOffsets[self.selected - 1]


                            } } ) {
                                Image("athlete_icon") // Tab icon for New Post
                                    .renderingMode(.template)
                                    
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(1.25)
                                    .frame(width: 25, height: 25)
                                    .tint(self.selected == 3 ? Color(hex: "0A66C2") : .gray)
//                                    .background{
//                                        Color.orange
//                                    }
                                
                            }
                            .frame(height: 25)

                            Text("Athletes")
                                .font(.caption)
                                .foregroundStyle(self.selected == 3 ? Color(hex: "0A66C2") : .gray)
                        }
                        .frame(width: 50)

                        Spacer()
                        VStack{
                            Button(action: {                                 withAnimation(.easeIn){
                                self.selected = 4
                                slidingTabOffset = tabOffsets[self.selected - 1]


                            } } ) {
                                Image("content_icon") // Tab icon for New Post
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(1.2)
                                    .frame(width: 25, height: 25)
                                    .tint(self.selected == 4 ? Color(hex: "0A66C2") : .gray)
                                
                            }
                            .frame(height: 25)

                            Text("Content")
                                .font(.caption)
                                .foregroundStyle(self.selected == 4 ? Color(hex: "0A66C2") : .gray)
                        }
                        .frame(width: 50)

                        Spacer()

                        VStack{
                            Button(action: {                                 withAnimation(.easeOut(duration: 0.1)){
                                self.selected = 5
                                slidingTabOffset = tabOffsets[self.selected - 1]


                            } } ) {
                                Image(systemName:  "person.crop.circle.fill") // Tab icon for Profile View
                                    .font(.system(size: 25))
                                    .tint(self.selected == 5 ? Color(hex: "0A66C2") : .gray)
                                
                            }
                            .frame(height: 25)

                            Text("Profile")
                                .font(.caption)
                                .foregroundStyle(self.selected == 5 ? Color(hex: "0A66C2") : .gray)
                        }
                        .frame(width: 50)

                        Spacer()
                    }
                }

                    .onChange(of: selected){ value in
                        if(lastSelected == 3 && selected == 1){
                            
                        }
                        lastSelected = selected
                        
                        
                    }
                    
                    .padding(.top, 5)
                    .zIndex(athleteVM.showingFilters ? 5 : 20)

                
                    .background{
                        Color.white
                            .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 0, y: 0)
                            .padding(.bottom, -50)
                    }
                    .offset(y: 1/2 * deviceHeight - 60 )
                    //                .frame(width: deviceWidth)
                    .onChange(of: athleteVM.feedOrCommentSection){ value in
                        withAnimation(.easeIn){
                            selected2 = athleteVM.feedOrCommentSection
                        }
                    }
                    
                }
            if(selected == 1){
                TabView(selection: $selected2){ //$athleteVM.feedOrCommentSection.animation()){
//                    ForEach(urls.indices, id: \.self) { index in
//                        if(urls[index] == "1"){
//                            FeedView()
//                        }
//                        else{
//                            InboxView(athletes: athleteVM.athletes)
//                        }
//                    }
                    CreatePostView().tag(0)
                    
                    FeedView().tag(1)
                    InboxView(athletes: athleteVM.athletes).tag(2)
                    EmptyView().tag(4)
                    //NotificationsView().tag(-1)
                }
                .onAppear{
                    UIScrollView.appearance().alwaysBounceHorizontal = false
                }
                
                
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            else if(selected == 2){
                MainExploreView()

            }
            else if(selected == 3){
                
                DiscoverView()
                    .ignoresSafeArea(.keyboard)

                    .onAppear{
                        print("DISCOVER APPEARS")
//                        selected = 1
                    }
            }
            else if(selected == 4){
                NpaContentView()
            }
            else if(selected == 5){
                EditProfileView(athlete: Athlete.defaultAthlete())
            }
            else{
                Color.white
//                    .onAppear{
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
//                            selected = 1
//                        }
//                    }

            }
            if(athleteVM.showingFilters){
                ZStack{
                    if(selected == 1){
                        FeedFilterView()
                    }
                    else{
                        FilterView()
                    }
                }
                    .tag(1)
                    .zIndex(40)
                
                    .offset(y: filterViewOffset)
                    .animation(.easeIn, value: filterViewOffset)
                    .onAppear{
                        print("SHOULD BE APPEARING")
                        filterViewOffset = 500
                        withAnimation(.easeIn.speed(3.5)){
                            let y = print("SHOWING COMMENT SECTION")
                            filterViewOffset = 300
                            filterFeed = true
                        }
                        
                    }

                    .onChange(of: athleteVM.startSlidingDown) { value in
                        if(value == true){
                            withAnimation(.easeIn.speed(3.5)){
                                filterViewOffset = 500
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                athleteVM.animatingFilters = false
                                athleteVM.startSlidingDown = false
                                athleteVM.showingFilters = false
                                filterFeed = false
                                
                            }
                        }
                    }
                
            }

//            TabView(selection: $selected) {
//                FeedView()
//                    .tabItem {
//                        Text("")
//                    }.tag(1)
//            .toolbar(vm.showCommentSection || athleteVM.showingFilters ? .hidden : .visible, for: .tabBar)                      .zIndex(athleteVM.animatingFilters ? -10 : 0)
//
////
//
//
//
//                ExploreView()
//
//                    .tabItem {
//                        Text("")
//                    }.tag(2)
//                    .navigationBarTitleDisplayMode(.inline)
//                    .toolbar(vm.showCommentSection || athleteVM.showingFilters ? .hidden : .visible, for: .tabBar)                    .zIndex(athleteVM.animatingFilters ? -10 : 0)
//
//
//                DiscoverView()
//                    .tabItem {
//                        Text("")
//                    }.tag(3)
//                    .navigationBarTitleDisplayMode(.inline)
//                    .toolbar {
//                        ToolbarItem(placement: .principal) {
//                            HStack {
//                                Image(systemName: "sun.min.fill")
//                                Text("Title").font(.headline)
//                            }
//                        }
//                    }
//                    .toolbar(vm.showCommentSection || athleteVM.animatingFilters ? .hidden : .visible, for: .tabBar)
//                    .zIndex(athleteVM.showingFilters ? -10 : 0)
//
//                NpaContentView()
//                    .tabItem {
//                        Text("")
//                    }.tag(4)
//                    .toolbar(vm.showCommentSection || athleteVM.animatingFilters ? .hidden : .visible, for: .tabBar)
//                    .zIndex(athleteVM.showingFilters ? -10 : 0)
//
//
//                EditProfileView(athlete: Athlete.defaultAthlete())
//                    .tag(5)
//                    .toolbar(vm.showCommentSection || athleteVM.animatingFilters ? .hidden : .visible, for: .tabBar)
//                    .zIndex(athleteVM.showingFilters ? -10 : 0)
//
//
////                InboxView(athletes: athleteVM.athletes)
////                    .tabItem {
////                        Text("")
////                    }.tag(5)
////                    .toolbar(vm.showCommentSection ? .hidden : .visible, for: .tabBar)
//
//            }
            
            
            
//            .onAppear {
//                  UIScrollView.appearance().isScrollEnabled = false
//            }
            //.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//            .navigationTitle("NPA")
//            .navigationBarTitleDisplayMode(.large)
//            .accentColor(.brown) // Accent color for the TabView
            // tab-items cover - do anything needed, height, position, alignment, etc.

            }


            .toolbar(.hidden, for: .navigationBar)
            
        
        

    }


}

//struct TabbarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabbarView()
//            .environmentObject(FeedVM())
//            .environmentObject(AthleteVM())
//    }
//}

struct NavigationBarAccessor: UIViewControllerRepresentable {
    var callback: (UINavigationBar) -> (AnyView)
    private let proxyViewController = ProxyViewController()

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationBarAccessor>) -> UIViewController {
        self.proxyViewController.callback = callback
        return proxyViewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationBarAccessor>) {
    }

    private class ProxyViewController: UIViewController {
        var callback: ((UINavigationBar) -> AnyView)?

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            if let navigationBar = self.navigationController?.navigationBar {
                _ = self.callback?(navigationBar)
            }
        }
    }
}
