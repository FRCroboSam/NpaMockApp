//
//  LoadingView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/12/24.
//

import Foundation
import SwiftUI


struct LoadingFeedView: View{
    @State var startPoint: UnitPoint = .init(x: -1.8, y: -1.2)
    @State var endPoint: UnitPoint = .init(x: 0, y: -0.2)
     @State var width: Double?
     @State var height: Double?
    @State var gradientColors = [
        Color(UIColor.systemGray5),
        Color(UIColor.systemGray3),
        Color(UIColor.systemGray5)

    ]
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 100)
            LinearGradient(colors: gradientColors,
                           startPoint: startPoint,
                           endPoint: endPoint)
            .frame(width: width ?? 9/10 * deviceWidth, height: height ?? 180)
            .roundedCorner(15, corners: .allCorners)
            
            LinearGradient(colors: gradientColors,
                           startPoint: startPoint,
                           endPoint: endPoint)
            .frame(width: width ?? 9/10 * deviceWidth, height: height ?? 180)
            .roundedCorner(15, corners: .allCorners)
        }
//        .onAppear{
//            withAnimation(.easeInOut(duration: 10.0 ).repeatForever(autoreverses: false)){
//                startPoint = .init(x: 1.5, y: 2.5)
//                    endPoint = .init(x: 2.3, y: 2.5)
//                }
//        }
    }
}


#Preview {
    LoadingView(width: 180, height: 200)
}
