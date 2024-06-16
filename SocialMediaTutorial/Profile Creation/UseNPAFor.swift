//
//  UseNPAFor.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/16/24.
//

import Foundation
import SwiftUI

struct UseNPAFor: View{
    let goals = [
        "Discover Athletes", "Watch Sport Highights", "Read Blogs",
        "Develop skills", "Shop for gear", "Sponsor Athletes",
    ]
    @State var selectedIndexes = [0, 0, 0, 0, 0, 0]
    var body: some View{
        VStack(alignment: .leading){
            Text("What do you want to use NPA for?")
                .font(.title)
                .foregroundStyle(.white)
            
            ForEach(Array(stride(from: 0, to: goals.count, by: 2)), id: \.self) { index in
                HStack {
                    Text(goals[index])
                        .foregroundColor(selectedIndexes[index] == 0 ?
                                         Color.black.opacity(0.6) : Color.black)
                        .padding(10)
                        .background{
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundStyle(selectedIndexes[index] == 0 ?
                                                 Color.gray.opacity(0.3) : Color.white)
                        }
                        .onTapGesture{
                            if(selectedIndexes[index] == 0){
                                selectedIndexes[index] = 1
                            }
                            else{
                                selectedIndexes[index] = 0
                            }
                        }
                    
                        .padding(5)
                    if index + 1 < goals.count {
                        Text(goals[index + 1])
                            .foregroundColor(selectedIndexes[index + 1] == 0 ?
                                             Color.black.opacity(0.6) : Color.black)
                            .padding(10)
                            .background{
                                RoundedRectangle(cornerRadius: 25)
                                    .foregroundStyle(selectedIndexes[index + 1] == 0 ?
                                                     Color.gray.opacity(0.3) : Color.white)
                            }
                            .onTapGesture{
                                if(selectedIndexes[index + 1] == 0){
                                    selectedIndexes[index + 1] = 1
                                }
                                else{
                                    selectedIndexes[index + 1] = 0
                                }
                            }
                    }
                }
            }
        }
        .background{
            Image("background")
                .blur(radius: 20)
        }
        .ignoresSafeArea(.all, edges: .top)
        
    }
}
