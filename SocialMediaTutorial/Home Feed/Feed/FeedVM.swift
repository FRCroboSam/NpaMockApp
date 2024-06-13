
//
//  FetchDataJson.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import Foundation
import YouTubePlayerKit
import SwiftUI

// FeedVM is the model for collecting all of the posts
class FeedVM: ObservableObject {
    @Published var videoPosts = [VideoPost]()
    @Published var posts = [Post]() // Array of posts
    @Published var videosHaveLoaded = false
    @Published var youtubePlayers = [YouTubePlayer]()
    @Published var postYoutubePlayers = [YouTubePlayer]()
    @Published var youtubeFeedYoutubePlayers = [YouTubePlayer]()
    let athleteClips = [
        "https://www.youtube.com/watch?v=scoeJXP8dw0",
        "https://www.youtube.com/watch?v=hqXl8zr__tM",
        "https://www.youtube.com/watch?v=_fMmaD8ViL4",
        "https://www.youtube.com/watch?v=WCBP9272z68",
        "https://www.youtube.com/watch?v=8-f9eR9VJ9g"
    ]
    
    @Published var athlete_clip_players = [YouTubePlayer]()
    
    @Published var post_with_videos = [String]()
    
    @Published var defaultFeed = [Post]()

    @Published var showCommentSection = false
    @Published var selected_post_vm: PostVM = PostVM(post: Post.blankPost())
    
    @Published var loggedIn = false;
    @Published var calledLoadData = false;
    
    @Published var videoIds = []
    
    @Published var searchedVideoPosts = [Post]()
    
    init() {
//        print("POST LENGTH: " + String(posts.count))
        if(!videosHaveLoaded && !calledLoadData){
            loadData() // Load the JSON data upon initialization
        }
//        print("POST LENGTH: " + String(posts.count))

    }
    
    func copyFileFromBundleToDocumentsFolder(sourceFile: String, destinationFile: String = "") {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

        if let documentsURL = documentsURL {
            let sourceURL = Bundle.main.bundleURL.appendingPathComponent(sourceFile)

            // Use the same filename if destination filename is not specified
            let destURL = documentsURL.appendingPathComponent(!destinationFile.isEmpty ? destinationFile : sourceFile)

            do {
                try FileManager.default.removeItem(at: destURL)
                print("Removed existing file at destination")
            } catch (let error) {
                print(error)
            }

            do {
                try FileManager.default.copyItem(at: sourceURL, to: destURL)
                print("\(sourceFile) was copied successfully.")
            } catch (let error) {
                print(error)
            }
        }
    }
    
