//
//  HomeView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

struct HomeView: View {
    let showCommentSection: Bool = false
    
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var body: some View {
        
        let items = ["This is the first comment", "What a great catch!", "That was an insane clip!",
                     "This is the first comment", "What a great catch!", "That was an insane clip!",
                     "This is the first comment", "What a great catch!", "That was an insane clip!",
                     "This is the first comment", "What a great catch!", "That was an insane clip!",
                     "This is the first comment", "What a great catch!", "That was an insane clip!",
                     "This is the first comment", "What a great catch!", "That was an insane clip!",
                     "This is the first comment", "What a great catch!", "That was an insane clip!",
                     "This is the first comment", "What a great catch!", "That was an insane clip!"
        ]
        ZStack{
            NavigationStack {
                if(!showCommentSection){
                    ScrollView{
                        StoryListView() // Display the list of stories
                        PostListView(showCommentSection: false) // Display the list of posts
                    }
                    .navigationTitle("NPA+") // Set the navigation title
                    .navigationBarItems(leading: Image(systemName: "pencil.and.outline"), trailing: Image(systemName: "bell.badge.fill")) // Add leading and trailing navigation bar items
                    
                }
                else{
                    StoryListView()
                    VStack{
                        ScrollView{
                            ForEach(0..<items.count, id: \.self) { index in
                                Text("\(index + 1). \(items[index])")
                                    .foregroundColor(.red) // Adjust text color as needed
                                    .padding() // Add padding around each text item
                            }
                        }
                        .frame(minWidth: deviceWidth)
                        
                        
                    }
                    .frame(minWidth: deviceWidth)
                    .background{
                        Color.orange
                    }
                    .cornerRadius(20)
                    .contentShape(Rectangle())
                    .zIndex(3)
                    
                }
                
                //            }
                
            }
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

