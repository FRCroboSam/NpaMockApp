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
            HStack(spacing: 10){
                Spacer()
                    .frame(width: 10)
                ItemCard(item_url:
                            "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRMHoylXYTqQxJTpm3st3UivaFvoP8pwT8QmKN8IImioziSA8s0SUjgo_ud-67fqJ2ezZTIO5czBxtCIwGPUZ0UAS2-fDv3YKd72A61y4DtF923A1RPHx4Y&usqp=CAE"
                )
                .padding(.vertical, 10)
//                .scaleEffect(0.8)

                ItemCard(item_url:
                            "https://dks.scene7.com/is/image/dkscdn/24NIKAPHNTMGXLTFGNTHA_Red_White_is/?wid=252&hei=252&qlt=85,0&fmt=jpg&op_sharpen=1"
                )
//                .scaleEffect(0.8)

                
                ItemCard(item_url:
                            "https://www.soccerunlimitedusa.com/wp-content/uploads/2023/04/nike-zoom-mercurial-superfly-9-academy-xxv-mg-soccer-cleats-metallic-silver-black-volt-hyper-pink.jpg"
                )
//                .scaleEffect(0.8)

                ItemCard(item_url:
                            "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ6aD9-eLOZZgaZLpHjve5qVKrikaeuAE4Po5B3-X5q0r8-c2a32QefNCOhlcCQRk9bgbDqWKkkeWJdlOO_NIRqhakHGBOkBDg1IdWajPc&usqp=CAE"
                )
//                .scaleEffect(0.8)

            }
        }
        .frame(height: 180)
        .scrollIndicators(.hidden)

    }
}

#Preview {
    ShopScrollView()
}
