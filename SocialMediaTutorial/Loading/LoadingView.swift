//
//  LoadingView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/12/24.
//

import Foundation
import SwiftUI


struct LoadingView: View{
    @State var startPoint: UnitPoint = .init(x: -1.8, y: -1.2)
    @State var endPoint: UnitPoint = .init(x: 0, y: -0.2)
     let width: Double?
     let height: Double?
    @State var gradientColors = [
        Color(UIColor.systemGray5),
        Color(UIColor.systemGray3),
        Color(UIColor.systemGray5)

    ]
    
    var body: some View {
        LinearGradient(colors: gradientColors,
                       startPoint: startPoint,
                       endPoint: endPoint)
        .frame(width: width ?? 300, height: height ?? 180)
        .roundedCorner(15, corners: .allCorners)
        .onAppear{
            withAnimation(.easeInOut(duration: 0.8).repeatForever(autoreverses: false)){
                startPoint = .init(x: 1.5, y: 2.5)
                    endPoint = .init(x: 2.3, y: 2.5)
                }
        }
    }
}


#Preview {
    LoadingView(width: 180, height: 200)
}
