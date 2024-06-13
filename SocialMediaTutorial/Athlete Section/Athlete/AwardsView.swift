//
//  AwardsView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/12/24.
//

import Foundation
import SwiftUI

struct AwardsView: View{
    let awards23 = [
        "1st Place",
        "Most Valuable Player",
        "Most Improved Player",
    ]
    
    let competitions23 = [
        "2023 District Invitational",
        "2023 Tacoma Rumble",
        "2023 State Chamiponships"
    ]
    
    
    let awards22 = [
        "2nd Place",
        "Most Improved Player",
        "Most Valuable Player",
        "Division Semifinalist"
    ]
    
    let competitions22 = [
        "2022 District Invitational",
        "2022 Tacoma Rumble",
        "2022 State Chamiponships",
        "2022 KingCo Division Champs"
    ]
    let years = ["2023", "2022"]
    
    var body: some View{
        ScrollView{
            ForEach(years.indices, id: \.self){ index in
                
                let compArray = years[index] == "2023" ? competitions23 : competitions22
                let awardsArray = years[index] == "2023" ? awards23 : awards22
                Spacer()
                    .frame(height: 10)
                HStack{
                    Text(years[index])
                        .bold()
                        .italic()
                        .font(.title2)
                        .padding(.leading, 15)
                    Spacer()
                }
                Spacer()
                    .frame(height: 10)
                ForEach(awards23.indices, id: \.self){ index in
                    HStack{
                        VStack(alignment: .leading){
                            Text(compArray[index])
                                .foregroundStyle(.gray.opacity(0.8))
                                .font(.headline)
                            Text(awardsArray[index])
                                .foregroundStyle(.black)
                                .italic()
                                .bold()
                                .font(.title3)
                            
                        }
                        Spacer()
                    }
                    .frame(width: 7/8 * deviceWidth)

                    .padding(15)
                    .background{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .shadow(radius: 1)
                        
                    }

                    .padding(.horizontal, 10)
                }
            }
            Spacer()
                .frame(height: 40)
            
        }.scrollIndicators(.hidden)
    }
    
}
