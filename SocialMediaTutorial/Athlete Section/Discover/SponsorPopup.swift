//
//  PostTypePopupView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/21/24.
//

import SwiftUI

struct SponsorPopup: View {
    var body: some View {
        VStack(alignment: .center){
            Text("Support Methods")
                .font(.title2)
                .bold()
            Spacer()
                .frame(height: 10)
            HStack{
                Image("ApplePay")
                    .resizable()
                    .scaledToFill()
                    .padding(.leading, -15)
                    .frame(width: 120, height: 60)
                Image("GooglePay")
                     .resizable()
                     .scaledToFill()
                     .frame(width: 80, height: 40)
            }
            Spacer()
                .frame(height: 10)
            HStack{
                Image("CreditPay")
                    .resizable()
                    .scaledToFill()
                    .padding(.leading, -15)
                    .frame(width: 80, height: 40)
                Image("TopperPay")
                     .resizable()
                     .scaledToFill()
                     .frame(width: 80, height: 40)
            }
        }
        .padding(30)
        .frame(width: 2/3 * deviceWidth)
        
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
