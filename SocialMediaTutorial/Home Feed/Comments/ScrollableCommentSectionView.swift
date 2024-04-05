////
////  ScrollableCommentSectionView.swift
////  NpaMockApp
////
////  Created by Samuel Wang on 4/4/24.
////
//
//import Foundation
//import SwiftUI
//
//
//TODO: uncomment, fix errors, and reintegrate into FeedView and the athlete profile view 
//struct ScrollableCommentSectionView: View{
//    var body: some View{
//        VStack{
//            Spacer()
//                .frame(height: 200)
//            VStack{
//                Spacer()
//                    .frame(height: 10)
//                Text("Comments")
//                Spacer()
//                    .frame(height: 10)
//                Divider()
//                    .background(Color.gray)
//                Spacer()
//                    .frame(height: 10)
//            }
//            .background{
//                Color.white
//            }
//            .frame(width: deviceWidth)
//            .clipShape(
//                .rect(
//                    topLeadingRadius: 20,
//                    bottomLeadingRadius: 0,
//                    bottomTrailingRadius: 0,
//                    topTrailingRadius: 20
//                )
//            )
//            .contentShape(Rectangle())
//            .highPriorityGesture(dragGesture)
//            .offset(
//                y: lastTranslation.height
//            )
//            
//            VStack {
//                GeometryReader { geometry in
//                    CommentSectionView(vm: vm.selected_post_vm ?? PostVM(post: blankPost))
//                        .frame(width: deviceWidth, height: scrollViewHeight(for: geometry))
//                        .background(Color.white)
//                        .zIndex(12)
//                }
//            }
//            .offset(y: self.lastTranslation.height)
//            
//        }
//    }
//}
