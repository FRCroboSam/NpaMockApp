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
    
    
    @State var selectedFeed = "All"
    
    
    
    @State var showNotifications = false
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
    @State private var lastTranslation: CGSize = CGSize(width: 0, height: 500)
    @State var lastNonZeroTranslation = CGSize.zero
    @State private var peakVelocity = 0.0
    @State var stopTranslating = false
    @State private var lastStateWasTop = false
    
    @State private var showPostTypePopup = false
    


    @State private var notificationCount = 1
    
    let sports = ["All", "Tennis", "Baseball", "Football", "Lacrosse", "Badminton", "Soccer", "Rugby",
                  "Basketball", "Pickleball", "Cross Country", "Track and Field"]
    
    let sort = ["Hot", "New", "Top", "Records"]
    @State var selectedSport: String = ""
    @State var sortType: String = ""
    
    @State var blankPost = PostVM(post: Post.blankPost())
    

    //    @State private var currentPost: Post
    
    var body: some View {
        let blankPost = vm.posts[0]
            NavigationStack{
                ZStack(alignment: .top){
                    VStack(spacing: 0) {
                        //NavBar()
                        Spacer()
                            .frame(height: 15)
                        HStack{
                            Image("complete_logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 60)
                                .padding(.leading, 30)
                            Spacer()
                            ZStack{
                                Button{
                                    withAnimation(.linear){
                                        showPostTypePopup = !showPostTypePopup
                                    }
                                }label: {
                                    Image(systemName: "plus.app")
                                        .font(.title)
                                        .padding(.trailing, 15)
                                        .foregroundStyle(.black)
                                }
                            }
                            Button {
                                //                        print("SHOW NOTIFICATIONS")
                                athleteVM.feedOrCommentSection = 1
                                withAnimation(.easeIn){
                                    athleteVM.feedOrCommentSection = 2
                                    athleteVM.isNotifications = true
                                }
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
                            Button {
                                athleteVM.feedOrCommentSection = 1
                                withAnimation(.easeIn){
                                    print("GOING TO COMMENT")
                                    athleteVM.feedOrCommentSection = 2
                                    athleteVM.isNotifications = false
                                }
                                //InboxView(athletes: athleteVM.athletes)
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
                                        .padding(.trailing, 30)
                                    
                                    
                                }
                                
                            }
                        }
                        
                        ZStack{
                            ScrollView{
                                Spacer()
                                    .frame(height: 10)
                                StoryListView() // Display the list of stories
                                Divider()
                                VStack{
                                    Spacer()
                                        .frame(height: 5)
                                    
                                    ScrollView(.horizontal){
                                        HStack(spacing: 15){
                                            //                            Text("Sponsor and interact with your favorite athletes!")
                                            //                                .bold()
                                            //                                .font(.subheadline)
                                           
                                            HStack(spacing: 0){
                                                Image(systemName: "flame")
                                                //                        .bold()
                                                    .font(.title2)
                                                    .foregroundStyle(Color(hex: "0077B6").opacity(1.0))
                                            
                                                            
                                                DropdownPicker(value: $sortType, text: "Select a sport: ", color: .white.opacity(0.2), textColor: Color(hex: "0077B6"), items: sort)
                                            }

                                            .padding(.vertical, 4)
                                            .padding(.leading, 8)
                                            .padding(.trailing, 5)
                                            .background{
                                                RoundedRectangle(cornerRadius: 15)
                                                    //.strokeBorder(Color(hex: "0A66C2"))
                                                    .fill(
                                                        Color.blue.opacity(0.15))
                                                    //.padding(.leading, 15)


                                            }
                                            .padding(.leading, 20)


                                            Text("All")
                                                .foregroundStyle(.white.opacity(1.0))
                                                .padding(.horizontal, 16)
                                                .padding(.vertical, 12)
                                                .background{
                                                    
                                                    RoundedRectangle(cornerRadius: 15)
                                                        .fill(Color(hex: "0A66C2")).opacity(1.0)
                                                    
                                                    //.strokeBorder(Color(UIColor.systemGray4))
                                                        //.shadow(color: Color(UIColor.gray).opacity(0.6),radius: 1.6)*/
                                                        //.mask(RoundedRectangle(cornerRadius: 15).padding(.bottom, -10))
                                                            //.padding(.horizontal, -10)
                                                        //.shadow(color: Color(UIColor.gray).opacity(0.8), radius: 1.7)
                                                    
                                                }
//                                            Divider()
//                                                .overlay(Color.gray.opacity(0.8)
//                                                    .frame(width: 0.2)
//                                                )
                                            Text("Basketball")
                                                .foregroundStyle(Color(UIColor.systemGray2))
                                                .padding(.horizontal, 14)
                                                .padding(.vertical, 12)
                                                .background{
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(Color.gray.opacity(0.15))
                                                    
                                                    //.strokeBorder(Color(UIColor.systemGray4))
                                                        //.cornerRadius(15)
                                                        //.shadow(radius: 1)
                                                    
                                                }
                                            Text("Soccer")
                                                .foregroundStyle(Color(UIColor.systemGray2))
                                                .padding(.horizontal, 14)
                                                .padding(.vertical, 12)
                                                .background{
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(Color.gray.opacity(0.15))
                                                    
                                                    //.strokeBorder(Color(UIColor.systemGray4))
                                                        //.cornerRadius(15)
                                                        //.shadow(radius: 1)
                                                    
                                                }
                                            Text("Baseball")
                                                .foregroundStyle(Color(UIColor.systemGray2))
                                                .padding(.horizontal, 14)
                                                .padding(.vertical, 12)
                                                .background{
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .fill(Color.gray.opacity(0.15))
                                                    
                                                    //.strokeBorder(Color(UIColor.systemGray4))
                                                        //.cornerRadius(15)
                                                        //.shadow(radius: 1)
                                                    
                                                }
                                            
                                            Text("Men's")
                                                .foregroundStyle(Color.blue)
                                                .padding(.horizontal, 14)
                                                .padding(.vertical, 7)
                                                .background{
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .fill(Color.white)
                                                    
                                                    //.strokeBorder(Color.blue, lineWidth: 2)
                                                        .cornerRadius(15)
                                                }
                                            
                                            
                                            
                                            Text("Basketball")
                                                .foregroundStyle(Color.orange)
                                                .padding(.horizontal, 14)
                                                .padding(.vertical, 7)
                                                .background{
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .fill(Color.white)
                                                    
                                                    //.strokeBorder(.orange)
                                                        .cornerRadius(15)
                                                }
                                            
                                            Text("JUCO")
                                                .foregroundStyle(Color.teal)
                                                .padding(.horizontal, 14)
                                                .padding(.vertical, 7)
                                                .background{
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .fill(Color.white)
                                                    //.strokeBorder(.teal)
                                                        .cornerRadius(15)
                                                }
                                            
                                            
                                            
                                            
                                        }
                                        .padding(10)
                                    }.scrollIndicators(.hidden)
                                    
                                    Divider()

                                }
//                                .background{
//                                    Color.gray.opacity(0.2)
//                                }
//                                Spacer()
//                                    .frame(height: 15)
//                                HStack{
//                                    
//                                    Spacer()
//                                        .frame(width: 15)
//                                    HStack{
//                                        Image(systemName: "flame")
//                                        //                        .bold()
//                                            .font(.title)
//                                            .foregroundStyle(Color(hex: "0077B6").opacity(1.0))
//                                            .background{
//                                                Color(UIColor.systemBlue).opacity(0.2)
//                                                    .clipped()
//                                                    .clipShape(.circle)
//                                                    .frame(width: 40, height: 40)
//                                            }
//                                            .padding(.leading, 20)
//                                        DropdownPicker(value: $sortType, text: "Select a sport: ", color: .white.opacity(0.2), textColor: Color(hex: "0077B6"), items: sort)
//                                    }
//                                    .padding(5)
//                                    
//                                    Spacer()
//                                    Button{
//                                        if(athleteVM.showingFilters){
//                                            athleteVM.startSlidingDown = true
//                                        }
//                                        else{
//                                            athleteVM.showingFilters = true
//                                        }
//                                        
//                                    }label: {
//                                        Image(systemName: "slider.horizontal.3")
//                                            .font(.title2)
//                                            .foregroundStyle(.gray)
//                                            .padding(10)
//                                            .background{
//                                                RoundedRectangle(cornerRadius: 10)
//                                                    .fill(Color.gray.opacity(0.15))
//                                            }
//                                            .padding(.trailing, 30)
//                                    }
//                                    //.padding(.trailing, 10)
//                                }
//                                Spacer()
//                                    .frame(height: 10)
                                
                                PostListView(feedVM: _vm, showCommentSection: false, onCommentTapped: {
                                    print("EXECUTING")
                                    withAnimation(.default){
                                        
                                            vm.showCommentSection = true
                                        lastTranslation.height = 0
                                            
                                        
                                    }
                                }) // Display the list of posts
                                .padding(.top, -50)
                            }
                            .onAppear{
                                //                    lastTranslation.height = 500
                            }
                            //                .navigationTitle("NPA") // Set the navigation title
                            //                .navigationBarItems(trailing: Image(systemName: "bell.badge.fill")) // Add leading and trailing navigation bar items
                            .brightness(vm.showCommentSection ? -0.3 : 0.0)
                            .scrollDisabled(vm.showCommentSection)
                            .zIndex(0)
                            if(true){
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
                                        .zIndex(20000)
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
                                        .animation(.easeIn.speed(0.8), value: self.lastTranslation.height)
                                    
                                        
                                        VStack {
                                            GeometryReader{ geometry in


                                                CommentSectionView(vm: $vm.selected_post_vm)
                                                        .frame(width: deviceWidth, height: scrollViewHeight(for: geometry))
                                                        .zIndex(12)
//                                                        .animation(.easeIn.speed(0.8), value: self.lastTranslation.height)
//                                                        .background{
//                                                            Color.white
//                                                                .frame(width: 2 * deviceWidth)
//                                                                .animation(.easeIn.speed(1.1), value: self.lastTranslation.height)
//
//                                                        }
                                                        .transaction{ $0.disablesAnimations = true}


                                            }

                                        }
                                        .background{
                                            Color.white
                                                .frame(width: 2 * deviceWidth)
                                                .animation(.easeIn.speed(0.8), value: self.lastTranslation.height)


                                        }
//                                        .background{
//                                            Color.white
//                                                .animation(.easeIn.speed(1.2), value: self.lastTranslation.height)
//                                                .offset(y: self.lastTranslation.height > -50 ?
//                                                                self.lastTranslation.height :
//                                                            self.lastTranslation.height + 100)
//                                        }
                                        .animation(.easeIn.speed(0.8), value: self.lastTranslation.height)
                                        .offset(y: self.lastTranslation.height)


                                    }
                                    
                                }
                      .onAppear{
                            
                       
                                    //}
                                }
                        }
                            
                            
                        }
                        
                        
                    }
                    if(showPostTypePopup){
                        PostTypePopupView()
                            .offset(x: 100, y: 120)
                    }
                    
                }
                .zIndex(50)
                
                
                
            }
            
            
            
            //        .navigationBarBackButtonHidden()
            //        .toolbar(.hidden, for: .navigationBar)
            
            //.ignoresSafeArea(.all, edges: .top)
        
        .tag(1)

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
            print(deviceHeight - vStackTop)
            // Adjust the ScrollView height by adding the remaining space to its maximum height
            return max(deviceHeight - vStackTop, 1/4 * deviceHeight)
        }
        var dragGesture: some Gesture {
            DragGesture(minimumDistance: 0.0, coordinateSpace: .global)
                .onChanged { value in
                    print("HEIGHT: " + String(Double(value.translation.height)))
                    if(abs(value.velocity.height) > 100){
//                        print("CHANGING")
                        print("COMMENT SECTION: "  + vm.selected_post_vm.post.post_id)
                        print("CHANGING LAST TRANSLATION AMOUNT: " + String(Double(value.translation.height)))
//                        print("CHANGING LAST VELOCITY: " + String(Double(value.velocity.height)))
                        peakVelocity = max(abs(peakVelocity), abs(value.velocity.height))
                        prevTranslation = translation
                        translation.height = value.translation.height
                        lastTranslation.height = value.translation.height
                        if(abs(value.translation.height) >= 0.01){
                            lastNonZeroTranslation.height = value.translation.height
                        }
                        
                        //lastTranslation.height = max(-280, min(lastTranslation.height, 500)) //dont go too far off bottom of the screen
                    }
                    else{
                        print("VELOCITY IS SLOW: " + String(Double(lastTranslation.height)))
                    }
  
                    
                }
                .onEnded { value in
                    print("ENDED DRAG GESTURE")
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
                            lastTranslation.height = -100
                        }
                        else{
                            lastTranslation.height = 0
                        }
                    }
                    peakVelocity = 0
                    
                    
                    
                }
        }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .environmentObject(FeedVM())
            .environmentObject(AthleteVM())
    }
}
