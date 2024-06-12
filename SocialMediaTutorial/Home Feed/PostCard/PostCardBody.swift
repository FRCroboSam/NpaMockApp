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
    let title: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .italic()
                .multilineTextAlignment(.leading)
                .font(.headline)
                .foregroundColor(.black.opacity(0.7))
                .padding(.leading, 15)
            Spacer()
                .frame(height: 10)
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
                    ToggleButton(color: Color(hex: "0A66C2"), imageName: "flame")
                    Spacer()
                        .frame(width: 1)
                    Text("\(like_count.formattedString())")
                        .foregroundStyle(Color(hex: "0A66C2"))
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 5)
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.45), lineWidth: 0.5)
                }
                Spacer()
                    .frame(width: 10)
                HStack {
                    Button(action: {
                        onCommentTapped()
//                        postData.selectedPost = post 
                    },
                   label: {
                        Image(systemName: "text.bubble")
                            .foregroundStyle(.gray)
                        Text("\(comment_count.formattedString())")
                            .foregroundStyle(.black.opacity(0.6))
                       
                    })

                }
                .padding(.horizontal, 8)
                .padding(.vertical, 5)
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.45), lineWidth: 0.5)
                }
                Spacer()
                    .frame(width: 10)
                Image(systemName: "arrowshape.turn.up.right")
                    .foregroundStyle(.black.opacity(0.6))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray.opacity(0.45), lineWidth: 0.5)
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

