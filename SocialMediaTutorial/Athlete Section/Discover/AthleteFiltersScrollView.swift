//
//  AthleteFiltersScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/12/24.
//

import Foundation
import SwiftUI

struct AthleteFiltersScrollView: View{
   let filters = [
        "League",
        "Sport",
        "Gender",
        "State",
        "Sport"
    ]
    var body: some View{
        ScrollView(.horizontal){
            HStack(spacing: 15){
                ForEach(filters.indices, id: \.self){ index in
                    HStack{
                        Text(String(filters[index]))
                        Image(systemName: "chevron.down")
                            .font(.headline)
                     }
                        .foregroundStyle(Color(UIColor.gray))
                        .padding(.horizontal, 14)
                        .padding(.vertical, 10)
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(UIColor.systemGray4).opacity(0.3))
                                .cornerRadius(15)
                        }
                }

            
                
                
            }
            .padding(.leading, 10)
        }.scrollIndicators(.hidden)
    }
}
