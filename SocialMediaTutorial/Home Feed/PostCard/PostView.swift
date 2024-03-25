//
//  PostCard.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

struct PostView: View {
    // Properties for the post card
    let post: Post
    let postVM: PostVM 
    let profile_img: String
    let profile_name: String
    let profile_id: String
    
    let image_or_video: String
    let like_count: Int
    let comment_count: Int
    let view_count: Int
    let description: String
    var onCommentTapped: () -> Void // Closure to handle comment button tap

    var body: some View {
        VStack(spacing: 0) {
            PostCardHeader(profile_img: profile_img, profile_name: profile_name, profile_id: profile_id)
                .background{
                    Color(hex: "0A66C2")
                }
            // Display the header section of the post card, including profile image, name, and ID
            
            PostCardBody(image_or_video: image_or_video, like_count: like_count, comment_count: comment_count, view_count: view_count, post: post, description: description,
                         onCommentTapped: onCommentTapped)
            .padding(.top, -10)
                         
            
        }
    }
}

