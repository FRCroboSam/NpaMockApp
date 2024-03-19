
//
//  FetchDataJson.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import Foundation


// FeedVM is the model for collecting all of the posts 
class FeedVM: ObservableObject {
    @Published var posts = [Post]() // Array of posts
    @Published var showCommentSection = false 
    @Published var selected_post_vm: PostVM?
    
    init() {
//        print("POST LENGTH: " + String(posts.count))
        loadData() // Load the JSON data upon initialization
//        print("POST LENGTH: " + String(posts.count))


    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "posts", withExtension: "json") else {
            print("json file not found")
            return
        }
        let data = try? Data(contentsOf: url)
        let posts = try? JSONDecoder().decode([Post].self, from: data!)
        
        self.posts = posts! // Update the posts array with the decoded data
        print(String(self.posts.count))
    }
}
