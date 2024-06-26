//
//  ItemCard.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/12/24.
//

import SwiftUI
import NukeUI

struct ItemCard: View {
    @EnvironmentObject var feedVM: FeedVM
    let item_url: String
    @State var itemName: String?
    @State var width: Double?
    @State var height: Double?
    var body: some View {
            VStack(alignment: .leading){
                VStack{
                    Spacer()
                        .frame(height: 20)
                    HStack{
                        Spacer()
                        LazyImage(url: URL(string:item_url)) { phase in
                            if let image = phase.image {
                                
                                image.resizable()
                                    .resizable()
                                    .opacity(0.8)
                                    .scaledToFit()
                                    .frame(width: width ?? 70, height: height ?? 90)
                                    .clipped()
                                //.roundedCorner(8, corners: .allCorners)
                                
                                    .tint(Color.gray
                                    .opacity(0.2))
                                    
                            }
                            else{
                                LoadingView(width: width ?? 70, height: height ?? 90)
                            }
                        }
                        Spacer()
                        
                    }
                    
                }
                .frame(width: (width ?? 120) + 30, height: (height ?? 120) + 30)
                .overlay{
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
                        .onTapGesture{
                            feedVM.performCartAddNotification(itemURL: item_url)
                        }
                    
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
                    .frame(height: 15)
                VStack(alignment: .leading){
                    HStack{
                        Text(itemName ?? "Nike Superfly 9")
                            .font(.subheadline)
                            .bold()
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 5)
                    Text("$852")
                        .foregroundStyle(.gray)
                        
                    

                }//.padding(.leading, 15)
                .frame(width: (width ?? 120) + 30, height: 20)
                .padding(.bottom, 10)
                
                
                
                
                
            }



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
