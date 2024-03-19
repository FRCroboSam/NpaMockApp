//
//  PostDetailView.swift
//  RedditCommentSection
//
//  Created by Alked Ejupi on 07/11/2021.
//

import SwiftUI

struct CommentSectionView: View {
    @ObservedObject var vm: PostVM
    @State var comment: String = ""
    
    var body: some View {
        VStack(spacing: 0){
            ScrollView {
                if self.vm.loading {
                    ProgressView().progressViewStyle(.circular)
                } else {
                    LazyVStack(spacing:0){
                        ForEach(vm.commentSection, id: \.id){ comment in
                            CommentView(postVM: vm, vm: comment)
                        }
                    }.listRowInsets(EdgeInsets())
                }
            }.listStyle(PlainListStyle())
            
            VStack(spacing: 0){
                Divider()
                if vm.currentParentReply != nil {
                    HStack{
                        Text("Replying to: " + vm.currentParentReply!.comment.displayName)
                        Spacer()
                        Button(action: {
                            withAnimation{self.vm.currentParentReply = nil}
                        }){
                            Image(systemName: "xmark.circle.fill")
                        }
                    }.padding(.horizontal, 5)
                        .padding()
                        .font(.footnote)
                }
                HStack {
                    ZStack{
                        TextEditor(text: $comment)
                        Text(comment).opacity(0).padding()
                    }.shadow(radius: 1)
                        .buttonBorderShape(ButtonBorderShape.capsule)
                        .cornerRadius(10)
                        .ignoresSafeArea(.keyboard,edges: .bottom)
                        .shadow(radius: 2)
                        .frame(height: 60)
                    Button("Send"){
                        self.vm.sendReply(commentText: comment)
                        self.comment = ""
                    }
                }.padding()
                
            }.background(Color.primary.opacity(0.1))
            
        }
        .navigationTitle(Text("Post Detail"))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{vm.fetchComments(postId: "")}
    }
}

//struct PostDetailView_Previews: PreviewProvider {
//    static var previews: some View {
////        CommentSectionView(vm: PostVM(post: Post(image: <#T##String#>, like_count: <#T##Int#>, comment_count: <#T##Int#>, view_count: <#T##Int#>, description: <#T##String#>, profile_img: <#T##String#>, profile_name: <#T##String#>, profile_id: <#T##String#>, post_id: <#T##Int#>))
//    }
//}
