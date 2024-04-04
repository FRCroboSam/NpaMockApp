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
    var animation: Namespace.ID
    var body: some View{
        Button(action: {
            withAnimation{current = text}
        }){
            VStack(spacing: 10){
               Text(text)
                    .font(.title2)
                    .foregroundStyle(current == text ? Color(hex: "0A66C2") : Color.black.opacity(0.3))
                    .frame(height: 35)
                if current == text{
                    Rectangle()
                        .fill(Color(hex: "0A66C2"))
                        .frame(height: 8)
                        .padding(.horizontal, 10)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                }
                else{
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 8)
                        .padding(.horizontal, 10)
                }
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
        }
    }
}
