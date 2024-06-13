//
//  PostTypePopupView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/21/24.
//

import SwiftUI

struct SponsorPopup: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Support Methods")
                .font(.title3)
                .bold()
            Spacer()
                .frame(height: 10)
            Divider()
            HStack{
                Image(systemName: "square.and.pencil")
                    .font(.title)

                Text("Apple Pay")
                    .font(.title3)
                    .bold()
            }
            Spacer()
                .frame(height: 10)
            Divider()
            HStack{
                Image(systemName: "video.circle.fill")
                    .font(.title)

                Text("Credit/Venmo")
                    .font(.title3)

                    .bold()
            }
            Spacer()
                .frame(height: 10)
            Divider()
            HStack{
                Image(systemName: "book.fill")
                    .font(.title)
                Text("Crypto through Topper by Uphold")
                    .font(.title3)
                    .bold()
            }
        }
        .padding(10)
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
