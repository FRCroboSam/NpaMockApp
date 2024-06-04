
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
    @Published var videosHaveLoaded = false
    @Published var youtubePlayers = [YouTubePlayer]()
    @Published var post_with_videos = [String]()

    @Published var showCommentSection = false
    @Published var selected_post_vm: PostVM = PostVM(post: Post.blankPost())
    
    @Published var loggedIn = false;
    @Published var calledLoadData = false;
    
    @Published var videoIds = []
    
    init() {
//        print("POST LENGTH: " + String(posts.count))
        if(!videosHaveLoaded && !calledLoadData){
            loadData() // Load the JSON data upon initialization
        }
//        print("POST LENGTH: " + String(posts.count))

    }
    
    func loadData() {
        if(!calledLoadData){
            calledLoadData = true
            print("LOADING DATA")
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
//                        if(index == 0){
//                            print("LOADING TEH FIRST VIDEO:  " + post.profile_name)
//
////                            youtubePlayer.load(source: .url(post.image_or_video)) { _ in
////                                print("STATE")
////                                print(youtubePlayer.state)
////                                print("PAUSING THE FIRST VIDEO")
////                                self.videosHaveLoaded = true
////                            }
//                        }
                        youtubePlayer.mute()
                        youtubePlayers.append(youtubePlayer)
                        post_with_videos.append(post.post_id)
                        index += 1;
                        
                    }
                    
                }
                
                print(String(self.posts.count))
            }
        }
    }
    
    func fetchVideoIds() {
            let apiKey = Bundle.main.infoDictionary?["Api Key"]  as? String ?? "NO API KEY FOUND"
            print("API KEY: " + apiKey)
            guard let url = URL(string: "https://www.googleapis.com/youtube/v3/search?part=id,snippet&maxResults=30&q=%22tennis-recruiting-videos%22&type=video&key=" + apiKey) else {
                print("Invalid URL")
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                
                do {
                    let response = try JSONDecoder().decode(SearchListResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.videoIds = response.items.compactMap { item in
                            guard let videoId = item.id?.videoId else {
                                return nil
                            }
                            print("VIDEO ID: ")
                            print(videoId)
                            return videoId
                            
                            
                        }
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }.resume()
        }
    }

    struct SearchListResponse: Decodable {
        let items: [SearchResult]
    }

    struct SearchResult: Decodable {
        let id: VideoId?
    }

    struct VideoId: Decodable {
        let videoId: String?
    }
