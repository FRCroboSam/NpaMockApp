//
//  NavBar.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/23/24.
//

import Foundation
import SwiftUI

struct EmptyNavBar: View {
    @Environment(\.dismiss) var dismiss
    var body: some View{
        VStack{
            HStack{
                Spacer()
            }
        }
        .modifier(HideBackButton(dismiss: _dismiss, hideBackButton: true, color: .gray))
        .frame(height:  10)
    }

}
struct AthleteNavBar: View{
    @Environment(\.dismiss) var dismiss
    let athleteName: String
    var body: some View{
        VStack{
            HStack{
                Spacer()

                Text("Athlete Profile")
                    .foregroundStyle(Color.gray)
                    .bold()
                    .font(.headline)
                    .offset(x: -20)
                Spacer()
            }
        }
        .modifier(HideBackButton(dismiss: _dismiss, hideBackButton: true, color: .gray))
        .frame(height:  10)


    }
    
}
//#Preview {
//    return
//    VStack{
//        AthleteNavBar()
//    }
//
//}


