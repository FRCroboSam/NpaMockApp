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
    @State var showSponsorTypePopup = false
    @EnvironmentObject var feedVM: FeedVM
    var athlete: Athlete
    @State var popupScale = 0.3
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
        ZStack{
            VStack(spacing: 5){
                AthleteNavBar(athleteName: athlete.first_name.prefix(1) + ". " + athlete.last_name)
                ScrollView(.vertical){
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

                                if(!showSponsorTypePopup){
                                    showSponsorTypePopup = true
                                    popupScale = 0.3
                                    withAnimation(.easeIn){
                                        popupScale = 1.0
                                    }
                                }
                                else{
                                    popupScale = 1.0
                                    withAnimation(.easeIn){
                                        popupScale = 0.01


                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                        withAnimation(.easeOut){
                                            showSponsorTypePopup = !showSponsorTypePopup
                                        }

                                    }
                                }

                            
                            
                        }label:{
                            HStack(spacing: 5){
                                Image(systemName: "dollarsign.arrow.circlepath")
                                    .font(.system(size: 20))
                                Text("Support")
                                    .font(.system(size: 16))
                            }
                        }.buttonStyle(BigButtonStyle(height: 30, cornerRadius: 9, color: Color(UIColor.black), padding: 40))
                        Spacer()
                            .frame(width: 20)
                        
                        
                    }
                    
                    //.frame(width: deviceWidth, height: 120)
                    
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

                    }
                    if(current == "Posts"){
                        ScrollView{
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
                            .offset(y: -10)
                            
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
                    else if(current == "Awards"){
                       AwardsView()
                    }
                    else if(current == "Info"){
                        VStack(alignment: .leading){
                            Text("Bio")
                                .font(.title2)
                                .foregroundStyle(.black.opacity(0.7))
                                .padding(.leading, 20)
                                .bold()
                                .underline()
                            
                            Text("James started his career at Cannes, before establishing himself as one of the best players in the French League. In 2023, he moved to Italian League Juventus, where he won 3 State Championship Titles. Today, James wants to play for a top ranked football club that will help him develop his talents to the next level.")
                                .font(.system(size: 15))
                                .frame(width: 8/9 * deviceWidth)
                                .italic()
                                .padding(10)
                                .background{
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white)
                                        .shadow(radius: 1)
                                }
                                .padding(.horizontal, 20)

                            Text("Hear " + athlete.first_name + "'s Story'")
                                .font(.title2)
                                .foregroundStyle(.black.opacity(0.7))
                                .padding(.leading, 20)
                                .bold()

                            StoryCard(post: Post.postFromAthlete(athlete: athlete))
                                .padding(.leading, 25)

                        }
                        .frame(width: 11/12 * deviceWidth)


                    }
                }
                
                
                
            }
            if(showSponsorTypePopup){
                SponsorPopup()
                    .animation(.easeIn, value: popupScale)
                    .scaleEffect(popupScale)
                    .padding(.bottom, -160)
            }
        }

        .onAppear{

        }
    }
}

#Preview {
    
    return AthleteProfileView(athlete: Athlete.defaultAthlete())
        .environmentObject(FeedVM())
}
