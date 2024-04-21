//
//  ItemCard.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/12/24.
//

import SwiftUI

struct ItemCard: View {
    let item_url: String
    var body: some View {
            VStack(alignment: .leading){
                HStack(spacing: 0){
                    Image(systemName: "tag")
                    Text("$852")
                    
                }
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                .background{
                    RoundedRectangle(cornerRadius: 15)
                        .strokeBorder(.black)
                }
                .padding(.leading, 10)

                HStack{

                    Spacer()
                }
                Spacer()
                    .frame(height: 20)
                HStack{
                    Spacer()
                    AsyncImage(
                        url: URL(string: item_url),
                        content: { image in
                            image.resizable()
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 50)
                                .clipped()
                                .roundedCorner(8, corners: .allCorners)
                                .background{
                                    Color(UIColor.systemGray6)
                                }
                            
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )//.padding(.trailing, 20)
                    Spacer()
                }

                Spacer()
                    .frame(height: 20)
                VStack(alignment: .leading){
                    
                    Text("Nike Superfly 9")
                        .font(.subheadline)
                    Spacer()
                        .frame(height: 5)
                    HStack(spacing: 0){
                        Text("4.8 ")
                            .font(.system(size: 12))
                        Image(systemName: "star.fill")
                            .font(.system(size: 8))
                        Image(systemName: "star.fill")
                            .font(.system(size: 8))
                        Image(systemName: "star.fill")
                            .font(.system(size: 8))
                        Image(systemName: "star.fill")
                            .font(.system(size: 8))
                    }
                    Text("Men's shoes")
                        .font(.caption)
                        .foregroundStyle(Color(UIColor.lightGray))
                    

                    

                }.padding(.leading, 15)
                
                
                
                
                
            }
            .frame(width: 140, height: 210)
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .shadow(radius: 1)
            }
            //.scaleEffect(0.8)

        
    }
}

#Preview {
    ItemCard(item_url: "https://stefanssoccer.com/mm5/graphics/00000001/9/AURORA_DZ3475-800_PHSLH000-2000.jpg")
}
