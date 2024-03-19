//
//  CommentView.swift
//  RedditCommentSection
//
//  Created by Alked Ejupi on 07/11/2021.
//

import SwiftUI

struct CommentView: View {
    @ObservedObject var postVM : PostVM
    @ObservedObject var vm: CommentVM
    
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    var body: some View {
        HStack{
            
            if vm.padding != 1{
                ForEach((1...Int(vm.padding)-1).reversed(), id: \.self) { i in
                    Rectangle().frame(width: 1)
                        .foregroundColor(Color(UIColor.lightGray).opacity(0.5))
                        .padding(.leading, 5)
                        .opacity(self.vm.padding == 1 ? 0 : 1)
                }
            }
            
            VStack {
                HStack(alignment: .top ) {
                    CircularProfileImage(size: 30)
                    VStack(alignment: .leading) {
                        HStack{
                            Text(vm.comment.displayName)
                                .font(.footnote.bold())
                            Text(vm.comment.created.toDate().timeAgoDisplay())

                        }
                        Text(vm.comment.content)
                        Spacer()
                            .frame(height:10)
                        Button(action: {
                            postVM.reply(currentParentReply: vm)
                        }){
                            Text("Reply")
                                .font(.footnote)
                        }

                        if vm.areChildrenShown {
                            EmptyView()
                        }else{
                            HStack{
                                VStack{
                                    Divider()
                                        .frame(width: 1/4 * deviceWidth)
                                }
                                Button("View replies") {
                                    self.vm.fetchReplies(vm: postVM)
                                }
                                Spacer()
                                    
                            }

                        }
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "heart")
                        Spacer()
                            .frame(height: 10)
                        Text(String(vm.comment.likes))
                    }
                    Spacer()
                        .frame(width: 5)
                        
                }
                .font(.footnote)

            }
            .padding(.horizontal, 5)
            .padding(.vertical)
            Spacer()
            
        }.padding(.leading, 5)
    }
}

//struct CommentView_Previews: PreviewProvider {
//    static var vm = PostDetailVM(post: Post(postId: "", content: "Testy test my post is amazing", displayName: "My beautiful display name", created: "2021-09-18T11:21:35Z", likes: 2))
//    static var previews: some View {
//        CommentView(postDetailVM: vm, vm: CommentVM(comment: Comment(commentId: "dd", parentId: "test", content: "Hello everyon", displayName: "myName", created: "2021-10-31T03:31:52Z", likes: 3)))
//    }
//}
