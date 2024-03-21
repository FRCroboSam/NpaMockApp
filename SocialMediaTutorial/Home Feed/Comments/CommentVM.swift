//
//  CommentVM.swift
//  RedditCommentSection
//
//  Created by Alked Ejupi on 07/11/2021.
//

import Foundation
import SwiftUI

struct Comment: Codable {
    var commentId: String
    var parentId: String
    var content: String
    var displayName: String
    var created: String
    var likes: Int
}

extension Comment: Identifiable {
    var id: UUID {  return UUID() }
}


class CommentVM: ObservableObject, Identifiable {
    
//    var id: String = UUID().uuidString
    public weak var parent: CommentVM?
    public var depth: Int?
    private var replies: [CommentVM] = []

    @Published var comment: Comment
    @Published public var children: [CommentVM] = []
    @Published public var areChildrenShown: Bool = false

    @Published var loading: Bool = false
    @Published var padding: CGFloat = 0
    
    init(comment: Comment){
        self.comment = comment;
        
        if self.parent == nil {
            self.depth = 0
        }
    }
    
    func fetchReplies(vm: PostVM) {
        self.loading = true
        //Todo: provide parent id to fetch replies
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

        
        if let documentsURL{
            do {
                let fileURL = documentsURL.appendingPathComponent("replies.json")
                if(!FileManager.default.fileExists(atPath: fileURL.path)){
                    copyFileFromBundleToDocumentsFolder(sourceFile: "replies.json") //-> when you need to reset comments
                }
                if let replies = try? Data(contentsOf: fileURL) {
                    let replies2 = try! JSONDecoder().decode([Comment].self, from: replies)
                    let filteredReplies = replies2.filter { $0.parentId == self.comment.commentId && $0.commentId != self.comment.commentId }
                    print(self.comment.commentId)
                    addAllChildren(children: filteredReplies.map{CommentVM(comment: $0)})
                    if let index = self.getCommentIndex(from: vm.commentSection, comment: self) {
                        withAnimation{vm.commentSection.insert(contentsOf: self.children, at: index+1)}
                    }
                    self.areChildrenShown = true
                    self.loading = false
                } else {
                }
            }
        }

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
    
    public func addChild(_ node: CommentVM) {
        node.parent = self
        if let depthParent = self.depth {
            node.depth = depthParent + 1
            node.padding = CGFloat(depthParent + 1)
        }
        children.insert(node, at: 0)
    }
    
    public func addAllChildren(children: [CommentVM]) {
        children.forEach{addChild($0)}
    }
    
    public static func preorder(_ node: CommentVM) -> [CommentVM] {
        var list = [CommentVM]()
        helper(&list, node)

        return list
    }
    
    public static func helper(_ list: inout[CommentVM], _ node: CommentVM) {
        list.append(node)
        for n in node.children {
            helper(&list, n)
        }
    }
    
    func getCommentIndex(from: [CommentVM], comment: CommentVM) -> Int? {
        return from.firstIndex(where: { $0 === comment })
    }
}
