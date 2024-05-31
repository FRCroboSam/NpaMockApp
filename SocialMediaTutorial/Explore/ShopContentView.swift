//
//  ShopContentVIew.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/30/24.
//

import SwiftUI

struct ShopContentView: View {
    var item_urls = [
        "https://stefanssoccer.com/mm5/graphics/00000001/9/AURORA_DZ3475-800_PHSLH000-2000.jpg",
        "https://dks.scene7.com/is/image/dkscdn/24NIKAPHNTMGXLTFGNTHA_Red_White_is/?wid=252&hei=252&qlt=85,0&fmt=jpg&op_sharpen=1",
        "https://dks.scene7.com/is/image/dkscdn/23ADIAPRDLTLFGPLYCLT_Green_Pink_is/?wid=252&hei=252&qlt=85,0&fmt=jpg&op_sharpen=1",
        "https://stefanssoccer.com/mm5/graphics/00000001/9/AURORA_DZ3475-800_PHSLH000-2000.jpg",
        "https://stefanssoccer.com/mm5/graphics/00000001/9/AURORA_DZ3475-800_PHSLH000-2000.jpg"
    ]
    @State var searchText = ""
    
    var body: some View {
//        HStack {
//            Image(systemName: "magnifyingglass")
//                .foregroundColor(.black)
//            TextField("Shop the latest", text: $searchText)
//                .foregroundColor(.black)
//                .textContentType(.newPassword)
//                .keyboardType(.asciiCapable)
//                .autocorrectionDisabled()
//                .listRowSeparator(.hidden)
//        }.modifier(customViewModifier(roundedCornes: 30, startColor: Color(UIColor.systemGray5), endColor: Color(UIColor.systemGray5), textColor: .black, ratio: 0.95))
        Spacer()
            .frame(height: 35)
        ShopTypes()
            .frame(height: 10)
        Spacer()
            .frame(height: 30)
        Divider()
        Spacer()
            .frame(height: 10)
        EventFilterScrollView()
        
        ScrollView(.vertical){
            ForEach(Array(stride(from: 0, to: item_urls.count, by: 2)), id: \.self) { index in
                HStack {
                    ItemCard(item_url: item_urls[index])
                        .padding(.leading, 20)
                    Spacer()
                        .frame(width: 15)
                    if index + 1 < item_urls.count {

                        ItemCard(item_url: item_urls[index + 1])
                    }
                    Spacer()
                }
                .padding(.bottom, -10)
            }
        }
    }
}

#Preview {
    ShopContentView()
}
