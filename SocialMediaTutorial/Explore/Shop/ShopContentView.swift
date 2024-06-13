//
//  ShopContentVIew.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/30/24.
//

import SwiftUI

struct ShopContentView: View {
    @State private var tabs: [String] = [
        "For You",
        "Sports Gear",
        "Shoes",
        "Apparel",
        "Supplements",
        "Courses"
    ]
    @State private var images: [String] = [
        "For You",
        "Sports Gear",
        "Shoes",
        "Apparel",
        "Supplements",
        "Courses"
    ]
    @State var selectedCategory = "For You"
    var item_urls = [
        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQ6tVuA-Ms1ouo00cL5xRgvs1xEXaAUvx77zRoms1qVgoWbQtxxls7k_ccQs3Q7W0cQ4X73rdG8RxXQ33Vrlf5gOO1dvtSgbeDtKbJjeNgY3fo8c0l6Jigqnw&usqp=CAE",
        "https://dks.scene7.com/is/image/dkscdn/24NIKAPHNTMGXLTFGNTHA_Red_White_is/?wid=252&hei=252&qlt=85,0&fmt=jpg&op_sharpen=1",
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS6qS0Vy-LZjb0kgsk-HCs5Do8Jp80me3kVr4s9psAl-pTYzFs04QBnALgbbV4PtnaX4icrG2RExoUh6LJSP9gBRvdAC-nr3T0Be9CkwbAImXBSxB_H8EUxMA&usqp=CAE",
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ6F3cFfQuyEjlFnLDR-rr0bAWLL12zrPkEmfTAki-VibRkwdJpnmeMccz_VddryRhozYgrgN8Dqax-tdwDv1DYIwQjVacTwxPcN5aXl2E&usqp=CAE",
        "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSiQJ-EclFfDBq70tSirQZg8QDjfgo32fOOVRx3Wg0TiQG820gxvl1D7HwayGPoYO6WrBaM_UcLFSAL-cX_VIzdIw9zO82FlOX_akqx-zRhZBvdoIvKq7vr8Q&usqp=CAE"
    ]
    @State var searchText = ""
    

    
    var body: some View {
        CustomNavBar(title: "Shop")
        Spacer()
            .frame(height: 15)
        CategoryTabView(selection: $selectedCategory, categories: tabs)
        Divider()
            .padding(.top, 5)

        ScrollView(.vertical){
    
        //CategoryTabView(selection: $selectedCategory, categories: categories)
        Spacer()
            .frame(height: 5)
            HStack{
                HStack{
                    Text("Top Nearby")
                        .bold()
                        .font(.title2)
                        .foregroundStyle(.black.opacity(0.8))
                    Image(systemName: "slider.horizontal.3")
                        .foregroundStyle(.gray)
                        .font(.title2)
                        .bold()
                    Spacer()

                }
                .padding(8)
                .padding(.leading, 10)
                HStack(){
                    Spacer()
                    Image(systemName: "location.fill")
                        .font(.headline)

                        .foregroundStyle(.blue)
                    Text("Seattle, WA")
                        .foregroundStyle(.blue)

                }
                .padding(.trailing, 25)
            }


            ForEach(Array(stride(from: 0, to: item_urls.count, by: 2)), id: \.self) { index in
                HStack {
                    let width = 1/3 * deviceWidth + 10
                    let height = 1/5 * deviceHeight
                    ItemCard(item_url: item_urls[index],
                             width: width,
                             height: 1/5 * deviceHeight
                    )
                        .padding(.leading, 5)
                    
                    if (index + 1 < item_urls.count) {
                        ItemCard(item_url: item_urls[index + 1],
                                 width: width,
                                 height: height
                        )

                        .padding(.trailing, 5)

                    }
                }
            }

            Spacer()
                .frame(height: 30)
        }
    }
}

#Preview {
    ShopContentView()
}
