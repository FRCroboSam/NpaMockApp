//
//  TeamHeadline.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/20/24.
//

import SwiftUI

struct TeamHeadline: View {
    @State var wins =  12
    @State var rank = 1
    @State var losses = 2
    
    @State var schoolName = "Mater Dei"
    @State var state = "California"
    
    @State var teamLogo = "https://3.files.edl.io/62dc/22/08/30/191529-d8a627a6-419e-4f96-bf67-0fe6eebb6bb3.jpg"
    var body: some View {
        HStack{
//            Text(String(rank))
//                .font(.title)
            AsyncImage(
                url: URL(string: teamLogo),
                content: { image in
                    image.resizable()
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipped()
                        .clipShape(.circle)
                        //.shadow(radius: 1)

                    //.roundedCorner(8, corners: .allCorners)
                    
                        .tint(Color.gray)
                    
                },
                placeholder: {
                    LoadingView(width: 40, height: 40)
                }
            )

            .padding(.leading, 10)
            Text(schoolName + " (" + state + ")")
                .font(.title2)
            Spacer()
            Text(String(wins) + " - " + String(losses))
                .font(.title)
            Spacer()
            
        }
    }
}

#Preview {
    TeamHeadline()
}
