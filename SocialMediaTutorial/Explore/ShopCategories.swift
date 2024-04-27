//
//  ItemCard.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/12/24.
//

import SwiftUI

struct ShopCategories: View {
    let image_name: String
    let text: String
    var body: some View {
            VStack(alignment: .leading){

                Image(image_name)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 200)
                            .clipped()
                        //.roundedCorner(8, corners: .allCorners)
                        
                            .tint(Color.gray)
                        
                            
                    

                
                Spacer()
                    .frame(height: 10)
                VStack(alignment: .leading){
                    Text(text)
                        .font(.headline)
                        .bold()

                        
                    

                }//.padding(.leading, 15)
                
                
                
                
                
            }
            .frame(width: 150)
//            .background{
//                RoundedRectangle(cornerRadius: 20)
//                    .foregroundColor(.white)
//                    .shadow(radius: 1)
//            }
            //.scaleEffect(0.8)

        
    }
}

#Preview {
    ShopCategories(image_name: "apparel", text: "Apparel")
}
