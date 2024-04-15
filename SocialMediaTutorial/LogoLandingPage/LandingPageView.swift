//
//  SwiftUIView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/15/24.
//

import SwiftUI

struct LandingPageView: View {
    var body: some View {
        VStack{
            Image("all_blue_logo")
                .resizable()
                .scaledToFill()
                .frame(width: deviceWidth, height: 200)
                .offset(y: -50)
            

        }
        .frame(width: deviceWidth, height: deviceHeight)
        .background{
            Color(.white)
        }
        .ignoresSafeArea(.all, edges: .top)

    }
}

#Preview {
    LandingPageView()
}
