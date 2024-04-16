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
    @State var currentVisiblePostIndex = -1
    @State var postPositions: [CGFloat] = Array(repeating: 0, count: 10)


    var body: some View {
        LazyVStack {
            ForEach(Array(feedVM.posts.enumerated()), id: \.1.id) { index2, post in //you can reintroduce the showCommentSection logic
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
                .background{
                    GeometryReader{ geometry in
                        Color.clear
                            .onChange(of: geometry.frame(in: .global).origin) { pos in
                                postPositions[index2] = geometry.frame(in: .global).minY
                                
                            }
                    }
                }
                .onBecomingVisible{
                    print("POST POSITIONS FOR INDEX: " + String(index2 + 1))
                    print(postPositions[index2])
//                    if(postPositions[index2] < 600 && postPositions[index2] > 200){
                        print("POST is visible  AT INDEX: " + String(index2 + 1))
                        player?.play()

//                    }
                }
                .padding(.top)
            }
        }
        
        .frame(width: deviceWidth)
        .listStyle(.plain) // Set the list style to plain
        .padding() // Apply padding to the VStack
    }
}
public extension View {
    
    func onBecomingVisible(perform action: @escaping () -> Void) -> some View {
        modifier(BecomingVisible(action: action))
    }

}

private struct BecomingVisible: ViewModifier {
    
    @State var action: (() -> Void)?

    func body(content: Content) -> some View {
        content.overlay {
            GeometryReader { proxy in
                Color.clear
                    .preference(
                        key: VisibleKey.self,
                        // See discussion!
                        value: proxy.frame(in: .global).minY > 50 && proxy.frame(in: .global).minY < 700//.intersects(proxy.frame(in: .global))
                    )
                    .onPreferenceChange(VisibleKey.self) { isVisible in
                        print("isVisible: " + String(isVisible))
                        print("PREFERENCE IS CHANGING")
                        guard isVisible, let action else { return }
                        action()
                        //action = nil
                    }
            }
        }
    }

    struct VisibleKey: PreferenceKey {
        static var defaultValue: Bool = false
        static func reduce(value: inout Bool, nextValue: () -> Bool) { }
    }
}

//struct PostListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostListView()
//    }
//}

