//
//  FetchDataJson.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import Foundation
import SwiftUI
// Struct for representing a post


// PostVM is the viewmodel for the
class PostVM: ObservableObject {
    
    @Published var comments: [Comment] = []
    @Published var post: Post
    @Published var loading: Bool
    @Published var currentParentReply: CommentVM?
    //represents the root of the comments
    @Published var root: CommentVM = CommentVM(comment: Comment(commentId: "root", parentId: "", content: "", displayName: "", created: "", likes: 0))
    @Published var commentSection: [CommentVM] = []
    
    init(post: Post){
        self.post = post 
        self.loading = true
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
    func fetchComments(postId: String) {
        //TODO: fetch comments using post id
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        print("POST ID: " + postId)
        if let documentsURL{
            do {
                let fileURL = documentsURL.appendingPathComponent("comments.json")
                print("FILE EXISTS: " + String(FileManager.default.fileExists(atPath: fileURL.path)))
                if(!FileManager.default.fileExists(atPath: fileURL.path)){
                    copyFileFromBundleToDocumentsFolder(sourceFile: "comments.json") //-> when you need to reset comments

                }
//                let contents = try FileManager.default.contentsOfDirectory(atPath: url.path)
//                print("\(contents.count) files inside the document directory:")
//                for file in contents {
//                    print(file)
//                }
                  print(fileURL)
                if let commentsData = try? Data(contentsOf: fileURL) {
                    self.comments = try! JSONDecoder().decode([Comment].self, from: commentsData)
                    self.comments = comments.filter { $0.parentId == postId } //makes sure the comment is for the specific post

                    self.root.addAllChildren(children: comments.map{CommentVM(comment: $0)})

                } else {
                    // Handle if the file does not exist or cannot be read
                }
                flatTree()
            } catch {
                print("Could not retrieve contents of the document directory.")
            }
        }
        self.loading = false
    }
    

    public func flatTree(){
        self.commentSection = CommentVM.preorder(root)
        self.commentSection.removeFirst()
    }
    
    public func replyToPost(commentText: String, postId: String){
        let comment_obj = Comment(commentId: UUID().uuidString, parentId: postId, content: commentText, displayName: "Admin", created: Date().ISO8601Format().description, likes: 0)
        let comment = CommentVM(comment: comment_obj)
        comment.depth = 1
        comment.padding = 1
        withAnimation{commentSection.insert(comment, at: 0)}
        writeToComments(comment: comment_obj )
        withAnimation{ self.currentParentReply = nil }
    }
    
    public func replyToComment(commentText: String, parentId: String ){
        let comment_obj = Comment(commentId: UUID().uuidString, parentId: parentId, content: commentText, displayName: "Admin", created: Date().ISO8601Format().description, likes: 0)
        let comment = CommentVM(comment: comment_obj)
        
        //It's a reply
        if let parent = self.currentParentReply {
            // set depth
            // TODO: duplicated code, remove and use addChild(...)
            comment.comment.parentId = parent.comment.commentId //remove when using Api
            comment.depth = parent.depth! + 1
            comment.padding = parent.padding + 1
            
            if let index = parent.getCommentIndex(from: commentSection, comment: parent) {
                withAnimation{commentSection.insert(comment, at: index+1)}
            }
        }
        writeToReplies(comment: comment_obj )
        withAnimation{ self.currentParentReply = nil }

    }
    public func writeToReplies(comment: Comment){
        if let commentData = try? JSONEncoder().encode(comment) {
            // Get the file URL of your comments.json file
            // Assuming 'comment' is an instance of your Comment struct or class
            // Get the document directory URL
            if let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectoryURL.appendingPathComponent("replies.json")
                
                // Read existing comments from the file if it exists
                if var commentsData = try? Data(contentsOf: fileURL) {
                    // Find the index of the last occurrence of '}'
                    if let lastIndex = commentsData.lastIndex(of: UInt8(ascii: "}")) {
                        commentsData.insert(contentsOf: ",".data(using: .utf8)!, at: lastIndex + 1)
                        if let newLastIndex = commentsData.lastIndex(of: UInt8(ascii: ",")){
                            if let commentData = try? JSONEncoder().encode(comment) {
                                // Insert the new comment data right after the last '}'
                                commentsData.insert(contentsOf: commentData, at: newLastIndex + 1)
                                
                                // Write the modified data back to the file
                                do {
                                    try commentsData.write(to: fileURL)
                                } catch {
                                    print("Error writing to file:", error)
                                }
                            }
                        }

                    }
                } else {
                    // Handle if the file does not exist or cannot be read
                }
            }

        } else {
            print("Error encoding comment to JSON data.")
        }
    }
    public func writeToComments(comment: Comment){
        if let commentData = try? JSONEncoder().encode(comment) {
            // Get the file URL of your comments.json file
            // Assuming 'comment' is an instance of your Comment struct or class
            // Get the document directory URL
            if let documentDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectoryURL.appendingPathComponent("comments.json")
                
                // Read existing comments from the file if it exists
                if var commentsData = try? Data(contentsOf: fileURL) {
                    // Find the index of the last occurrence of '}'
                    if let lastIndex = commentsData.lastIndex(of: UInt8(ascii: "}")) {
                        commentsData.insert(contentsOf: ",".data(using: .utf8)!, at: lastIndex + 1)
                        if let newLastIndex = commentsData.lastIndex(of: UInt8(ascii: ",")){
                            if let commentData = try? JSONEncoder().encode(comment) {
                                // Insert the new comment data right after the last '}'
                                commentsData.insert(contentsOf: commentData, at: newLastIndex + 1)
                                
                                // Write the modified data back to the file
                                do {
                                    try commentsData.write(to: fileURL)
                                } catch {
                                    print("Error writing to file:", error)
                                }
                            }
                        }

                    }
                } else {
                    // Handle if the file does not exist or cannot be read
                }
            }

        } else {
            print("Error encoding comment to JSON data.")
        }

    }

    
    public func reply(currentParentReply: CommentVM){
        withAnimation{ self.currentParentReply = currentParentReply }
    }
}
