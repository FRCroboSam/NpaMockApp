//
//  ShopScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/12/24.
//

import SwiftUI

struct ShopCategoriesScrollView: View {
    @EnvironmentObject var podcastVM: PodcastVM
    @State private var currentIndex = 0
    @State private var maxPodcastViewHeight: CGFloat = 380
    
    @State private var urls = [
        "model_shoes",
        "apparel",
        "equipment"
    ]
    @State private var titles = [
        "Shoes",
        "Apparel",
        "Equipment"
    ]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            
            HStack {
                Spacer()
                    .frame(width: 20)
                ForEach(urls.indices, id: \.self) { index in
                   ShopCategories(image_name: urls[index], text: titles[index])

                    Spacer()
                        .frame(width: 10)
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
    ShopCategoriesScrollView()
        .environmentObject(PodcastVM())
}
