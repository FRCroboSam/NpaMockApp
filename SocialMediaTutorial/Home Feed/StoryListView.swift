//
//  StoryListView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

struct StoryListView: View {
    @EnvironmentObject var postData: FeedVM // Observed object for reading JSON data
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) { // Horizontal scroll view for displaying story cards
            Spacer()
                .frame(height: 5)
            HStack(spacing: 0) {
                Spacer()
                    .frame(width: 15)
                AddStoryCard(imageName: "male_athlete2") // Display the "Add Story" card
                Spacer()
                    .frame(width: 15)
                VStack{
                    Image("featured_basketball_highlights")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 160, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange, Color.red, Color.yellow, Color.purple]), startPoint: .bottom, endPoint: .top), lineWidth: 3)
                        )
 
                    
                    Text("Featured This Week")
                        .font(.footnote)
                        .frame(width: 140)
                }
                Spacer()
                    .frame(width: 10)
                
                    
                
                ForEach(postData.posts) { post in // Iterate over each post in the data
                    Spacer()
                        .frame(width: 5)
                    StoryCard(post: post)
                        //.frame(width: 120, height: 85)// Display a story card with the post's profile image
//                        .background{
//                            Color.orange
//                        }
                }
            }
        }
        .offset(x: 15) // Offset the scroll view horizontally by 15 points
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}

