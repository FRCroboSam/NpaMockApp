//
//  ShopTypes.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/30/24.
//

import SwiftUI

struct ShopTypes: View {
    @State var selectedIndex = 0

    var shopTypes = [
        "For You",
        "Apparel",
        "Shoes",
        "Equipment",
        "Sports"
    ]
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                Spacer()
                    .frame(width: 15)
                ForEach(shopTypes.indices, id: \.self) { index in
                    HStack{
                        Text(shopTypes[index])
                            .underline(selectedIndex == index)
                            .foregroundStyle(selectedIndex == index ? .gray : .gray.opacity(0.5)
                            )
                            .onTapGesture {
                                withAnimation(.easeIn){
                                    selectedIndex = index
                                }
                            }
                        
                    }
                        .padding(10)
                        .background{
                            if(selectedIndex == index){
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.gray.opacity(0.2))
                            }
                        }
                    
                }
            }
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    ShopTypes()
}