    func loadData() {
        //copyFileFromBundleToDocumentsFolder(sourceFile: "posts.json") //-> when you need to reset posts
        for clip in self.athleteClips{
            var youtubePlayer = YouTubePlayer(source: .url(clip))

            athlete_clip_players.append(youtubePlayer)
            
        }
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
                if let jsonString = String(data: data!, encoding: .utf8) {
                            // Print the JSON string
                            print(jsonString)
                        } else {
                            print("Failed to convert data to String")
                        }
                let posts = try? JSONDecoder().decode([Post].self, from: data!)
                
                self.defaultFeed = posts! // Update the posts array with the decoded data
                self.posts = self.defaultFeed
                var index = 0;
                for post in self.posts {
                    if(post.image_or_video.contains("youtube")){
                        var youtubePlayer = YouTubePlayer(source: .url(post.image_or_video))
//                        if(index == 0){
//                            print("LOADING TEH FIRST VIDEO:  " + post.profile_name)
//
//                            youtubePlayer.load(source: .url(post.image_or_video)) { _ in
//                                print("STATE")
//                                print(youtubePlayer.state)
//                                print("PAUSING THE FIRST VIDEO")
//                                self.videosHaveLoaded = true
//                            }
//                        }
                        youtubePlayer.mute()
                        postYoutubePlayers.append(youtubePlayer)
                        post_with_videos.append(post.post_id)
                        index += 1;
                        
                    }
                    
                }
                self.youtubePlayers = postYoutubePlayers
                
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
                        print("NUM VIDEOS: " + String(response.items.count))
                        self.searchedVideoPosts = response.items.prefix(5).compactMap { item in
                            guard let videoId = item.id?.videoId else {
                                return self.posts[0]
                            }
                            guard let title = item.snippet?.title else{
                                print("CANT FIND TITLE")
                                return self.posts[0]
                            }
                            guard let channelTitle = item.snippet?.channelTitle else{
                                print("CANT FIND TITLE")
                                return self.posts[0]
                            }
                            guard let description = item.snippet?.description else{
                                print("CANT FIND TITLE")
                                return self.posts[0]
                            }
//                            guard let title = item.id?.title else {
//                                return nil
//                            }
                            let url = "https://www.youtube.com/watch?v=" + videoId
                            print("VIDEO ID: ")
                            print(videoId)
                            print("TITLE IS: ")
                            print(title)
                            self.videoPosts.append(VideoPost(title: title, description: description,
                                                        channelTitle: channelTitle, videoId: videoId))
                            
                            return Post.postFromVideo(url: url, profile_name: channelTitle, title: title)
                            
                            
                        }
                        self.saveVideoPosts()

                        

                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }.resume()
        }
    func saveVideoPosts(){
        do {
            // Perform encoding on a background thread
            DispatchQueue.global().async {
                do {
                    let encodedData = try JSONEncoder().encode(self.videoPosts)
                    
                    // Perform UserDefaults operation on the main thread
                    DispatchQueue.main.async {
                        print("SAVING VIDEO POSTS")
                        UserDefaults.standard.set(encodedData, forKey: "VideoPosts")
                    }
                } catch {
                    print("Error encoding video posts: \(error.localizedDescription)")
                }
            }
        } catch {
            print("Error saving video posts: \(error.localizedDescription)")
        }
    }
    func switchFeeds(){
        self.posts = self.searchedVideoPosts
        var index = 0;
        self.post_with_videos.removeAll()
        self.youtubePlayers = self.youtubeFeedYoutubePlayers
        for post in self.posts {
            if(post.image_or_video.contains("youtube")){
                var youtubePlayer = YouTubePlayer(source: .url(post.image_or_video))

                self.post_with_videos.append(post.post_id)
                index += 1;
                
            }
            
        }
    }
    func switchToDefault(){
        self.posts = self.defaultFeed
        var index = 0;
        self.youtubePlayers = self.postYoutubePlayers
        self.post_with_videos.removeAll()
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
                //youtubePlayer.mute()
//                self.youtubePlayers.append(youtubePlayer)
                self.post_with_videos.append(post.post_id)
                index += 1;
                
            }
            
        }
    }
    
    
        func loadVideoIds(){

            if let savedData = UserDefaults.standard.data(forKey: "VideoPosts") {

                do {
                    let videoPosts2 = try JSONDecoder().decode([VideoPost].self, from: savedData)
                    for post in videoPosts2{
                        let url = "https://www.youtube.com/watch?v=" + post.videoId
                        var youtubePlayer = YouTubePlayer(source: .url(url))
                        youtubePlayer.mute()

                        let videoPost = VideoPost(title: post.title, description: post.description,
                                                  channelTitle: post.channelTitle, videoId: post.videoId)
                        self.videoPosts.append(VideoPost(title: post.title, description: post.description,
                                                         channelTitle: post.channelTitle, videoId: post.videoId))
                        self.searchedVideoPosts.append(Post.postFromVideo(url: url, profile_name: post.channelTitle, title: post.title))
                        self.youtubeFeedYoutubePlayers.append(youtubePlayer)
                    }
                    print("VIDEO POST COUNT" + String(videoPosts.count))
                } catch {
                    print("Error decoding video posts: \(error.localizedDescription)")
                }
            }
            else{
                print("NOTHING FOUND< FETCHING")
                fetchVideoIds()
            }
            
        }
    }


    struct SearchListResponse: Decodable {
        let items: [SearchResult]
    }

    struct SearchResult: Decodable {
        let id: VideoId?
        let snippet:Snippet?
    }

    struct VideoId: Decodable {
        let videoId: String?
    }
    struct Snippet: Decodable{
        let title: String?
        let description: String?
        let channelTitle: String?
        
    }

struct VideoPost: Codable{
    var title: String
    var description: String
    var channelTitle: String
    var videoId: String
}
