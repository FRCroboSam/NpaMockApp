//
//  PostDetailView.swift
//  RedditCommentSection
//
//  Created by Alked Ejupi on 07/11/2021.
//

import SwiftUI
import Combine
struct CommentSectionView: View {
    @ObservedObject var vm: PostVM
    @State var comment: String = ""
    @FocusState var isCommentFocused: Bool
    @State private var keyboardHeight: CGFloat = 0

    @State var replyingToId: String = ""
    @State var replyingToPost: Bool = true // replying to the post by default
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
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
                .frame(width: deviceWidth)
                .background(Color.white)
                .offset(x: 20)
            
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
                    //TODO: ADD Dismiss keyboard when the user sends it
                    CircularProfileImage(size: 40, name: vm.post.profile_img)
                        .padding(.leading, 20)
                    HStack{
                        TextField("Add a comment for " + vm.post.profile_name, text: $comment)
                            .focused($isCommentFocused)
                        //Text(comment).opacity(0).padding()
                        Button(action: {
                            withAnimation(.easeIn){
                                self.dismissKeyboard()
                            }
                            if(self.vm.currentParentReply != nil ){
                                self.vm.replyToComment(commentText: comment, parentId: (self.vm.currentParentReply?.comment.commentId)!)
                                self.comment = ""
                                self.vm.currentParentReply = nil
                            }
                            else{
                                self.vm.replyToPost(commentText: comment, postId: vm.post.post_id)
                                self.comment = ""
                                
                            }
                        }, label: {
                            Image(systemName: "arrow.up.circle")
                                .font(.system(size: 20))
                        })
                    }
                    
                    .modifier(customViewModifier(roundedCornes: 20, startColor: .orange, endColor: .orange, textColor: .white))
                        .padding(5)
                        .padding(.trailing, 20)

                    .onChange(of:isCommentFocused){ value in
                        print(value)
                    }
//                    Button("Send"){
//                        self.vm.sendReply(commentText: comment)
//                        self.comment = ""
//                    }
                }.padding()
                .offset(x: 20)
                .frame(width: deviceWidth + 50)
                .background(Color.white)

                if(isCommentFocused){
                    VStack{
                        Spacer()
                            .frame(width: deviceWidth * 2, height: self.keyboardHeight)
                    }
                    .contentShape(Rectangle())
                    .frame(width: deviceWidth * 2)
                    .background(Color.white)
                        
                }

                
            }
            
        }
        .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }

        .navigationTitle(Text("Post Detail"))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{vm.fetchComments(postId: vm.post.post_id)}
    }
    
    private func dismissKeyboard() {
      UIApplication.shared.dismissKeyboard()
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
struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CommentSectionView(vm: PostVM(post: Post(image_or_video: "lskdjf", like_count: 12, comment_count: 12, view_count: 12, description: "SDF", profile_img: "WEFS", profile_name: "Bobby", profile_id: "oiuwhjeklrfsdvoiuh4j", post_id:"IOWEJKSD")))
    }
}

extension Publishers {
    // 1.
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        // 2.
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        // 3.
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}
extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

extension UIApplication {
  func dismissKeyboard() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    } }
