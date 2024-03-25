//
//  NavBar.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/23/24.
//

import Foundation
import SwiftUI


struct AthleteNavBar: View{
    let athleteName: String
    var body: some View{
        VStack{
            Spacer()
                .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
            HStack{
                Spacer()

                Text(athleteName)
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
//#Preview {
//    return
//    VStack{
//        AthleteNavBar()
//    }
//
//}


