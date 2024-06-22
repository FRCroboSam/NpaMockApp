//
//  PostTypePopupView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/21/24.
//

import SwiftUI

struct SponsorPopup: View {
    let images = ["ApplePay", "GooglePay", "CreditPay", "TopperPay"]
    let text = ["Apple Pay", "Google Pay", "Credit Card", "Topper (Crypto)"]
    var body: some View {
        VStack(alignment: .center){
            Text("Choose a Support Method")
                .font(.title2)
                .bold()
                .padding(.bottom, 10)
            ForEach(images.indices, id: \.self){ index in
                HStack{
                    Image(images[index])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding(.leading, 10)

                    Text(text[index])
                        .font(.title3)
                    Spacer()
                    Image(systemName: "arrow.right")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.black)
                        .padding(.trailing, 15)
                }
                .frame(width: 7/8 * deviceWidth, height: 95)
                .background{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(radius: 1)
                }
                .padding(.bottom, 10)

            }
        }
        .padding(20)
        .frame(width: deviceWidth)
        
        .background{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 1)
        }
    }
}

#Preview {
    PostTypePopupView()
}
