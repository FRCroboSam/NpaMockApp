//
//  TabbarView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

struct TabbarView: View {
    @EnvironmentObject var athleteVM: AthleteVM

    @EnvironmentObject var vm: FeedVM
    @State private var selected = 1
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var urls = ["1", "2"]
    @State var selected2 = 1
    var body: some View {
        
        ZStack{
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
                    FeedView().tag(1)
                    InboxView(athletes: athleteVM.athletes).tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            else if(selected == 2){
                ExploreView()

            }
            else if(selected == 3){
                DiscoverView()
            }
            else if(selected == 4){
                NpaContentView()
            }
            else{
                EditProfileView(athlete: Athlete.defaultAthlete())
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
            if(!vm.showCommentSection){
                    HStack {
                        Spacer()
                        VStack{
                            Button(action: {
                                withAnimation(.easeIn){
                                    self.selected = 1
                                }
                            } ) {
                                Image(systemName: self.selected == 1 ? "house.fill" : "house") // Tab icon for HomeView
                                    .font(.system(size: 30))
                                    .tint(self.selected == 1 ? .blue : .gray)
                            }
                            Text("Home")
                                .foregroundStyle(self.selected == 1 ? .blue : .gray)
                        }

                        Spacer()
                        VStack{
                            Button(action: {                                 
                                withAnimation(.easeIn){
                                self.selected = 2


                            } } ) {
                                Image(systemName: "magnifyingglass") // Tab icon for Search View
                                    .font(.system(size: 30))
                                    .bold(self.selected == 2)
                                    .tint(self.selected == 2 ? .blue : .gray)
                                
                            }
                            Text("Explore")
                                .foregroundStyle(self.selected == 2 ? .blue : .gray)

                        }
                        Spacer()
                        VStack{
                            Button(action: {                                 withAnimation(.easeIn){
                                self.selected = 3

                            } } ) {
                                Image(systemName: "figure.run") // Tab icon for New Post
                                    .font(.system(size: 30))
                                    .tint(self.selected == 3 ? .blue : .gray)
                                
                            }
                            Text("Athletes")
                                .foregroundStyle(self.selected == 3 ? .blue : .gray)
                                .offset(y: 2)
                        }
                        Spacer()
                        VStack{
                            Button(action: {                                 withAnimation(.easeIn){
                                self.selected = 4

                            } } ) {
                                Image(systemName: "network") // Tab icon for New Post
                                    .font(.system(size: 30))
                                    .tint(self.selected == 4 ? .blue : .gray)
                                
                            }
                            Text("Content")
                                .foregroundStyle(self.selected == 4 ? .blue : .gray)
                        }
                        Spacer()

                        VStack{
                            Button(action: {                                 withAnimation(.easeOut(duration: 0.1)){
                                self.selected = 5

                            } } ) {
                                Image(systemName:  "person.crop.circle.fill") // Tab icon for Profile View
                                    .font(.system(size: 30))
                                    .tint(self.selected == 5 ? .blue : .gray)
                                
                            }
                            Text("Profile")
                                .foregroundStyle(self.selected == 5 ? .blue : .gray)
                        }
                        Spacer()
                    }
                    
                    
                    .padding(.bottom, 40)
                    .zIndex(athleteVM.showingFilters ? 5 : 20)

                    .frame(height: 120)
                
                    .background{
                        Color.white
                            .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 0, y: 0)
                    }
                    .offset(y: 1/2 * deviceHeight - 50 )
                    //                .frame(width: deviceWidth)
                    .onChange(of: athleteVM.feedOrCommentSection){ value in
                        withAnimation(.easeIn){
                            selected2 = athleteVM.feedOrCommentSection
                        }
                    }
                    
                }
            }

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
