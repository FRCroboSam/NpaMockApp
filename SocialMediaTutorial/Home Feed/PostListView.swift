//
//  PostListView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI
import YouTubePlayerKit
struct PostListView: View {
    @EnvironmentObject var athleteVM: AthleteVM
    @EnvironmentObject var feedVM: FeedVM// Observed object for reading JSON data
    let showCommentSection: Bool
    
    var onCommentTapped: () -> Void // Closure to handle comment button tap
    @State var currentVisiblePostIndex = -1
    @State var postPositions: [CGFloat] = Array(repeating: 0, count: 10)
    @State var showPosts = false
    @State private var timer: Timer?

    var body: some View {
        ScrollView{
            LazyVStack {
                if(showPosts || feedVM.youtubePlayers[0].state != nil){
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
                                feedVM.selected_post_vm.fetchComments(postId: feedVM.selected_post_vm.post.post_id)
                                withAnimation(.easeIn.speed(2.0)){
                                    feedVM.showCommentSection = true
                                }
                                onCommentTapped()
                                
                            }, player: player ?? YouTubePlayer(source: .url(post.image_or_video))
                        )
                        .background{
                            GeometryReader{ geometry in
                                Color.clear
                                    .onChange(of: geometry.frame(in: .global).origin) { pos in
                                        //print("POS IS CHANGING")
                                        //postPositions[index2] = geometry.frame(in: .global).minY
                                        
                                    }
                            }
                        }
                        .onAppear{
                            feedVM.canScroll = true
                            print("POST POSITIONS 0")
                            print(postPositions[0]);
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                if(postPositions[0] > 200 && postPositions[0] < 700 && feedVM.youtubePlayers[0].state != nil){
                                    // if(!feedVM.youtubePlayers[0].isPlaying){
                                    print("TRYING TO PLAY")
                                    print(feedVM.youtubePlayers[0].isPlaying)
                                    feedVM.youtubePlayers[0].play()
                                    //s}
                                }
                            }
                            
                            
                        }
                        .onChange(of: athleteVM.feedOrCommentSection){ value in
                            if(player?.state != nil){
                                if(athleteVM.feedOrCommentSection == 2){
                                    print("PAUSING")
                                    player?.pause()
                                }
                                else if(athleteVM.feedOrCommentSection == 1){
                                    player?.play()
                                }
                            }
                        }
                        .onBecomingVisible{ avgY in

                            print("POST POSITIONS FOR INDEX: " + String(index2 + 1))
                            print("POST IS VISIBLE: "  + String(avgY > 200 && avgY < 600))
                            postPositions[index2] = avgY
                            if(index2 == 4){
                                print("FOR 4: " + String(Double(avgY)))
                            }
                            if(avgY > 200 && avgY < 700 && player != nil && player?.state != nil){
                                print("BRO AVG Y IS: " + String(avgY))
                                //if(!player!.isPlaying){
                                print("STARTING THE PLAYER FOR: " + String(Double(index2)))
                                let index2 = feedVM.post_with_videos.firstIndex(where: { $0 == post.post_id})
                                var player = index != nil ? feedVM.youtubePlayers[index ?? 0] : nil
                                print(index2)
                                print(player == nil)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                    player?.play(){ completed in
                                        print("STARTING THE PLAYER DONE: ")
                                        
                                        if(index2 == 0 && self.feedVM.videosHaveLoaded == false ){
                                            print(feedVM.youtubePlayers[0].isPlaying)
                                            print(feedVM.youtubePlayers[0].state)
                                            feedVM.youtubePlayers[0].play()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                                if(!feedVM.youtubePlayers[0].isPlaying){
                                                    feedVM.youtubePlayers[0].play()
                                                    feedVM.youtubePlayers[0].play()
                                                    
                                                }
                                            }
                                            
                                            self.feedVM.videosHaveLoaded = true
                                        }
                                        
                                        
                                    }
                                }
                                
                                //}
                                
                            }
                            else{
                                if(player?.state != nil){
                                    print("SHOULD BE PAUSING FOR " + String(index2))
                                    
                                    player?.pause()
                                }
                            }
                        }
                        
                        //                .onChange(of: postPositions[0], perform: { _ in
                        //                    print("POST POSITIONS 0 is changing")
                        //                    print(postPositions[0])
                        //                })
                        .padding(.top)
                    }
                }
                else{
                    LoadingFeedView()
                }
            }
        }
        .scrollDisabled(!feedVM.canScroll)


        .onAppear{
            if(feedVM.youtubePlayers[0] == nil || feedVM.youtubePlayers[0].state == nil){
                print("START CHECKING")
                startChecking()
            }
        }


        
        .frame(width: deviceWidth)
        .listStyle(.plain) // Set the list style to plain
        .padding() // Apply padding to the VStack
    }
    private func startChecking() {
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            checkYoutubePlayerState()
        }
    }

    private func stopChecking() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            print("YOUTUBE PLAYER NOT NIL")
            showPosts = true
        }
        timer?.invalidate()
        timer = nil
    }
    private func checkYoutubePlayerState() -> Bool{
        if(feedVM.youtubePlayers[0] == nil){
            return false
        }
        if(feedVM.youtubePlayers[0].state != nil){
            stopChecking()
        }
        return feedVM.youtubePlayers[0].state == nil
    }
}
public extension View {
    
    func onBecomingVisible(perform action: @escaping (Double) -> Void) -> some View {
        modifier(BecomingVisible(action: action))
    }

}

private struct BecomingVisible: ViewModifier {
    
    @State var action: ((Double) -> Void)

    func body(content: Content) -> some View {
        content.overlay {
            GeometryReader { proxy in
                let avgY = (proxy.frame(in: .global).minY + proxy.frame(in: .global).maxY) / 2
                Color.clear
                    .preference(
                        key: VisibleKey.self,
                        // See discussion!
                        value: avgY > 200 && avgY < 700//.intersects(proxy.frame(in: .global))
                    )
                    .onPreferenceChange(VisibleKey.self) { isVisible in
                        print("isVisible: " + String(isVisible))
                        print("PREFERENCE IS CHANGING")
                        //guard isVisible, let action else { return }
                        action(avgY)
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

