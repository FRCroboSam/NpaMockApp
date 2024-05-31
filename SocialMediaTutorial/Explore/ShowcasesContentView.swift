//
//  ShowcasesContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/30/24.
//

import SwiftUI

struct ShowcasesContentView: View {
    @State var urls = [
        "https://res.cloudinary.com/dzcx399ln/image/upload/f_auto,c_fill,w_1600,h_534/ncsa/wp-content/uploads/2022/12/football-showcases.jpg",
        
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTb8369qHe4VR4d0EdZ2RxgzMvoVLqrrixlzw&s",
        
        "https://res.cloudinary.com/dzcx399ln/image/upload/f_auto,c_fill,w_1600,h_534/ncsa/wp-content/uploads/2024/04/college-camps-and-showcases.jpg",
        "https://stacksports.captainu.com/wp-content/uploads/2020/10/Stack-Korey-Foreman_035.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7KNmBZ8GwZ6p9VIlLFT6SkdNjNidLIKtUTA&s"
    ]
    var body: some View {
        Spacer()
            .frame(height: 20)

        ScrollView(.vertical , showsIndicators: false){
            let filters = [
                "Locations",
                "League",
                "Sport",
                "Ages"

            ]
            EventFilterScrollView(filters: filters)
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
    ShowcasesContentView()
}
