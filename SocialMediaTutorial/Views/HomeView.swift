//
//  HomeView.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI
import YouTubePlayerKit
struct HomeView: View {
    @State var showCommentSection = true
    
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    @State var current: CGFloat? = nil // << any initial
    @State var isUp = false
    @State private var translation = CGSize.zero
    @State private var lastTranslation = CGSize.zero
    
    var body: some View {
        
        let items = ["This is the first comment hello my name is samuel tlkjlkjklsdjlkfjll lksj", "What a great catch!", "That was an insane clip!",
                     "This is the first comment", "What a great catch!", "That was an insane clip!",
                     "This is the first comment", "What a great catch!", "That was an insane clip!",
                     "This is the first comment", "What a great catch!", "That was an insane clip!",
                     "This is the first comment", "What a great catch!", "That was an insane clip!",
                     "This is the first comment", "What a great catch!", "That was an insane clip!",
                     "This is the first comment", "What a great catch!", "That was an insane clip!",
                     "This is the first comment", "What a great catch!", "That was an insane clip!"
        ]
        //todo - figured out how to stop scrolling when comment is clicked, now implement the comment section showing up
        NavigationStack {
            //                    ScrollView{
            //                        StoryListView() // Display the list of stories
            //                        PostListView(showCommentSection: false, onCommentTapped: {
            //                            print("COMMENT SECTION SHOWN ")
            //                            showCommentSection = true
            //
            //                        }) // Display the list of posts
            //                    }
            //                    .scrollDisabled(showCommentSection)
            //                    .navigationTitle("NPA+") // Set the navigation title
            //                    .navigationBarItems(leading: Image(systemName: "pencil.and.outline"), trailing: Image(systemName: "bell.badge.fill")) // Add leading and trailing navigation bar items
            //                    .frame(maxHeight: showCommentSection ? 0.25 * deviceHeight : deviceHeight)
            if(showCommentSection){
                ZStack{
                    ScrollView{
                        StoryListView() // Display the list of stories
                        PostListView(showCommentSection: false, onCommentTapped: {
                            showCommentSection = true
                        }) // Display the list of posts
                    }
                    .scrollDisabled(showCommentSection)
                    .zIndex(0)
                    VStack{
                        Spacer()
                            .frame(height: 200)
                        VStack{
                            Spacer()
                                .frame(height: 10)
                            Text("Comments")
                            Divider()
                        }
                        .background{
                            Color.orange
                        }
                        .cornerRadius(20)
                        .contentShape(Rectangle())
                        .highPriorityGesture(dragGesture)
                        .offset(
                            y: lastTranslation.height + 20
                        )

                            VStack {
                                GeometryReader { geometry in
                                    
                                    ScrollView {
                                        ForEach(0..<items.count, id: \.self) { index in
                                            Text("\(index + 1). \(items[index])")
                                                .foregroundColor(.red) // Adjust text color as needed
                                                .padding() // Add padding around each text item
                                        }
                                    }
                                    .frame(width: deviceWidth, height: scrollViewHeight(for: geometry))
                                    .background(Color.orange)
                                    .zIndex(12)
                                }
                            }
                            .offset(y: self.lastTranslation.height)
                        
                        
                    }
                    
                    
                }
            }
        }
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
                    let newValue = value.location.y   // fetch prev !!
                    if let prev = self.current {
                        self.isUp = prev > newValue   // << here !!
                    }
                    self.current = newValue   // store curr !!
                    print(lastTranslation.height)
                    lastTranslation.height += value.translation.height
                    lastTranslation.height = max(-220, min(lastTranslation.height, 500)) //dont go too far off bottom of the screen 
                }
                .onEnded { value in
                    self.current = nil
                    translation = .zero
                    
                }
        }
    }

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

