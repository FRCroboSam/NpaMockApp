//
//  PostTypePopupView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/21/24.
//

import SwiftUI
import NukeUI

struct AddCartNotification: View {
    @EnvironmentObject var vm: FeedVM
    @Binding var itemURL: String
    @State var progress: Double = 0.0
    @Binding var shouldUpdate: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                Text("Added 1 item to cart")
                    .foregroundStyle(.black.opacity(0.6))
                    .font(.title3)
                Spacer()
                LazyImage(url: URL(string:itemURL)) { phase in
                    if let image = phase.image {
                        
                        image.resizable()
                            .resizable()
                            .opacity(0.8)
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipped()
                        //.roundedCorner(8, corners: .allCorners)
                        
                            .tint(Color.gray
                                .opacity(0.2))
                            .shadow(radius: 1)
                        
                    }
                    else{
                        LoadingView(width: 40, height: 40)
                    }
                }
                .padding(.trailing, 80)
            }
            Rectangle()
                .fill(Color.black.opacity(0.6))
                .frame(width: (progress * 13/14 * deviceWidth), height: 2)
                .offset(y: 8)
                .offset(x: -5)
        }

        .padding(.leading, 15)

        
        .frame(width: 13/14 * deviceWidth)
        .padding(.vertical, 8)
        .background{
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.white)
                .shadow(radius: 1)
        }
        .onChange(of: shouldUpdate){value in
            progress = 0.0
            withAnimation(.easeIn(duration: 2.5)){
                progress = 0.9
                
            }
            
        }
    }
}

#Preview {
    PostTypePopupView()
}
