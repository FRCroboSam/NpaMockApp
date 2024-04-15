//
//  PostListView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI
import YouTubePlayerKit
struct PostListView: View {
    @EnvironmentObject var feedVM: FeedVM// Observed object for reading JSON data
    let showCommentSection: Bool
    
    var onCommentTapped: () -> Void // Closure to handle comment button tap

    var body: some View {
        VStack {
            ForEach(feedVM.posts.prefix(feedVM.posts.count)) { post in //you can reintroduce the showCommentSection logic
                let index = feedVM.post_with_videos.firstIndex(where: { $0 == post.post_id})
                var player = index != nil ? feedVM.youtubePlayers[index ?? 0] : nil
                PostView(
                    post: post, postVM: PostVM(post: post), profile_img: post.profile_img,
                    profile_name: post.profile_name,
                    profile_id: post.profile_id,
                    image_or_video: post.image_or_video,
                    like_count: post.like_count,
                    comment_count: post.comment_count,
                    view_count: post.view_count,
                    description: post.description,
                    onCommentTapped: {
                        feedVM.selected_post_vm = PostVM(post: post) 
                        withAnimation(.easeIn.speed(2.0)){
                            feedVM.showCommentSection = true
                        }
                    }, player: player ?? YouTubePlayer(source: .url(post.image_or_video))
                )
                .padding(.top)
            }
        }
        .listStyle(.plain) // Set the list style to plain
        .padding() // Apply padding to the VStack
    }
}

//struct PostListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostListView()
//    }
//}

