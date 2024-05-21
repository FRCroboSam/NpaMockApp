//
//  HomeView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI
import YouTubePlayerKit
struct FeedView: View {
    @EnvironmentObject var vm: FeedVM
    @EnvironmentObject var athleteVM: AthleteVM
    @State var showCommentSection = false
    //    @ObservedObject var postData: ReadJsonData
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    @State var current: CGFloat? = nil // << any initial
    @State var isUp = false
    @State private var translation = CGSize.zero
    @State private var prevTranslation = CGSize.zero
    @State private var lastTranslation: CGSize = CGSize(width: 0, height: 250)
    @State var lastNonZeroTranslation = CGSize.zero
    @State private var peakVelocity = 0.0
    
    @State private var lastStateWasTop = false
    
    
    @State private var notificationCount = 1
    
    let sports = ["All", "Tennis", "Baseball", "Football", "Lacrosse", "Badminton", "Soccer", "Rugby",
                  "Basketball", "Pickleball", "Cross Country", "Track and Field"]
    
    let sort = ["Hot Posts", "New Posts", "Top Posts"]
    @State var selectedSport: String = ""
    @State var sortType: String = ""

    //    @State private var currentPost: Post
    
    var body: some View {
        let blankPost = vm.posts[0]
        NavigationStack{
            VStack(spacing: 0) {
                //NavBar()
                HStack{
                    Image("complete_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 60)
                        .padding(.leading, 10)
                    Spacer()
                    Image(systemName: "plus.app")
                        .font(.title)
                        .padding(.trailing, 15)
                    NavigationLink {
                        InboxView(athletes: athleteVM.athletes)
                    } label: {
                        HStack{
                            Image(systemName: "bell")
                                .foregroundColor(.black)
                                .font(.title)
                                .overlay(alignment: .topTrailing){
                                    if(notificationCount > 0){
                                        Text(String(notificationCount))
                                            .font(.caption)
                                            .bold()
                                            .foregroundStyle(.white)
                                            .padding(8)
                                            .background{
                                                Circle()
                                                    .fill(Color.red)
                                            }
                                            .offset(x: 2, y: -12)
                                    }
                                }
                                .padding(.trailing, 10)

                                
                        }
                        
                    }
                    Spacer()
                        .frame(width: 15)
                    NavigationLink {
                        InboxView(athletes: athleteVM.athletes)
                    } label: {
                        HStack{
                            Image(systemName: "ellipsis.message")
                                .foregroundColor(.black)
                                .font(.title)
                                .overlay(alignment: .topTrailing){
                                    if(notificationCount > 0){
                                        Text(String(notificationCount))
                                            .font(.caption)
                                            .bold()
                                            .foregroundStyle(.white)
                                            .padding(8)
                                            .background{
                                                Circle()
                                                    .fill(Color.red)
                                            }
                                            .offset(x: 2, y: -12)
                                    }
                                }
                                .padding(.trailing, 20)

                                
                        }
                        
                    }
                }
                
                ZStack{
                    ScrollView{
                        Spacer()
                            .frame(height: 10)
                        StoryListView() // Display the list of stories
                        Divider()
                        Spacer()
                            .frame(height: 10)
                        HStack{
                            Spacer()
                                .frame(width: 15)
                            Image(systemName: "flame")
                            //                        .bold()
                                .font(.title)
                                .foregroundStyle(Color(hex: "0077B6").opacity(1.0))
                                .background{
                                    Color(UIColor.systemBlue).opacity(0.2)
                                        .clipped()
                                        .clipShape(.circle)
                                        .frame(width: 40, height: 40)
                                }
                                .padding(.leading, 20)
                            DropdownPicker(value: $sortType, text: "Select a sport: ", color: .white.opacity(0.2), textColor: Color(hex: "0077B6"), items: sort)
                            Spacer()
                            HStack{
                                Text("Filter Sports")
                                    .font(.system(size: 15))
                                    .foregroundStyle(.gray).opacity(1.0)
                                    .lineLimit(1)
                                HStack{
                                    Image(systemName: "line.3.horizontal.decrease")
                                    //.resizable()
                                        .font(.system(size: 20))
                                        .foregroundStyle(.white)
                                        .frame(width: 30, height: 30)
                                        .background{
                                            Color(UIColor.gray).opacity(0.7)
                                                .clipShape(.circle)
                                        }
                                    //                                    Text("Filter")
                                }
                            }
                            .padding(.leading, 5)
                            .padding(5)
                            .background{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color.gray.opacity(0.2))
                            }
                            .padding(.trailing, 30)
                                //.padding(.trailing, 10)
                        }
                        Spacer()
                            .frame(height: 10)
                        
                        PostListView(showCommentSection: false, onCommentTapped: {
                            withAnimation(.default){
                            }
                        }) // Display the list of posts
                        .padding(.top, -30)
                    }
                    .onAppear{
                        //                    lastTranslation.height = 500
                    }
                    //                .navigationTitle("NPA") // Set the navigation title
                    //                .navigationBarItems(trailing: Image(systemName: "bell.badge.fill")) // Add leading and trailing navigation bar items
                    .brightness(vm.showCommentSection ? -0.3 : 0.0)
                    .scrollDisabled(vm.showCommentSection)
                    .zIndex(0)
                    if(vm.showCommentSection){
                        //let x = print("Should be showing comment section ")
                        
                        VStack{
                            Spacer()
                                .frame(height: 200)
                            VStack(spacing: 0){
                                VStack{
                                    Spacer()
                                        .frame(height: 10)
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 50, height: 7)
                                        .foregroundStyle(Color(UIColor.systemGray4))
                                    Spacer()
                                        .frame(height: 20)
                                    Text("Comments")
                                        .bold()
                                    Spacer()
                                        .frame(height: 10)
                                    Divider()
                                        .background(Color.gray)
                                    Spacer()
                                        .frame(height: 10)
                                }
                                .background{
                                    Color.white
                                }
                                .frame(width: deviceWidth)
                                .clipShape(
                                    .rect(
                                        topLeadingRadius: 20,
                                        bottomLeadingRadius: 0,
                                        bottomTrailingRadius: 0,
                                        topTrailingRadius: 20
                                    )
                                )
                                .contentShape(Rectangle())
                                .highPriorityGesture(dragGesture)
                                .offset(
                                    y: lastTranslation.height
                                )
                                
                                
                                VStack {
                                    GeometryReader { geometry in
                                        CommentSectionView(vm: vm.selected_post_vm ?? PostVM(post: blankPost))
                                            .frame(width: deviceWidth, height: scrollViewHeight(for: geometry))
                                            .background(Color.white)
                                            .zIndex(12)
                                    }
                                }
                                .offset(y: self.lastTranslation.height)
                                .background{
                                    Color.white
                                        .frame(width: 2 * deviceWidth)
                                        .offset(y: self.lastTranslation.height)
                                    
                                }
                            }
                            
                        }
                        
                        
                        .onAppear{
                            
                            
                            
                            withAnimation(.easeIn.speed(2.0)){
                                let y = print("SHOWING COMMENT SECTION")
                                lastTranslation.height = 0
                            }
                        }
                    }
                    
                    
                }
                
                
            }
        }
        //.ignoresSafeArea(.all, edges: .top)
    }
        
        func dismissKeyboard(){
            UIApplication.shared.dismissKeyboard()
        }
        func scrollViewHeight(for geometry: GeometryProxy) -> CGFloat {
            let vStackFrame = geometry.frame(in: .global)
            let vStackTop = vStackFrame.minY
            let maxScrollViewHeight = 1/2 * deviceHeight - self.lastTranslation.height
            
            // Calculate the remaining space from the bottom of the device to the bottom of the ScrollView
            let remainingSpace = deviceHeight - maxScrollViewHeight
            
            // Adjust the ScrollView height by adding the remaining space to its maximum height
            return max(deviceHeight - vStackTop, 1/4 * deviceHeight)
        }
        var dragGesture: some Gesture {
            DragGesture()
                .onChanged { value in
                    
                    peakVelocity = max(abs(peakVelocity), abs(value.velocity.height))
                    prevTranslation = translation
                    translation.height = value.translation.height
                    lastTranslation.height += value.translation.height
                    if(abs(value.translation.height) >= 0.01){
                        lastNonZeroTranslation.height = value.translation.height
                    }
                    
                    lastTranslation.height = max(-280, min(lastTranslation.height, 500)) //dont go too far off bottom of the screen
                    
                }
                .onEnded { value in
                    
                    let velocity = value.velocity.height
                    print("Peak Velocity: " + String(Double(peakVelocity)))
                    let isSwipe = lastNonZeroTranslation.height == translation.height
                    var isUp = true;
                    isUp = prevTranslation.height < 0 && translation.height < 0
                    print(isUp ? "UP" : "DOWN")
                    print(isSwipe ? "Swipe" : "")
                    withAnimation(.easeIn){
                        //swiping from the top
                        if(!isUp && isSwipe && abs(peakVelocity) > 700 && lastTranslation.height < 0){
                            self.dismissKeyboard()
                            lastTranslation.height = 0
                        }
                        else if(!isUp && isSwipe && abs(peakVelocity) > 900) {
                            self.dismissKeyboard()
//                            lastTranslation.height = 500
                            withAnimation(.easeOut) {
                                vm.showCommentSection = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.12) {
                                    lastTranslation.height = 500
                                }

                            }
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                                lastTranslation.height =  250
//                            }
                            
                        }
                        else if (lastTranslation.height < -92 || isUp && isSwipe) {
                            lastTranslation.height = -280
                        }
                        else{
                            lastTranslation.height = 0
                        }
                    }
                    peakVelocity = 0
                    
                    
                    
                }
        }
}


//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
