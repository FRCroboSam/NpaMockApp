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
            .frame(height: 20)

        ScrollView(.vertical , showsIndicators: false){
            EventFilterScrollView()
            Spacer()
                .frame(height: 20)
            HStack{
                Text("For You")
                    .bold()
                    .font(.title)
                    .padding(.horizontal, 20)
                Spacer()
                HStack{
                    Text("Filter Events")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray).opacity(1.0)
                        .lineLimit(1)
                    HStack{
                        Image(systemName: "line.3.horizontal.decrease")
                        //.resizable()
                            .font(.system(size: 20))
                            .foregroundStyle(.white)
                            .frame(width: 30, height: 30)
                            .background{
                                Color(UIColor.gray).opacity(0.7)
                                    .clipShape(.circle)
                            }
                        //                                    Text("Filter")
                    }
                }
                .padding(.leading, 5)
                .padding(5)
                .background{
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.gray.opacity(0.2))
                }
                .padding(.trailing, 30)
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
