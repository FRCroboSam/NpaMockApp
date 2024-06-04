//
//  AthleteListView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/21/24.
//

import SwiftUI
import YouTubePlayerKit

struct AthleteProfileView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: FeedVM

    @EnvironmentObject var feedVM: FeedVM
    var athlete: Athlete
    @State var athleteHeadline: String = ""
    @State var athlete_text: String = ""
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    @State var current = "Posts"
    @Namespace var animation
    var body: some View {
        VStack(spacing: 5){
            AthleteNavBar(athleteName: athlete.first_name.prefix(1) + ". " + athlete.last_name)
            VStack{
                Spacer()
                    .frame(height: 20)
                HStack(alignment: .top) {
                    Spacer()
                        .frame(width: 20)
                    
                    Image(athlete.profile_img)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 100)
                    
                        .clipped()
//                        .clipShape(Circle())
                        .clipShape(.rect(cornerRadius: 20))
                    VStack(alignment: .leading){

                        HStack(){
                            
                            VStack(alignment: .leading){
                                Text(athlete.first_name.uppercased())
                                    .font(.subheadline)
                                
                                
                                Text(athlete.last_name.uppercased())
                                    .font(.headline)
                            }
                            Spacer()

                            Spacer()
                            Image(systemName: "ellipsis.message.fill")
                                .font(.system(size: 27))
                                .foregroundStyle(.blue)
                                .padding(.trailing, 20)
                            
                            
                        }
                        Spacer()
                            .frame(height: 10)
                        HStack{
                            
                            Text("1.5K Fans ⋅ 32 Following") //⋅
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                            .frame(height: 5)
                        HStack{
                            HStack{
                                Image(systemName: "basketball.fill")
                                Text(athlete.sport )
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                            }

                        }
                        //                    AthleteStatView(athlete: athlete, numPosts: 13, followers: 900, following: 13)
                        
                        
                        //                    Spacer()
                        //                        .frame(height: 10)
                        //
//                        AthleteHeadline(athlete: athlete)
//                            .font(.system(size: 14))

                        
                        //                    Divider()
                        
                    }.padding(.leading, 5)
                    Spacer()
                    
                    
                    
                }
                Spacer()
                    .frame(height: 10)
                //AthleteStatView(athlete: athlete, numPosts: 13, followers: 900, following: 13)
                
                HStack{
                    Button{
                        
                    }label:{
                        Text("Follow")
                            .font(.system(size: 16))
                    }.buttonStyle(BigButtonStyle(height: 30, cornerRadius: 9, color: .blue, padding: 60))
                    
                    Spacer()
                        .frame(width: 10)
                    Button{
                        
                    }label:{
                        HStack(spacing: 5){
                            Image(systemName: "dollarsign.arrow.circlepath")
                                .font(.system(size: 20))
                            Text("Support")
                                .font(.system(size: 16))
                        }
                    }.buttonStyle(BigButtonStyle(height: 30, cornerRadius: 9, color: Color(UIColor.systemGray2), padding: 40))
                    Spacer()
                        .frame(width: 20)
                    
                    
                }

                //.frame(width: deviceWidth, height: 120)
            }
            Spacer()
                .frame(height: 20)
            Spacer()
                .frame(height: 8)
            VStack(spacing: 0){
                HStack(spacing: 0){
                    CustomTabBarButton(current: $current, text: "Posts", animation: animation)
                    CustomTabBarButton(current: $current, text: "Stats", animation: animation)
                    CustomTabBarButton(current: $current, text: "Info", animation: animation)
                    CustomTabBarButton(current: $current, text: "Awards", animation: animation)
                }
                Divider()
                    .frame(height: 2)
                    .overlay(Color(hex: "0A66C2"))
            }
            if(current == "Posts"){
                ScrollView{
                    Text("EIFJ")
                    let post = vm.posts[0]
                    PostView(
                        post: post, postVM: PostVM(post: post), profile_img: post.profile_img,
                        profile_name: post.profile_name,
                        profile_id: post.profile_id,
                        image_or_video: post.image_or_video,
                        like_count: post.like_count,
                        comment_count: post.comment_count,
                        view_count: post.view_count,
                        description: post.description,
                        onCommentTapped: {
                            feedVM.selected_post_vm = PostVM(post: post)
                            feedVM.selected_post_vm.fetchComments(postId: feedVM.selected_post_vm.post.post_id)
                            withAnimation(.easeIn.speed(2.0)){
                                feedVM.showCommentSection = true
                            }

                        }, player: YouTubePlayer(source: .url(post.image_or_video))
                    )
                    
                    //.padding(.top, -20)

                }
                Spacer()

            }
            else if (current == "Stats"){
                VStack{
                    Spacer()
                        .frame(height: 20)
                    Text("2023-24 SEA")
                    Spacer()
                }
                .background{
                    
                }
            }
            else{
                Spacer()
            }

//            .background{
//                Rectangle()
//                    .strokeBorder(Color(UIColor.systemGray5))
//                    .clipShape(
//                        .rect(
//                            topLeadingRadius: 20,
//                            bottomLeadingRadius: 0,
//                            bottomTrailingRadius: 0,
//                            topTrailingRadius: 20
//                        )
//                    )
//            }



        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack{
                        Spacer()
                            .frame(width: 5)
                        Image(systemName: "chevron.down")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                            .rotationEffect(.degrees(90))
                            .padding(.bottom, 10)
                    }
                    .contentShape(Rectangle())
                    
                    //Label("Back", systemImage: "arrow.left.circle")
                }
                
                .contentShape(Rectangle())
            }
        }
        .ignoresSafeArea(.all, edges: .top)


        .onAppear{

        }
    }
}

#Preview {
    
    return AthleteProfileView(athlete: Athlete.defaultAthlete())
        .environmentObject(FeedVM())
}
