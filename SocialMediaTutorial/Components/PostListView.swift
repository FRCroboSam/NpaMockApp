//
//  PostListView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

struct PostListView: View {
    @EnvironmentObject var feedVM: FeedVM// Observed object for reading JSON data
    let showCommentSection: Bool
    
    var onCommentTapped: () -> Void // Closure to handle comment button tap

    var body: some View {
        VStack {
            ForEach(feedVM.posts.prefix(feedVM.posts.count)) { post in //you can reintroduce the showCommentSection logic
                PostView(
                    post: post, postVM: PostVM(post: post), profile_img: post.profile_img,
                    profile_name: post.profile_name,
                    profile_id: post.profile_id,
                    image: post.image,
                    like_count: post.like_count,
                    comment_count: post.comment_count,
                    view_count: post.view_count,
                    description: post.description,
                    onCommentTapped: {
                        print("COMMENT WAS TAPPED")
                    }
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

