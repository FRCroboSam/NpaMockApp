//
//  ShopScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/12/24.
//

import SwiftUI

struct ShopScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 0){
                ItemCard(item_url:
                            "https://stefanssoccer.com/mm5/graphics/00000001/9/AURORA_DZ3475-800_PHSLH000-2000.jpg"
                )
//                .scaleEffect(0.8)

                ItemCard(item_url:
                            "https://dks.scene7.com/is/image/dkscdn/24NIKAPHNTMGXLTFGNTHA_Red_White_is/?wid=252&hei=252&qlt=85,0&fmt=jpg&op_sharpen=1"
                )
//                .scaleEffect(0.8)

                
                ItemCard(item_url:
                            "https://dks.scene7.com/is/image/dkscdn/23ADIAPRDLTLFGPLYCLT_Green_Pink_is/?wid=252&hei=252&qlt=85,0&fmt=jpg&op_sharpen=1"
                )
//                .scaleEffect(0.8)

                ItemCard(item_url:
                            "https://stefanssoccer.com/mm5/graphics/00000001/9/AURORA_DZ3475-800_PHSLH000-2000.jpg"
                )
//                .scaleEffect(0.8)

            }
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    ShopScrollView()
}
