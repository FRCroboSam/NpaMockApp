//
//  SignupIndicatorView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/16/24.
//

import Foundation
import SwiftUI

struct SignupIndicatorView: View{
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var feedVM: FeedVM
    var body: some View {
        HStack{
//            Button{
//                dismiss()
//            }label: {
//                Image(systemName: "chevron.backward")
//                    .foregroundStyle(.white)
//                    .font(.title)
//            }
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.darkGray))
                .frame(width: 2/3 * deviceWidth, height: 10)
                .overlay(alignment: .leading){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor.white))
                        .frame(width: feedVM.signupProgress * 2/3 * deviceWidth, height: 10)
                        .animation(.easeIn, value: feedVM.signupProgress)
                }
            Spacer()
        }
    }
}
