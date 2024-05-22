//
//  PostTypePopupView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/21/24.
//

import SwiftUI

struct PostTypePopupView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Create")
                .font(.headline)
                .bold()
            Spacer()
                .frame(height: 10)
            Divider()
            HStack{
                Image(systemName: "square.and.pencil")
                Text("Post")
                    .bold()
            }
            Spacer()
                .frame(height: 10)
            Divider()
            HStack{
                Image(systemName: "video.circle.fill")
                Text("Highlight")
                    .bold()
            }
            Spacer()
                .frame(height: 10)
            Divider()
            HStack{
                Image(systemName: "book.fill")
                Text("Story")
                    .bold()
            }
        }
        .padding(10)
        .frame(width: 140)
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
