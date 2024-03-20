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
    @FocusState var isCommentFocused: Bool
    
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
                    CircularProfileImage(size: 40)
                    HStack{
                        TextField("Add a comment for " + vm.post.profile_name, text: $comment)
                            .focused($isCommentFocused)
                        //Text(comment).opacity(0).padding()
                        Button(action: {
                            self.vm.sendReply(commentText: comment)
                        self.comment = ""
                        }, label: {
                            Image(systemName: "arrow.up.circle")
                                .font(.system(size: 20))
                        })
                    }
                    .modifier(customViewModifier(roundedCornes: 20, startColor: .orange, endColor: .orange, textColor: .white))
                        .padding(5)
                    .onChange(of:isCommentFocused){ value in
                        print(value)
                    }
                    
//                    Button("Send"){
//                        self.vm.sendReply(commentText: comment)
//                        self.comment = ""
//                    }
                }.padding()
                
            }
            
        }
        .navigationTitle(Text("Post Detail"))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{vm.fetchComments(postId: "")}
    }
    
    
}
struct customViewModifier: ViewModifier {
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    var ratio: Double = 5/6

    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .frame(maxWidth: ratio * deviceWidth)
            .padding(3)
            .font(.custom("Open Sans", size: 18))

    }
}
//struct PostDetailView_Previews: PreviewProvider {
//    static var previews: some View {
////        CommentSectionView(vm: PostVM(post: Post(image: <#T##String#>, like_count: <#T##Int#>, comment_count: <#T##Int#>, view_count: <#T##Int#>, description: <#T##String#>, profile_img: <#T##String#>, profile_name: <#T##String#>, profile_id: <#T##String#>, post_id: <#T##Int#>))
//    }
//}
