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
        "https://stefanssoccer.com/mm5/graphics/00000001/9/AURORA_DZ3475-800_PHSLH000-2000.jpg",
        "https://dks.scene7.com/is/image/dkscdn/24NIKAPHNTMGXLTFGNTHA_Red_White_is/?wid=252&hei=252&qlt=85,0&fmt=jpg&op_sharpen=1",
        "https://dks.scene7.com/is/image/dkscdn/23ADIAPRDLTLFGPLYCLT_Green_Pink_is/?wid=252&hei=252&qlt=85,0&fmt=jpg&op_sharpen=1",
        "https://stefanssoccer.com/mm5/graphics/00000001/9/AURORA_DZ3475-800_PHSLH000-2000.jpg",
        "https://stefanssoccer.com/mm5/graphics/00000001/9/AURORA_DZ3475-800_PHSLH000-2000.jpg"
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
                        ItemCard(item_url: item_urls[index],
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
