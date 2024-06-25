//
//  ShopScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/12/24.
//

import SwiftUI

struct HighlightScrollView: View {
    @EnvironmentObject var podcastVM: PodcastVM
    @State private var currentIndex = 0
    @State private var maxPodcastViewHeight: CGFloat = 380
    @State var imageURLS = [
        "",
        "https://acpe.edu.au/uploads/2023/01/iStock-1306763779_sport-coaching_male-with-young-players.jpg",
        "https://www.shutterstock.com/image-photo/sport-clothes-store-shopping-mall-600nw-1179384757.jpg",
        "https://www.signiant.com/wp-content/uploads/2020/08/NBA_Basketball_Court-1024x683.png"
    ]
    @State var text = [
        "",
        "Discover Agents and Coaches",
        "Shop Essential Goods",
        "Shop Tickets to Your Favorite Games"
    ]

    var body: some View {
        let timer = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()
        VStack(alignment: .center, spacing: 0){
            TabView(selection: $currentIndex.animation()) {
                ForEach(imageURLS.indices, id: \.self) { index in

                    highlightview(url: imageURLS[index], text: text[index], height: 180)
                        .tag(index)
                        
                }
                highlightview(url: imageURLS.first!, text: text.first!, width: 11/12 * deviceWidth,
                              height: 180)
                    .tag(imageURLS.count)
                    

            }
            .onChange(of: currentIndex) { _value in
                if(currentIndex == imageURLS.count){
                    currentIndex = 0
                }
                    
            }
            
            .frame(height: 180)
            .tabViewStyle(.page(indexDisplayMode: .never))
            Spacer()
                .frame(height: 10)
            Fancy3DotsIndexView(numberOfPages: podcastVM.podcasts.count, currentIndex: currentIndex)
                .offset(y: -24)

        }

        .onReceive(timer) { time in
            withAnimation(.easeIn){
                if(currentIndex < imageURLS.count - 1){
                    currentIndex += 1
                }
                else{
                    currentIndex = 0
                }
            }
               
       }
        
        
//        ScrollView(.horizontal, showsIndicators: false){
//            HStack(spacing: 10){
//                Spacer()
//                    .frame(width: 10)
//                EventCardVertical(event_url: "https://www.footballcamps.com/media/fbcamps360webcmscom/photos/1458/1458_3.jpg")
//
//                EventCardVertical(event_url:
//                            "https://www.ussportscamps.com/media/images/soccer/nike/camps/soxdal_gallerypic3_950x516.jpg"
//                )
//
//                EventCardVertical(event_url:
//                            "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg"
//                )
//                EventCardVertical(event_url:
//                            "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg"
//                )
//
////                .scaleEffect(0.8)
//
//
////                .scaleEffect(0.8)
//
//            }
//        }.scrollIndicators(.hidden)
    }
}

#Preview {
    HighlightScrollView()
        .environmentObject(PodcastVM())
}
