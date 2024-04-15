//
//  ItemCard.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/12/24.
//

import SwiftUI

struct EventCardVertical: View {
    let event_url: String
    var body: some View {
            VStack(alignment: .leading){
                VStack(alignment: .leading){
//                    Spacer()
                    AsyncImage(
                        url: URL(string: event_url),
                        content: { image in
                            image.resizable()
                                .resizable()
                                .scaledToFill()
                                .frame(width:  3/4 * deviceWidth, height:160)
                                .clipped()
                                .roundedCorner(8, corners: .allCorners)
                                .overlay(alignment: .bottomTrailing) {
                                    Text("Ages 6 - 13")
                                        .bold()
                                        .foregroundStyle(Color.white)
                                        .background{
                                            RoundedRectangle(cornerRadius: 12)
                                                .foregroundStyle(Color.teal.opacity(0.8))
                                                .padding(-10)
                                                .shadow(radius: 3)
                                        }
                                        .offset(x: -15, y: -15)
                                    
                                }
                            
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )//.padding(.trailing, 20)
                    VStack(alignment: .leading, spacing: 0){
                        Text("SAT, MAR 2 - SUN, MAR 11")
                            .font(.caption)
                            .foregroundStyle(.red)
                        HStack{
                            Text("Husky Football Camp 2024")
                                .bold()
                                .font(.system(size: 16))
                        }
                        HStack{
                            VStack(alignment: .leading, spacing: 5){
                                Text("Seattle, WA")
                                
                                    .bold()
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                                Text("3.5K interested · 50 registered")
                                    .font(.system(size: 12))
                                    .foregroundStyle(Color(UIColor.systemGray))

                                Spacer()
                                    .frame(height: 5)
                            }

                        }
                        HStack(){
                            Button{
                                
                            }label:{
                                HStack{
                                    Image(systemName: "star.fill")
                                    Text("Interested")
                                        .font(.system(size: 16))
                                }
                            }.buttonStyle(BigButtonStyle(height: 30, cornerRadius: 9, color: Color(UIColor.systemGray3),textColor: .black, padding: 60))
                            Spacer()
                            Button{
                                
                            }label:{
                                HStack{
                                    Image(systemName: "arrowshape.turn.up.right.fill")
                                }
                            }.buttonStyle(BigButtonStyle(height: 30, cornerRadius: 9, color: Color(UIColor.systemGray3),textColor: .black, padding: 20))
                            
                        }.frame(width: 3/4 * deviceWidth)



                    }//.padding(.leading, 10)
                }
                
            }//.padding(.leading, 20)
//            .frame(width: 3/4 * deviceWidth , height: 80)



        
    }
}

#Preview {
    EventCardVertical(event_url: "https://www.footballcamps.com/media/fbcamps360webcmscom/photos/1458/1458_3.jpg")
}
