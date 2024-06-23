//
//  NotificationView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/23/24.
//

import Foundation
import SwiftUI
struct NotificationView: View {
    var profile_img: String
    var text: String
    var name: String

    var body: some View {
        HStack {
            Spacer()
                .frame(width: 20)
            Image(profile_img)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
            
                .clipped()
                .clipShape(Circle())
//                    .clipShape(Parallelogram(angle: 10))
            HStack(alignment: .center){
                Text(.init("**\(name)** \(text)"))
                Spacer()
                Button{
                    
                }label: {
                    Text("Follow")
                        .foregroundStyle(.white)
                        .font(.system(size: 16))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(hex: "0A66C2"))
                        }
                }
                .padding(.trailing, 10)
                    
            }
            
            
        }
        .frame(width: deviceWidth, height: 90)
        .background(Color(.white))//UIColor.systemGray4))
        .padding(.trailing, 10)
    }
    
}


