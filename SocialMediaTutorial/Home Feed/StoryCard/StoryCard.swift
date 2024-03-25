//
//  StoryCard.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

    struct StoryCard: View {
    let post: Post
    var body: some View {
        VStack {
            Image(post.profile_img) // Display the image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80) // Set the size of the image
                .clipShape(Circle()) // Clip the image into a circle shape
                .overlay(
                    Circle()
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing), lineWidth: 2)
                )
            Text(post.profile_name)
                .font(.footnote)
                // Add an overlay circle stroke with a gradient color
        }
    }
}

