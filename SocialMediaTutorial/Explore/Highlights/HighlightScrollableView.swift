//
//  ShopScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/12/24.
//

import SwiftUI

struct HighlightScrollableView: View {
    @EnvironmentObject var podcastVM: PodcastVM
    @State private var currentIndex = 0
    @State private var maxPodcastViewHeight: CGFloat = 380
    @State var imageURLS = [
        "",
        "https://res.cloudinary.com/treiner/image/upload/c_fill,f_auto,g_face,h_300,q_auto:best,w_900/q6upvlzfcgu7eu0wvmvl",
        "https://res.cloudinary.com/treiner/image/upload/c_fill,f_auto,g_face,h_300,q_auto:best,w_900/q6upvlzfcgu7eu0wvmvl",
        "https://www.signiant.com/wp-content/uploads/2020/08/NBA_Basketball_Court-1024x683.png"
    ]
    @State var text = [
        "",
        "Discover Agents and Coaches",
        "Shop Essential Goods",
        "Shop Tickets to Your Favorite Games"
    ]

    var body: some View {
        
        ScrollView(.horizontal){
            HStack{
                Spacer()
                    .frame(width: 20)
                ForEach(imageURLS.indices, id: \.self) { index in

                    highlightview(url: imageURLS[index], text: text[index], width: 2/3 * deviceWidth)
                    Spacer()
                        .frame(width: 10)
                    
                }
            }
            .frame(height: 150)

        }
        .scrollIndicators(.hidden)
        
        
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
    HighlightScrollableView()
        .environmentObject(PodcastVM())
}
