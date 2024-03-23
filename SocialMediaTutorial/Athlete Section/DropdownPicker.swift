//
//  DropdownPicker.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/22/24.
//

import Foundation
import SwiftUI

struct DropdownPicker: View {
    
    @State private var isExpanded: Bool = false
    //let items: [String]
     var items: [String]
    var body: some View{
        VStack{
                VStack{
                    VStack(alignment: .leading){

                        HStack{
                            Text("Select a Sport: ")
                                .font(.system(size: 20))
                            Spacer()

                            Image(systemName: "chevron.down")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                                .rotationEffect(.degrees(isExpanded ? -180 : 0))
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.easeIn){
                                isExpanded = !isExpanded
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading) // Align text within its frame to the leading edge
                        
                    }
                    .frame(width: 3/4 * 3/4 * deviceWidth)
                    .padding()
                    .background(Color.orange)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 20,
                            bottomLeadingRadius: isExpanded ? 0 : 20,
                            bottomTrailingRadius: isExpanded ? 0 : 20,
                            topTrailingRadius: 20
                        )
                    )
                }
                .overlay{
                    
                    
                    ZStack{
                        
                        if(isExpanded){
                            VStack{
                                ScrollView{
                                    VStack(alignment: .leading){
                                        ForEach(items, id: \.self) {
                                            Text($0)
                                                .font(.system(size: 20))
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.leading) // Align text to the left
                                                .frame(maxWidth: .infinity, alignment: .leading) // Align text within its frame to the leading edge
                                            Divider()
                                            
                                        }
                                    }
                                }
                            }
                            .frame(width: 3/4 * 3/4 * deviceWidth, height: 200)
                            .padding()
                            .background(Color.orange)
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 0,
                                    bottomLeadingRadius: 20,
                                    bottomTrailingRadius: 20,
                                    topTrailingRadius: 0
                                )
                            )
                            
                            
                        }
                    }
                    .layoutPriority(10)
                    .offset(x: 0, y: 140)
                    .zIndex(200)

                }
        }

    }
    
}
//#Preview {
//    let sports = 
//    DropdownPicker()
//}
