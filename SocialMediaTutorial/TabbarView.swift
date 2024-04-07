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
    var body: some View {
        
        ZStack{
            TabView(selection: $selected) {
                VStack{
                    FeedView()
                        .tabItem {
                            Text("")
                        }.tag(1)
                        .toolbar(vm.showCommentSection ? .hidden : .hidden, for: .tabBar)
                    
                }

                
                DiscoverView()
                    .tabItem {
                        Text("")
                    }.tag(2)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(vm.showCommentSection ? .hidden : .hidden, for: .tabBar)

                NpaContentView()
                    .tabItem {
                        Text("")
                    }.tag(3)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Image(systemName: "sun.min.fill")
                                Text("Title").font(.headline)
                            }
                        }
                    }
                    .toolbar(vm.showCommentSection ? .hidden : .hidden, for: .tabBar)

                Text("Profile View")
                    .tabItem {
                        Text("")
                    }.tag(4)
                    .toolbar(vm.showCommentSection ? .hidden : .hidden, for: .tabBar)

            }
            .navigationTitle("NPA")
            .navigationBarTitleDisplayMode(.large)
            .zIndex(0)
            .accentColor(.brown) // Accent color for the TabView
            // tab-items cover - do anything needed, height, position, alignment, etc.
            if(!vm.showCommentSection){
                    HStack {
                        Spacer()
                        Button(action: { self.selected = 1 } ) {
                            Image(systemName: self.selected == 1 ? "house.fill" : "house") // Tab icon for HomeView
                                .font(.system(size: 30))
                                .tint(self.selected == 1 ? .blue : .gray)
                        }
                        Spacer()
                        Button(action: { self.selected = 2 } ) {
                            Image(systemName: "magnifyingglass") // Tab icon for Search View
                                .font(.system(size: 30))
                                .bold(self.selected == 2)
                                .tint(self.selected == 2 ? .blue : .gray)
                            
                        }
                        Spacer()
                        Button(action: { self.selected = 3 } ) {
                            Image(systemName: "network") // Tab icon for New Post
                                .font(.system(size: 30))
                                .tint(self.selected == 3 ? .blue : .gray)
                            
                        }
                        Spacer()
                        Button(action: { self.selected = 4 } ) {
                            Image(systemName:  "person") // Tab icon for Profile View
                                .font(.system(size: 30))
                                .tint(self.selected == 4 ? .brown : .gray)
                            
                        }
                        Spacer()
                    }
                    
                    
                    .padding(.bottom, 15)
                    .zIndex(10)

                    .frame(height: 90)
                
                    .background{
                        Color.white
                            .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 0, y: 0)
                    }
                    .offset(y: 1/2 * deviceHeight - 50 )
                    //                .frame(width: deviceWidth)
                    
                }
            }
            }


}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}

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
