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

                .scaledToFill()
                //.opacity(0.8)
                .frame(width: 3/4 * deviceWidth, height:200)
                .brightness(-0.2)

            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 50)
                Text("Featured")
                    .foregroundStyle(.white)
                    .bold()
                    .shadow(radius: 10)
                    .foregroundStyle(.white)
                Text("Top 10 Football Teams")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .bold()
                    .shadow(radius: 1)
                    .foregroundStyle(.white)
                Text("Selection of the best")
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
                
                
            }.offset(x: -10)
        }
    }
}

#Preview {
    highlightview()
}
