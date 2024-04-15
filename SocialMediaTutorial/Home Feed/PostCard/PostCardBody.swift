//
//  PostCardBody.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI
import YouTubePlayerKit
struct PostCardBody: View {
    let image_or_video: String
    let like_count: Int
    let comment_count: Int
    let view_count: Int
    let post: Post
    let description: String
    let player: YouTubePlayer
    var onCommentTapped: () -> Void // Closure to handle comment button tap

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if(image_or_video.contains("youtube")){
                CustomVideoPlayer(player: player, url: image_or_video)
            }
            else{
                Image(image_or_video)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .roundedCorner(20, corners: [.bottomLeft, .topRight, .bottomRight])
            }
            Spacer()
                .frame(height: 15)
            HStack {
                HStack(spacing: 3) {
                    ToggleButton(color: Color.red, imageName: "heart")
                    Text("\(like_count.formattedString())")
                }
                Spacer()
                HStack {
                    Button(action: {
                        onCommentTapped()
//                        postData.selectedPost = post 
                    },
                   label: {
                        Image(systemName: "text.bubble")
                            .foregroundStyle(.gray)
                        Text("\(comment_count.formattedString())")
                       
                    })

                }
                Spacer()
                HStack {
                    Image(systemName: "eye")
                    Text("\(view_count.formattedString())")
                }
                Spacer()
                HStack {
                    Image(systemName: "bookmark")
                }
                .padding(.horizontal, 10)
            }
            .padding(.leading, 15)

            .font(.callout)
            Spacer()
                .frame(height: 15)
            Text(description)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .font(.callout)
                .foregroundColor(.gray)
                .padding(.leading, 15)

        }
    }
}

