//
//  PostListView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

struct PostListView: View {
    @ObservedObject var postData = ReadJsonData() // Observed object for reading JSON data
    let showCommentSection: Bool
    var body: some View {
        VStack {
            ForEach(postData.posts.prefix(postData.posts.count)) { post in //you can reintroduce the showCommentSection logic 
                PostCard(
                    profile_img: post.profile_img,
                    profile_name: post.profile_name,
                    profile_id: post.profile_id,
                    image: post.image,
                    like_count: post.like_count,
                    comment_count: post.comment_count,
                    view_count: post.view_count,
                    description: post.description
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

