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
    
    var onCommentTapped: () -> Void // Closure to handle comment button tap

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            if(image_or_video.contains("youtube")){
                CustomVideoPlayer(YoutubePlayer: YouTubePlayer(stringLiteral: "VIDEO"), url: image_or_video)
            }
            else{
                Image(image_or_video)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .roundedCorner(20, corners: [.bottomLeft, .topRight, .bottomRight])
            }

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
            }
            .font(.callout)
            
            Text(description)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .font(.callout)
                .foregroundColor(.gray)
        }
        .padding(.leading, 55)
    }
}

