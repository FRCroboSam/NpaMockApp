//
//  TabbarView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

struct TabbarView: View {
    @EnvironmentObject var vm: FeedVM
    @State private var selected = 1
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var body: some View {
        ZStack{
            TabView(selection: $selected) {
                FeedView()
                    .tabItem {
                        Text("")
                    }.tag(1)
                    
                    .toolbar(vm.showCommentSection ? .hidden : .visible, for: .tabBar)
                
                DiscoverView()
                    .tabItem {
                        Text("")
                    }.tag(2)
                Text("New Post")
                    .tabItem {
                        Text("")
                    }.tag(3)
                Text("Profile View")
                    .tabItem {
                        Text("")
                    }.tag(4)
            }
            .zIndex(0)
            .accentColor(.brown) // Accent color for the TabView
            // tab-items cover - do anything needed, height, position, alignment, etc.
            if(!vm.showCommentSection){
                HStack {
                    Spacer()
                    Button(action: { self.selected = 1 } ) {
                        Image(systemName: "house") // Tab icon for HomeView
                            .font(.system(size: 30))
                            .tint(self.selected == 1 ? .brown : .gray)
                    }
                    Spacer()
                    Button(action: { self.selected = 2 } ) {
                        Image(systemName: "magnifyingglass") // Tab icon for Search View
                            .font(.system(size: 30))
                            .tint(self.selected == 2 ? .brown : .gray)
                        
                    }
                    Spacer()
                    Button(action: { self.selected = 3 } ) {
                        Image(systemName: "square.and.pencil") // Tab icon for New Post
                            .font(.system(size: 30))
                            .tint(self.selected == 3 ? .brown : .gray)
                        
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
                .offset(y: 1/2 * deviceHeight - 50 )
            }
            }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
