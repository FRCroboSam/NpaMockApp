//
//  ShopScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/12/24.
//

import SwiftUI

struct EventScrollView: View {
    @EnvironmentObject var podcastVM: PodcastVM
    @State private var currentIndex = 0
    @State private var maxPodcastViewHeight: CGFloat = 380
    
    @State private var urls = [
        "https://www.footballcamps.com/media/fbcamps360webcmscom/photos/1458/1458_3.jpg",
        "https://www.ussportscamps.com/media/images/soccer/nike/camps/soxdal_gallerypic3_950x516.jpg",
        "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg",
        "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg"
        
    
    ]
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
            TabView(selection: $currentIndex.animation()) {
                ForEach(urls.indices, id: \.self) { index in
                    EventCardVertical(event_url: urls[index])
                        .padding(10)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(radius: 1)
                                .padding(-10)

                        }
                }
            }
            .frame(height: 320)
            .tabViewStyle(.page(indexDisplayMode: .never))
            Spacer()
                .frame(height: 10)
            Fancy3DotsIndexView(numberOfPages: podcastVM.podcasts.count, currentIndex: currentIndex)
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
    EventScrollView()
        .environmentObject(PodcastVM())
}
