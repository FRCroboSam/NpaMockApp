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
    @State var index = 0
    @Binding var IsReplyingName: String
    @State var showReply: Bool = false
    @Binding var shouldUpdate: Bool
    
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    let profile_images = [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxbvCckw60lhqRT08xuiWyg4w0DRz3bSc3dQLn-LbawdH6h_SpHRrGZpb91CuryQjY818&usqp=CAU",
        "https://media.licdn.com/dms/image/C5603AQGCJhoQ4_J6sQ/profile-displayphoto-shrink_200_200/0/1654188688869?e=2147483647&v=beta&t=-a4luF1D8vx9QQhukcOi0tSftSY6oEN1Kgsillo0r1A",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcaVf9dWk_g8LLOqkUG7EIbJdWehe_JFUlZ3sAHz4czOL6PLhrKHA0YWLccrNf0Y9-LVg&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZneqVlzbZU6ZuPIU636STtB0IV3hc4-zkvg&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeRKKE01xZoXRmd-sbbLXXDesr93E9hM1crlbtMqKeDi2ddb5-HtveyqEpgk1rZc1SmXo&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAURK2drvCz-EzX2lcL4n0VKyAWv-tpc3dPU7HGatB9mbPog4URRGf7E2K09L5UZXaDlE&usqp=CAU",
        "https://odstcoreprodncus01.blob.core.windows.net/profile/432953/20231104153242_thumbnail-5c72dbdb-757b-4330-bd35-3d69659d623c.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSD_MQw5a3KQ6xwa3e3VGDNhsozpuLvL4TQuGnVrhMxlHm1E4cJVMJt0nVbXAlnP3qE9c4&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZU8LalVnQ4qDEv05DPZPUsIVWl9zek9OdYA&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1OxwhasedAKaO_u5ZJnfSD2R0yZ5v735nmgDF2S2t-KSVybwP5Kc7rZ4uxkGEO_stswo&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_zYUgMK6o7BdI8UX6a0RczdnuUIGUnvpgmA&s",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn_EnLkGSQCtLiQIyKqLyWOPfZaHTryUg9RDDPDYc8RcKv9LIYBf0Td5ZE4FXwcXM6UX8&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3xXQD6ZItHGJU2tFM6zT42NRijhdaWy4g--VveXZ2czSgz2dNeOcJ2UUZoKlEuEu_t60&usqp=CAU"
    
    
    
    ]
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
                    CircularWebProfile(url: profile_images[min(index, profile_images.count)])
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
                            showReply = true
                            IsReplyingName = vm.comment.displayName
                            postVM.reply(currentParentReply: vm)
                        }){
                            Text("Reply")
                                .font(.footnote)
                        }

                        if 1 == 1{
                            HStack{
                                VStack{
                                    Divider()
                                        .frame(width: 1/4 * deviceWidth)
                                }
                                Button(!showReply ? "View replies" : "Hide Replies") {
                                    if(!showReply){
                                        self.vm.fetchReplies(vm: postVM){
                                            print("DONE FETCHING THE REPLIES")
                                            withAnimation(.easeIn){
                                                showReply = true
                                                shouldUpdate = !shouldUpdate
                                            }
                                        }
                                    }
                                    else{
                                        print("HIDING REPLIES")
                                        self.vm.hideReplies(vm: postVM)
                                        withAnimation(.easeIn){
                                            showReply = false
                                            shouldUpdate = !shouldUpdate
                                        }
                                        
                                    }
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
                        
                }
                .onAppear{
                    // Extract all characters that are digits
                    print(vm.comment.commentId)

                    
                }

                .padding(.leading, 20)
                .font(.footnote)

            }
            .padding(.vertical)
            
        }
//        .background{
//            Color.orange
//                .padding(.leading, -200)
//                .frame(width: 2 * deviceWidth)
//
//        }
    }
}

//struct CommentView_Previews: PreviewProvider {
//    static var vm = PostDetailVM(post: Post(postId: "", content: "Testy test my post is amazing", displayName: "My beautiful display name", created: "2021-09-18T11:21:35Z", likes: 2))
//    static var previews: some View {
//        CommentView(postDetailVM: vm, vm: CommentVM(comment: Comment(commentId: "dd", parentId: "test", content: "Hello everyon", displayName: "myName", created: "2021-10-31T03:31:52Z", likes: 3)))
//    }
//}
