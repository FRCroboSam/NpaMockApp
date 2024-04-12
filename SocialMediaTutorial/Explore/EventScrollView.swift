//
//  ShopScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/12/24.
//

import SwiftUI

struct EventScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10){
                Spacer()
                    .frame(width: 10)
                EventCardVertical(event_url: "https://www.footballcamps.com/media/fbcamps360webcmscom/photos/1458/1458_3.jpg")

                EventCardVertical(event_url:
                            "https://www.ussportscamps.com/media/images/soccer/nike/camps/soxdal_gallerypic3_950x516.jpg"
                )

                EventCardVertical(event_url:
                            "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg"
                )
                EventCardVertical(event_url:
                            "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg"
                )

//                .scaleEffect(0.8)

                
//                .scaleEffect(0.8)

            }
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    EventScrollView()
}
