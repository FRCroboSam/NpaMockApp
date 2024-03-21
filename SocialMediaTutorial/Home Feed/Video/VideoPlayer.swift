//
//  PostListView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI
import Foundation
import AVKit
import YouTubePlayerKit
struct CustomVideoPlayer: View {
    let YoutubePlayer: YouTubePlayer
    let url: String
    var body: some View {
        YouTubePlayerView(
            YouTubePlayer(
                source: .url(url )
            ),
            placeholderOverlay: {
                    ProgressView()
                }
            )
            .frame(width: 300, height: 220)
            .background(Color(.systemBackground))
            .shadow(
                color: .black.opacity(0.1),
                radius: 46,
                x: 0,
                y: 15
        )
    }
}

//struct VideoPlayer_previews: PreviewProvider {
//    static var previews: some View {
//        PostListView()
//    }
//}
//
