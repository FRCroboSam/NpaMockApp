//
//  PostCardBody.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI
import YouTubePlayerKit
struct PostCardBody: View {
    
    let image: String
    let like_count: Int
    let comment_count: Int
    let view_count: Int
    let description: String
    
    var onCommentTapped: () -> Void // Closure to handle comment button tap

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            CustomVideoPlayer(YoutubePlayer: YouTubePlayer(stringLiteral: "VIDEO"))
//            Image(image)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .roundedCorner(20, corners: [.bottomLeft, .topRight, .bottomRight])
            HStack {
                HStack(spacing: 3) {
                    ToggleButton(color: Color.red, imageName: "heart")
                    Text("\(like_count.formattedString())")
                }
                Spacer()
                HStack {
                    Button(action: {
                        onCommentTapped()
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

