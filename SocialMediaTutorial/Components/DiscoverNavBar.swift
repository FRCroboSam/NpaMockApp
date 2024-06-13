//
//  NavBar.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/23/24.
//

import Foundation
import SwiftUI


struct CustomNavBar: View{
    @Environment(\.dismiss) var dismiss

    let title: String?
    @State var backButtonHidden = true
    var body: some View{
        VStack{
            HStack(spacing: 10){
                Spacer()
                    
                Text(title ?? "Discover")
                    .foregroundStyle(Color.black)
                    .bold()
                    .font(.subheadline)
                HStack{
                    Spacer()
                    Image(systemName: "plus")
                        .foregroundStyle(Color.black)
                        .font(.title2)
                    Image(systemName: "calendar")
                        .font(.title2)
                        .foregroundStyle(Color.black)
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color.black)
                        .font(.title2)
                        .padding(.trailing, 30)
                }
                .frame(width: 3/7 * deviceWidth)
            }
        }
        .modifier(HideBackButton(dismiss: _dismiss, hideBackButton: backButtonHidden))
        



    }
    
}
//#Preview {
//    return
//    VStack{
//        DiscoverNavBar()
//    }
//
//}

struct EmptyModifier: ViewModifier {

    var deviceWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    func body(content: Content) -> some View {
        content
    }
}
