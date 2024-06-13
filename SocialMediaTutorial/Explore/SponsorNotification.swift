//
//  SponsorNotification.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/12/24.
//

import Foundation
import SwiftUI

struct SponsorNotification: View {
    var body: some View{
        HStack(alignment: .center){
            Image(systemName: "dollarsign.arrow.circlepath")
                .font(.title)
                .bold()
                .foregroundStyle(.white)
                .padding(.trailing, 4)
            VStack(alignment: .leading){
                Text("Sponsor an Athlete")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .bold()
                
                Text("Tap on an athlete profile to support them with cash or crypto")
                    .foregroundStyle(.white)
                Button{
                    
                }label: {
                    
                }
            }
            .frame(maxWidth: 3/4 * deviceWidth)

        }
        .frame(width: deviceWidth, height: 100)
        .background{
            Color(hex: "0A66C2")
        }
    
        
    }
}
