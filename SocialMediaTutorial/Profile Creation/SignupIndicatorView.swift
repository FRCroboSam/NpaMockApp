//
//  SignupIndicatorView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/16/24.
//

import Foundation
import SwiftUI

struct SignupIndicatorView: View{
    var body: some View {
        HStack{
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.darkGray))
                .frame(width: 3/4 * deviceWidth, height: 10)
                .overlay(alignment: .leading){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor.white))
                        .frame(width: 1/4 * deviceWidth, height: 10)
                }
            Spacer()
        }
    }
}
