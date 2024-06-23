//
//  PostDetailView.swift
//  RedditCommentSection
//
//  Created by Alked Ejupi on 07/11/2021.
//

import SwiftUI
import Combine
struct CommentSectionView: View {
    @Binding var vm: PostVM
    @State var comment: String = ""
    @FocusState var isCommentFocused: Bool
    @State private var keyboardHeight: CGFloat = 0

    @State var replyingToName: String = ""
    @State var replyingToPost: Bool = true // replying to the post by default
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    @State var showReply = false
    
    @State var shouldUpdate = false
    
    var body: some View {
        VStack(spacing: 0){
            ScrollView {
                if self.vm.loading {
                    let _ = print("ACTUAL ACTUAL POST ID: " + vm.post.post_id)
                    //ProgressView().progressViewStyle(.circular)
                    LoadingView(width: 180, height: 200)
                } else {
                    LazyVStack(spacing:0){
                        ForEach(vm.commentSection.indices, id: \.self){ index in
                            CommentView(postVM: vm, vm: vm.commentSection[index], index: calculateIndex(vm: vm.commentSection[index]), IsReplyingName: $replyingToName, shouldUpdate: $shouldUpdate)
                                .frame(width: deviceWidth)
                                .onAppear{
                                    print("INDEX IS: " + String(calculateIndex(vm: vm.commentSection[index])))
                                    
                                }




                        }
                    }.listRowInsets(EdgeInsets())


                }
            }.listStyle(PlainListStyle())

                .frame(width: deviceWidth)
//                .padding(.leading, 40)
                .zIndex(10000)
                .scrollIndicators(.hidden)

            

            
            
            VStack(spacing: 0){
                Divider()
                if !replyingToName.isEmpty {
                    HStack{
                        Text("Replying to: " + replyingToName)
                            .foregroundStyle(.gray.opacity(0.4))
                        Spacer()
                        Button(action: {
                            withAnimation{
                                self.vm.currentParentReply = nil
                                replyingToName = ""
                                print("Setting to nil")
                                
                            }
                        }){
                            Image(systemName: "xmark.circle.fill")
                        }
                    }.padding(.horizontal, 5)
                        .padding()
                        .font(.footnote)

                }

                else{
                    EmptyView()
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
                            replyingToName = ""
                            withAnimation(.easeIn){
                                self.dismissKeyboard()
                            }
                            if(self.vm.currentParentReply != nil ){
                                print("IS REPLYING TO COMMENT")
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
                    
                    .modifier(customViewModifier(roundedCornes: 20, startColor: Color(UIColor.lightGray).opacity(0.3), endColor: Color(UIColor.lightGray).opacity(0.3), textColor: .white))
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
                    .padding(.bottom, 20)
                .offset(x: 20)
                .frame(width: deviceWidth * 2)
                .background(Color.white)
                .zIndex(500)
                    .onAppear{
                        print("ACTUAL POST ID: " + vm.post.post_id)
                        let print =  print("HELLO")
                    }

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
        .onChange(of: self.vm.currentParentReply == nil) { value in
            print("REPLY IS CHANGING: " + String(value))
        }
//        .background{
//            Color.white
//                .animation(.easeIn)
//
//        }
        .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }

        .navigationBarTitleDisplayMode(.inline)
        .onAppear{}
    }
    
    private func dismissKeyboard() {
      UIApplication.shared.dismissKeyboard()
    }
    private func calculateIndex(vm: CommentVM) -> Int{
        let digits = vm.comment.commentId.compactMap { $0.isNumber ? Int(String($0)) : nil }

//                    // Get the last two digits
        if(digits.count >= 2){
            let lastTwoDigits = digits[0] + digits[1] * 10
            print("CALCULATED INDEX: " + String(lastTwoDigits % 13))
            return lastTwoDigits % 13

        }
        else{
           return 0
        }
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
//        CommentSectionView(vm: PostVM(post: Post(image_or_video: "lskdjf", like_count: 12, comment_count: 12, view_count: 12, description: "SDF", profile_img: "WEFS", profile_name: "Bobby", profile_id: "oiuwhjeklrfsdvoiuh4j", post_id:"IOWEJKSD")))
//    }
//}

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
