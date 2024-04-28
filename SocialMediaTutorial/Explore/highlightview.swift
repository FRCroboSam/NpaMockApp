//
//  highlightview.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/26/24.
//

import SwiftUI

struct highlightview: View {
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Image("top10plays")
                .resizable()
                .cornerRadius(10)
                .frame(width: deviceWidth - 40, height: 200)

                .scaledToFill()
                //.opacity(0.8)
                .brightness(-0.1)

            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 60)
                VStack(alignment: .leading){
                    Text("Featured")
                        .foregroundStyle(.white)
                        .bold()
                        .shadow(color: .black, radius: 3)
                        .foregroundStyle(.white)
                    Text("Top 10 Football Teams")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .bold()
                        .shadow(color: .black, radius: 3)
                        .foregroundStyle(.white)
                    Text("Selection of the best")
                        .foregroundStyle(.white)
                        .shadow(color: .black, radius: 3)
                        .padding(.bottom, 20)
                }
                .offset(x: -50)
                .frame(width: deviceWidth - 20)
//                .background{
//                    Color.gray
//                        .opacity(0.3)
//                        
//                }
                .roundedCorner(10, corners: .allCorners)
                
                
            }
            .frame(width: 8/9 * deviceWidth)
                

        }.frame(width: deviceWidth, height: 200)
    }
}

#Preview {
    highlightview()
}
