//
//  ItemCard.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/12/24.
//

import SwiftUI

struct EventCardHorizontal: View {
    let event_url: String
    var body: some View {
            VStack(alignment: .leading){
                HStack(alignment: .top){
//                    Spacer()
                    AsyncImage(
                        url: URL(string: event_url),
                        content: { image in
                            image.resizable()
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height:100)
                                .clipped()
                                .roundedCorner(8, corners: .allCorners)
                            
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )//.padding(.trailing, 20)
                    Spacer()
                    VStack(alignment: .leading, spacing: 0){
                        Text("SAT, MAR 2 - SUN, MAR 11")
                            .font(.system(size: 8))
                            .foregroundStyle(.red)
                        HStack{
                            Text("Husky Football Camp ")
                                .font(.caption2)
                            Spacer()

                        }
                        HStack{
                            VStack(alignment: .leading){
                                Spacer()
                                    .frame(height: 5)
                                Text("Emerald River Sports")
                                    .font(.system(size: 10))
                                    .opacity(0.5)
                                Text("Seattle, WA ")
                                    .font(.system(size: 8))
                                    .foregroundStyle(Color(UIColor.systemGray))
                                Text("Ages 6 - 13")
                                    .font(.system(size: 8))
                                    .foregroundStyle(Color(UIColor.systemGray))
                                Spacer()
                                    .frame(height: 5)
                                HStack(spacing: 0){
                                    Text("4.8 ")
                                        .font(.system(size: 8))
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 8))
                                }
                                Spacer()
                            }

                        }
                        


                    }//.padding(.leading, 10)
                }
                
            }
            .frame(width: 3/4 * deviceWidth , height: 80)


        Spacer()

        
    }
}

#Preview {
    EventCardHorizontal(event_url: "https://www.footballcamps.com/media/fbcamps360webcmscom/photos/1458/1458_3.jpg")
}
