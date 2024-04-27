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

    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(
                url: URL(string: item_url),
                content: { image in
                    image.resizable()
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                        .roundedCorner(8, corners: .topLeft)
                        .roundedCorner(8, corners: .topRight)

                        .background{
                            Color(UIColor.systemGray6)
                        }
                    
                },
                placeholder: {
                    ProgressView()
                }
            )
            Text("Discover")
                .font(.caption)
                .padding(.leading, 5)
            Text(text)
                .padding(.bottom, 10)
                .bold()
                .padding(.leading, 5)
        }
        .background{
            Color.white
                .roundedCorner(8, corners: .allCorners)
                .shadow(radius: 1)
        }
    }
}

#Preview {
    CategoryView(item_url: "https://thehill.com/wp-content/uploads/sites/2/2023/10/williamsjada_111822ap_high-school-athletes-nil.jpg?strip=1", text: "Athletes" )
}
