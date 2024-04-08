//
//  NpaContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/4/24.
//

import SwiftUI

struct NpaContentView: View {
    @EnvironmentObject var podcastVM: PodcastVM
    @EnvironmentObject var blogVM: BlogVM
    @State private var currentIndex = 0
    @State private var maxPodcastViewHeight: CGFloat = 380
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            DiscoverNavBar(text: "NPA Content")
            Spacer()
                .frame(height: 5)
            ScrollView(){
//                Text("Podcasts")
//                    .font(.title)
//                    .bold()
//                    .padding(.leading, 10)
                VStack(alignment: .center, spacing: 0){
                    Spacer()
                        .frame(height: 15)
                    TabView(selection: $currentIndex.animation()) {
                        ForEach(podcastVM.podcasts.indices, id: \.self) { index in
                            let podcast = podcastVM.podcasts[index]
                            PodcastView(podcast: podcast)
                                .background(
                                    GeometryReader { innerGeometry in
                                        Color.clear.onAppear {
                                            maxPodcastViewHeight = 280
                                            
                                        }
                                    }
                                )
                        }
                    }
                    .frame(height: maxPodcastViewHeight)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    Spacer()
                        .frame(height: 5)
                    Fancy3DotsIndexView(numberOfPages: podcastVM.podcasts.count, currentIndex: currentIndex)
                }
                Spacer().frame(height: 15)
                VStack(alignment: .center){
                    ForEach(blogVM.blogs){ blog in
                        
                        BlogCardView(blog: blog)
//                            .padding(.leading, 20)
                        Spacer()
                            .frame(height: 10)
                    }
                    
                }
                
            }
        }.ignoresSafeArea(.all, edges: .top)
            .scrollIndicators(.hidden)
    }
//    var body: some View {
//      TabView(selection: $currentIndex.animation()) { // 1
//        ForEach(0..<colors.count, id: \.self) { index in
//          colors[index]
//            .tag(index)
//        }
//      }
//      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
//
//      .tabViewStyle(PageTabViewStyle())
//      .background(Color.white)
//      Fancy3DotsIndexView(numberOfPages: colors.count, currentIndex: currentIndex) // 2
//            .padding()
//             .background(Color.green)
//             .clipShape(Capsule())
//        
//    }
}

#Preview {
    NpaContentView()
        .environmentObject(PodcastVM())
        .environmentObject(BlogVM())
    
}
