//
//  NavBar.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/23/24.
//

import Foundation
import SwiftUI


struct DiscoverNavBar: View{
    @State var text: String = "Discover"
    var body: some View{
        VStack{
            Spacer()
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
            HStack{
                Spacer()
                Image("star_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Text(text)
                    .foregroundStyle(Color.white)
                    .bold()
                    .font(.title)
                Spacer()
                Image(systemName: "bell.fill")
                    .padding(.trailing, 30)
            }
        }
        .background{
            Color(hex: "0A66C2")
                .zIndex(30)
        }


    }
    
}
#Preview {
    return
    VStack{
        DiscoverNavBar()
    }

}

