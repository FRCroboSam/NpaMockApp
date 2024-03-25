//
//  NavBar.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/23/24.
//

import Foundation
import SwiftUI


struct DiscoverNavBar: View{
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
                Text("NPA+")
                    .foregroundStyle(Color.white)
                    .bold()
                    .font(.title)
                Spacer()
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

