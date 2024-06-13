//
//  NpaContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/4/24.
//

import SwiftUI

struct NpaContentView: View {
    let contentTypes = [
        "All",
        "Videos",
        "Blogs",
        "Podcasts",
    ]
    
    let sports = [
        "NBA",
        "HS Football",
        "Collegiate Football",
        "NFL",
        "MLB",
        "JUCO Football",
        "Soccer"
    ]
    @State var selected = "All"
    
    @State var selectedSport = "NBA"

    
    @EnvironmentObject var podcastVM: PodcastVM
    @EnvironmentObject var blogVM: BlogVM
    @State private var currentIndex = 0
    @State private var query = ""
    @State private var maxPodcastViewHeight: CGFloat = 380
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            CustomNavBar(title: "NPA+ Content", backButtonHidden: false)
                .offset(x: 10)
            Spacer()
                .frame(height: 15)
            CategoryTabView(selection: $selected, categories: contentTypes)
                .padding(.bottom, 8)
            Divider()
            HStack{
                Image(systemName: "slider.horizontal.3")
                    .font(.title2)
                    .padding(10)
                    .foregroundStyle(.gray.opacity(0.9))
//                    .background{
//                        Circle()
//                            .fill(Color.gray.opacity(0.3))
//                    }
                    .padding(.leading, 15)
                    .padding(.trailing, -20)
                CategoryTabView( selection: $selectedSport, categories: sports, fillMode: false, horizontalPadding: 3)
            }
            Spacer()
                .frame(height: 10)
            ScrollView(){
                VStack(alignment: .center, spacing: 0){
                    TabView(selection: $currentIndex.animation()) {
                        ForEach(podcastVM.podcasts.indices, id: \.self) { index in
                            let podcast = podcastVM.podcasts[index]
                            PodcastView(podcast: podcast)
                        }
                    }
                    .frame(height: 200)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    Fancy3DotsIndexView(numberOfPages: podcastVM.podcasts.count, currentIndex: currentIndex)
                        .padding(.top, -15)
                        
                }
                Spacer()
                    .frame(height: 20)

                VStack(alignment: .center){
                    ForEach(blogVM.blogs){ blog in
                        
                        BlogCardView(blog: blog)
//                            .padding(.leading, 20)
                        Spacer()
                            .frame(height: 10)
                    }
                    
                }
                
            }
        }//.ignoresSafeArea(.all, edges: .top)
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
