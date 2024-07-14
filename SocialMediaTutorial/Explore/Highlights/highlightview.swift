//
//  highlightview.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/26/24.
//

import SwiftUI
import NukeUI

struct highlightview: View {
    @State var url = ""
    @State var text = ""
    @State var width: Double?
    @State var height: Double?
    var body: some View {
        ZStack(alignment: .bottomLeading){
            if(url.isEmpty){
                Image("top10plays")
                    .resizable()
                    .cornerRadius(10)
                    .frame(width: width ?? 5/6 * deviceWidth, height: height ?? 150)
                    .scaledToFill()
                //.opacity(0.8)
                    .brightness(-0.1)
            }
            else{
                LazyImage(
                    url: URL(string: url)){phase in
                        if let image = phase.image{
                            image.resizable()
                                .resizable()
                                .cornerRadius(10)
                                .frame(width: width ?? 5/6 * deviceWidth, height: height ?? 150)
                            
                                .scaledToFill()
                            //.opacity(0.8)
                                .brightness(-0.1)
                            
                        }
                        else{
                            LoadingView(width: width ?? 5/6 * deviceWidth, height: height ?? 150)
                        }
                    }
            }

            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 55)
                VStack(alignment: .leading){
                    Text("Featured")
                        .foregroundStyle(.white)
                        .bold()
                        .shadow(color: .black, radius: 3)
                        .foregroundStyle(.white)
                        .padding(.leading, 15)
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
                            .padding(.leading, 15)

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
                            .padding(.leading, 15)

                            Spacer()
                        }
                    }
                }
                //.offset(x: -50)
                .frame(width: width ?? 5/6 * deviceWidth)
//                .background{
//                    Color.gray
//                        .opacity(0.3)
//                        
//                }
                .roundedCorner(10, corners: .allCorners)
                
                
            }
            .frame(width: width ?? 5/6 * deviceWidth)
                

        }.frame(height: height ?? 150)
            .padding(.leading, 5)
    }
}

#Preview {
    highlightview()
}
