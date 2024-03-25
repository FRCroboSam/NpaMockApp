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
                    .frame(width: 12)
                AddStoryCard() // Display the "Add Story" card
                ForEach(postData.posts) { post in // Iterate over each post in the data
                    Spacer()
                        .frame(width: 12)
                    StoryCard(post: post)
                        .frame(width: 85, height: 85)// Display a story card with the post's profile image
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

