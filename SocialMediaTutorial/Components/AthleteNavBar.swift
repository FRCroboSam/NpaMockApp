//
//  NavBar.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/23/24.
//

import Foundation
import SwiftUI


struct AthleteNavBar: View{
    @Environment(\.dismiss) var dismiss
    let athleteName: String
    var body: some View{
        VStack{
            HStack{
                Spacer()

                Text(athleteName)
                    .foregroundStyle(Color.white)
                    .bold()
                    .font(.headline)
                    .offset(x: -20)
                Spacer()
            }
        }
        .modifier(HideBackButton(dismiss: _dismiss, hideBackButton: true, color: .white))
        .frame(height:  25)
        .background{
            Color(hex: "0A66C2")
                .zIndex(30)
                .padding(.top, -11)
                .padding(.bottom, -10)

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


