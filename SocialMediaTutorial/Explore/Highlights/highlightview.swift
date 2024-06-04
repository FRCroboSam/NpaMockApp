//
//  highlightview.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/26/24.
//

import SwiftUI

struct highlightview: View {
    @State var url = ""
    @State var text = ""
    var body: some View {
        ZStack(alignment: .bottomLeading){
            if(url.isEmpty){
                Image("top10plays")
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: deviceWidth - 40, height: 200)
                
                    .scaledToFill()
                //.opacity(0.8)
                    .brightness(-0.1)
            }
            else{
                AsyncImage(
                    url: URL(string: url),
                    content: { image in
                        image.resizable()
                            .resizable()
                            .cornerRadius(10)
                            .frame(width: deviceWidth - 40, height: 200)
                        
                            .scaledToFill()
                        //.opacity(0.8)
                            .brightness(-0.1)
                        
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            }

            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 60)
                VStack(alignment: .leading){
                    Text("Featured")
                        .foregroundStyle(.white)
                        .bold()
                        .shadow(color: .black, radius: 3)
                        .foregroundStyle(.white)
                        .padding(.leading, 20)
                    if(text.isEmpty){
                        HStack{
                            VStack(alignment: .leading){
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
                            .padding(.leading, 20)

                            Spacer()
                        }
                    }else{
                        HStack{
                            VStack(alignment: .leading){
                                Text(text)
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
                            .padding(.leading, 20)

                            Spacer()
                        }
                    }
                }
                //.offset(x: -50)
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
