//
//  CareerCategoryView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 7/7/24.
//

import Foundation
import SwiftUI
import NukeUI

struct CareerCategoryView: View {
    let text: String
    let imageURL: String
    
    var body: some View{
        HStack{
            Text(text)
                .font(.title2)
                .foregroundStyle(.white)
                .bold()
                .padding(.leading, 20)
            Spacer()
            LazyImage(url: URL(string: imageURL)) { phase in
                if let image = phase.image {
                    image // Displays the loaded image.
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 100)
                        .clipShape(Parallelogram(angle: 30))
                        .padding(.trailing, 20)
                    
                    
                    
                } else {
                    LoadingView(width: 140, height: 175)
                        .padding(.trailing, 20)
                    
                }
                
                
            }

            
        }
        .frame(width: deviceWidth, height: 100)
        .background{
            LinearGradient(gradient:Gradient(colors:[
                Color(hex: "0A66C2").opacity(0.4),
                Color(hex: "0A66C2").opacity(1.0),
                //                Color(hex: "ADD8E6"),
            ]),
                           startPoint:.leading,endPoint:.trailing)
        }
    }
}
