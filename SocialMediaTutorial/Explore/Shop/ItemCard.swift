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
                VStack{
                    HStack{
                        
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 40)
                    HStack{
                        Spacer()
                        AsyncImage(
                            url: URL(string: item_url),
                            content: { image in
                                image.resizable()
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 70)
                                    .clipped()
                                //.roundedCorner(8, corners: .allCorners)
                                
                                    .tint(Color.gray)
                                
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )//.padding(.trailing, 20)
                        Spacer()
                        
                    }
                    
                    
                    Spacer()
                        .frame(height: 20)
                }.overlay{
                    Color.gray
                        .opacity(0.2)
                }
                .overlay(alignment: .topLeading){
                    Image(systemName: "cart.badge.plus")
                        .font(.system(size: 18))
                        .foregroundStyle(Color.white)
                        .padding(7)
                        .background{
                            Circle()
                                .fill(Color.black.opacity(0.5))
                        }
                        .offset(x: 5, y: 5)
                    
                }
                .overlay(alignment: .topTrailing){
                    Image(systemName: "heart")
                        .padding(10)
                        .background{
                            Circle()
                                .fill(Color.white)
                        }
                        .offset(x: -5, y: 5)
                    
                }
                Spacer()
                    .frame(height: 10)
                VStack(alignment: .leading){
                    Text("Nike Superfly 9")
                        .font(.subheadline)
                        .bold()
                    Spacer()
                        .frame(height: 5)
                    Text("$852")
                        .foregroundStyle(.gray)
                        
                    

                }//.padding(.leading, 15)
                
                
                
                
                
            }
            .frame(width: 180, height: 210)
//            .background{
//                RoundedRectangle(cornerRadius: 20)
//                    .foregroundColor(.white)
//                    .shadow(radius: 1)
//            }
            //.scaleEffect(0.8)

        
    }
}

#Preview {
    ItemCard(item_url: "https://stefanssoccer.com/mm5/graphics/00000001/9/AURORA_DZ3475-800_PHSLH000-2000.jpg")
}
