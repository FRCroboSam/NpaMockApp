//
//  highlightview.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/26/24.
//

import SwiftUI

struct EventTypeView: View {
    let image_name: String
    let text: String

    var body: some View {
        
        ZStack(alignment: .bottomTrailing){
            Image(image_name)
                .resizable()
                .cornerRadius(10)
                .frame(width: 5/9 * deviceWidth, height:130)

                .scaledToFill()
                //.opacity(0.8)
                .brightness(-0.1)

            VStack(alignment: .leading){

                HStack{
                    VStack(alignment: .leading){
                        Text(text)
                            .font(.title2)
                            .foregroundStyle(.white)
                            .bold()
                            .shadow(color: .black, radius: 3)
                            .foregroundStyle(.white)
                        Text("Ages 13 - 18")
                            .foregroundStyle(.white)
                            .shadow(color: .black, radius: 3)
                            .padding(.bottom, 10)
                    }
                    //.padding(.leading, 10)
                    Spacer()
                }
                //.offset(x: -50)
                .frame(width: 5/9 * deviceWidth)
//                .background{
//                    Color.gray
//                        .opacity(0.3)
//
//                }
                .roundedCorner(10, corners: .allCorners)
                
                
            }
            .frame(width: 1/2 * deviceWidth)
                

        }//.frame(width: 1/2 * deviceWidth, height: 200)
    }
}

#Preview {
    EventTypeView(
        image_name: "games", text: "Showcases")
}
