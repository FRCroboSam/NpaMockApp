//
//  EventTabContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/28/24.
//

import SwiftUI

struct EventTabContentView: View {
    @State private var urls = [
        "https://www.footballcamps.com/media/fbcamps360webcmscom/photos/1458/1458_3.jpg",
        "https://www.ussportscamps.com/media/images/soccer/nike/camps/soxdal_gallerypic3_950x516.jpg",
        "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg",
        "https://ymcagbw.org/sites/default/files/2019-03/by_thank_you_reception_cover_shot.jpg"
    
    ]
    var body: some View {
        Spacer()
            .frame(height: 50)

        ScrollView(.vertical , showsIndicators: false){
            HStack{
                Text("Top Events for You ")
                    .bold()
                    .font(.title)
                    .padding(.leading, 20)
                Spacer()
                Text("Camps")
                    .font(.title2)
                    .foregroundStyle(Color(hex: "#2E8BC0"))
                Image(systemName: "chevron.down")
                    .font(.subheadline)
                    .foregroundStyle(Color(hex: "#2E8BC0"))
                Spacer()
            }
            Spacer()
                .frame(height: 20)

            
            VStack {
                Spacer()
                    .frame(width: 20)
                ForEach(urls.indices, id: \.self) { index in
                    EventCardVertical(event_url: urls[index])
                        //.padding(10)
                    Spacer()
                        .frame(height: 20)

                }
            }
        }.frame(height: 3/4 * deviceHeight)
        
    }
}

#Preview {
    EventTabContentView()
}
