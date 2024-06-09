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
                .clipShape(RoundedRectangle(cornerRadius: 20)) // Clip the image into a circle shape
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.orange, Color.red, Color.yellow, Color.purple]), startPoint: .bottom, endPoint: .top), lineWidth: 3)
                )
            Text(post.profile_name)
                .font(.footnote)
                .lineLimit(1)
                .frame(width: 100)
                .padding(.horizontal, -2)

                // Add an overlay circle stroke with a gradient color
        }
    }
}

