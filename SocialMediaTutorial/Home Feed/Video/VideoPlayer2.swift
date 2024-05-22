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

var deviceHeight: CGFloat {
    UIScreen.main.bounds.height
}
var deviceWidth: CGFloat {
    UIScreen.main.bounds.width
}


struct CustomVideoPlayer: View {
    var player: YouTubePlayer
    let url: String
    var body: some View {
        
            
        YouTubePlayerView(
            player,
            placeholderOverlay: {
                ProgressView()
            }
        )
        
        .frame(width: 4/4 * deviceWidth, height: 400)
        .background(Color(.systemBackground))
        .onAppear{
            //print("SHOULD BE PLAYING")
            //player.play()
            //print(player.playbackState)



        }
//        .shadow(
//            color: .black.opacity(0.1),
//            radius: 46,
//            x: 0,
//            y: 15)
    }
}

struct VideoPlayer2: View {
    let url: String
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        YouTubePlayerView(
            YouTubePlayer(
                source: .url(url)
            ),
            placeholderOverlay: {
                    ProgressView()
                }
            )
        
        .roundedCorner(10, corners: .allCorners)
        .frame(width: width, height: height)

    }
}

//struct VideoPlayer_previews: PreviewProvider {
//    static var previews: some View {
//        PostListView()
//    }
//}
//
