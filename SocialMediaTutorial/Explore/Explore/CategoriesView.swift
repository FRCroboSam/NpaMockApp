//
//  CategoriesView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/27/24.
//

import SwiftUI

struct CategoryView: View {
    let item_url: String
    let text: String
    let amount: String

    var body: some View {
        VStack(alignment: .leading){
//            Spacer()
//                .frame(height: 10)
            AsyncImage(
                url: URL(string: item_url),
                content: { image in
                    image.resizable()
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 120)
                        .clipped()
                        .roundedCorner(8, corners: .topLeft)
                        .roundedCorner(8, corners: .topRight)
//                        .roundedCorner(8, corners: .bottomLeft)
//                        .roundedCorner(8, corners: .bottomRight)
                    
                    
                        .background{
                            Color(UIColor.systemGray6)
                        }
                    
                },
                placeholder: {
                    ProgressView()
                }
            )
//            Text("Featured")
//                .font(.caption)
//                .opacity(0.5)
//                .padding(.leading, 5)
            
            Text(text)
//                .padding(.bottom, 20)
                .bold()
                .padding(.leading, 5)
            Text("• " + amount + " " + text + " •")
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.leading, 7)
                .padding(.bottom, 10)
            
//            Button {
//                
//            } label: {
//                Text("View 5.9K")
//                    .foregroundStyle(.white)
//                    .padding(
//                    .background{
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(Color.blue)
//                    }
//                    .padding(.leading, 10)
//
//
//            }


        }
        .background{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)

                .shadow(color: Color(UIColor.lightGray).opacity(0.7),radius: 3)                .mask(Rectangle().padding(.bottom, -30))
                .shadow(color: Color.gray, radius: 1)


            
        }
    }
}

#Preview {
    CategoryView(item_url: "https://thehill.com/wp-content/uploads/sites/2/2023/10/williamsjada_111822ap_high-school-athletes-nil.jpg?strip=1", text: "Athletes", amount: "5.3K" )
}
