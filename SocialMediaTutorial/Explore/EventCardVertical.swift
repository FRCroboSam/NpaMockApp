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
                                .frame(width:  140, height:100)
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
                            .font(.caption2)
                            .foregroundStyle(.red)
                        HStack{
                            Text("Husky Football Camp ")
                                .font(.system(size: 13))
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
                                    .font(.system(size: 10))
                                    .foregroundStyle(Color(UIColor.systemGray))
                                Text("Ages 6 - 13")
                                    .font(.system(size: 10))
                                    .foregroundStyle(Color(UIColor.systemGray))
                                Spacer()
                                    .frame(height: 5)

                                Spacer()
                            }

                        }
                        


                    }//.padding(.leading, 10)
                }
                
            }//.padding(.leading, 10)
//            .frame(width: 3/4 * deviceWidth , height: 80)



        
    }
}

#Preview {
    EventCardVertical(event_url: "https://www.footballcamps.com/media/fbcamps360webcmscom/photos/1458/1458_3.jpg")
}
