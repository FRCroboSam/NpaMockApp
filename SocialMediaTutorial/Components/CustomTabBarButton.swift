//
//  CustomTabBarButton.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/3/24.
//

import Foundation
import SwiftUI

struct CustomTabBarButton: View{
    @Binding var current: String
    var text: String
    var imageName: String = ""
    var animation: Namespace.ID
    var body: some View{
        Button(action: {
            withAnimation{current = text}
        }){
            VStack(spacing: 0){
                if(!imageName.isEmpty){
                    Image(systemName: imageName)
                        .font(.system(size: 20))
                        .foregroundStyle(current == text ? Color(hex: "0A66C2") : Color.black.opacity(0.3))
                }
               Text(text)
                    .font(.caption)
                    .foregroundStyle(current == text ? Color(hex: "0A66C2") : Color.black.opacity(0.3))
                    .padding(.bottom, 5)

//                    .frame(height: 35)
//                if current == text{
//                    Rectangle()
//                        .fill(Color(hex: "0A66C2"))
//                        .frame(height: 8)
//                        .padding(.horizontal, 10)
//                        .matchedGeometryEffect(id: "Tab", in: animation)
//                }
//                else{
//                    Rectangle()
//                        .fill(.clear)
//                        .frame(height: 8)
//                        .padding(.horizontal, 10)
//                }
//                ZStack{
//                    VStack(spacing: 0){
//                        Rectangle()
//                            .fill(Color(.clear))
//                            .frame(height: 4)
//                        if current == text{
//                            Rectangle()
//                                .fill(Color(hex: "0A66C2"))
//                                .frame(height: 8)
//                                .padding(.horizontal, 10)
//                                .matchedGeometryEffect(id: "Tab", in: animation)
//                        }
//
//                    }
//                }
            }
            .background{
                if(current == text){
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                        .foregroundColor(Color(UIColor.systemBlue).opacity(0.3))
                        .frame(width: 60, height: 50)
                        //.padding(-10)
                    
                }
            }
            .padding(.horizontal, 10)

        }
    }
}
