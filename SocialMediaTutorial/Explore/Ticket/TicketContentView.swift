//
//  TicketsScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/30/24.
//

import SwiftUI

struct TicketContentView: View {
    var urls = [
        "https://cdn.nba.com/manage/2023/01/GettyImages-80420260-2048x1365.jpg",
        "https://lastwordonsports.com/basketball/wp-content/uploads/sites/9/2022/08/MSG.jpeg",
        "https://s.yimg.com/ny/api/res/1.2/Ve2Lz_gYI1YaYhxkvdc5Ng--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTQyNw--/https://s.yimg.com/os/creatr-uploaded-images/2023-10/0d2c75c0-71de-11ee-b66d-8a366cd50616"
    ]
    var body: some View {
        Spacer()
            .frame(height: 20)

        ScrollView(.vertical , showsIndicators: false){
            let filters = [
                "Price",
                "Locations",
                "Categories",
                "Sport",
                "Gender"

            ]

            HStack{
                Text("For You")
                    .bold()
                    .font(.title)
                    .padding(.horizontal, 20)
                Spacer()
                HStack{
                    Text("Filter Events")
                        .font(.system(size: 18))
                        .foregroundStyle(.black).opacity(0.7)
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
                .padding(10)
                .background{
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.gray.opacity(0.2))
                }
                .padding(.trailing, 30)
            }
            Spacer()
                .frame(height: 20)
            EventFilterScrollView(filters: filters)
                .offset(x: 5)
            Spacer()
                .frame(height: 20)
            
            VStack {
                Spacer()
                    .frame(width: 20)
                ForEach(urls.indices, id: \.self) { index in
                    EventCardVertical(event_url: urls[index])
                        .offset(x: -5)
                        //.padding(10)
                    Spacer()
                        .frame(height: 20)

                }
            }
        }.frame(height: 3/4 * deviceHeight)
        
    }
}

#Preview {
    TicketContentView()
}
