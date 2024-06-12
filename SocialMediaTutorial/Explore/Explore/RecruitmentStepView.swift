//
//  ExploreCategoryView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/9/24.
//

import SwiftUI

struct RecruitmentStepView: View {
    @State var imageName: String?
    @State var textName: String?
    @State var stepNumber: String
    var body: some View {
        VStack(alignment: .center, spacing: 5){
            Image(imageName ?? "sports_shop_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding(10)
            Text(textName ?? "Sports Gear")
                .font(.footnote)
                .bold()
                .foregroundStyle(.black.opacity(0.6))
                .padding(5)
            

            
        }
        .frame(width: 110, height: 130)
        .background{
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(radius: 1.0)
                .overlay(alignment: .topLeading){
                    Text(stepNumber ?? "1")
                        .foregroundStyle(.white)
                        .padding(5)
                        .background{
                            Circle()
                                .fill(Color(hex: "0A66C2"))
                        }
                        .offset(x: -5, y: -10)
                }
            
        }

    }
}

#Preview {
    ExploreCategoryView()
}
