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
    @State var event_names = [
        "2024 Western Football Showcase",
        "Spokane Football Tryouts",
        "Santa Barbara Football Combine",
        "2024 National Football Recruitment Showcase",
        "Los Angeles Football Combine"
        
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

            HStack{
                Text("Showcases & Competitions")
                    .bold()
                    .font(.title)
                    .padding(.horizontal, 15)
                Spacer()
            }

            VStack {
                Spacer()
                    .frame(width: 20)
                ForEach(urls.indices, id: \.self) { index in
                    EventCardVertical(width: 7/8 * deviceWidth, event_url: urls[index], event_name: event_names[index])
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
