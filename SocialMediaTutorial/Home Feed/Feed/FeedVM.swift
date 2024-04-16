
//
//  FetchDataJson.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import Foundation
import YouTubePlayerKit

// FeedVM is the model for collecting all of the posts 
class FeedVM: ObservableObject {
    @Published var posts = [Post]() // Array of posts
    
    @Published var youtubePlayers = [YouTubePlayer]()
    @Published var post_with_videos = [String]()

    @Published var showCommentSection = false
    @Published var selected_post_vm: PostVM?
    
    init() {
//        print("POST LENGTH: " + String(posts.count))
        loadData() // Load the JSON data upon initialization
//        print("POST LENGTH: " + String(posts.count))

    }
    
    func loadData() {
        if let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//            let url = documentDirectoryURL.appendingPathComponent("posts.json")
            guard let url = Bundle.main.url(forResource: "posts", withExtension: "json") else {
                print("json posts file not found")
                return
            }
            print(url)
            let data = try? Data(contentsOf: url)
            let posts = try? JSONDecoder().decode([Post].self, from: data!)
            
            self.posts = posts! // Update the posts array with the decoded data
            var index = 0;
            for post in self.posts {
                if(post.image_or_video.contains("youtube")){
                    var youtubePlayer = YouTubePlayer(source: .url(post.image_or_video))
                    if(index == 0){
                        print("LOADING TEH FIRST VIDEO:  " + post.profile_name)
                        youtubePlayer.load(source: .url(post.image_or_video)) { _ in
////                            youtubePlayer.pause()
                        }
                    }
                    youtubePlayers.append(youtubePlayer)
                    post_with_videos.append(post.post_id)
                    index += 1;

                }
            }

            print(String(self.posts.count))
        }
    }
}
