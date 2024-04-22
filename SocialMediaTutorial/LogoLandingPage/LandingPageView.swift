//
//  SwiftUIView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/15/24.
//

import SwiftUI

struct LandingPageView: View {
    var body: some View {
        VStack(alignment: .leading){
            
            Image("transparent_full_logo")
                .resizable()
                .scaledToFill()
                .frame(width: deviceWidth, height: 400)
            
            Spacer()
                .frame(height: 100)
            

        }
        
        .ignoresSafeArea(.all, edges: .top)
        .frame(width: deviceWidth, height: deviceHeight)
        .background{
            LinearGradient(gradient:Gradient(colors:[
                Color(hex: "00008b"),
                Color(hex: "0A66C2"),
//                Color(hex: "ADD8E6"),
            ]),
               startPoint:.top,endPoint:.bottom)

        }
        .ignoresSafeArea(.all, edges: .top)
        
    }
}

#Preview {
    LandingPageView()
}
