//
//  StoryListView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

struct FeaturedAthletes: View {
    @EnvironmentObject var postData: FeedVM // Observed object for reading JSON data
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) { // Horizontal scroll view for displaying story cards
            Spacer()
                .frame(height: 5)
            HStack(spacing: 0) {
                Spacer()
                    .frame(width: 12)
                AddStoryCard(imageName: "male_athlete2")
                ForEach(postData.posts) { post in // Iterate over each post in the data
                    Spacer()
                        .frame(width: 20)
                    StoryCard(post: post)
                        .frame(width: 85, height: 85)// Display a story card with the post's profile image
                }
            }
        }
        .offset(x: 15) // Offset the scroll view horizontally by 15 points
    }
}

