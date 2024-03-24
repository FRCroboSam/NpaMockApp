//
//  DropdownPicker.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/22/24.
//

import Foundation
import SwiftUI

struct DropdownPicker: View {
    @Binding var value:String
    let text: String
    let color: Color
    @State private var isExpanded: Bool = false
    //let items: [String]
     var items: [String]
    var body: some View{
        VStack{
                VStack{
                    VStack(alignment: .leading){

                        HStack{
                            Text(value.isEmpty ? text : value)
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
                    .frame(width: 5/6 * 3/4 * deviceWidth)
                    .padding()
                    .background(color)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 10,
                            bottomLeadingRadius: isExpanded ? 0 : 10,
                            bottomTrailingRadius: isExpanded ? 0 : 10,
                            topTrailingRadius: 10
                        )
                    )
                }
                .overlay{
                    
                    
                    ZStack{
                        
                        if(isExpanded){
                            VStack{
                                ScrollView{
                                    VStack(alignment: .leading){
                                        ForEach(items, id: \.self) {item in
                                            VStack{
                                                Text(item)
                                                    .font(.system(size: 20))
                                                    .foregroundColor(.black)
                                                    .multilineTextAlignment(.leading) // Align text to the left
                                                    .frame(maxWidth: .infinity, alignment: .leading) // Align text within its frame to the leading edge

                                                Divider()
                                            }
                                            .contentShape(Rectangle())
                                            .onTapGesture {
                                                withAnimation(.easeIn){
                                                    value = item
                                                    isExpanded = false
                                                    
                                                }
                                                
                                                
                                            }
                                            

                                            
                                            

                                            
                                        }
                                    }
                                }
                            }
                            .frame(width: 5/6 * 3/4 * deviceWidth, height: 200)
                            .padding()
                            .background(color)
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 0,
                                    bottomLeadingRadius: 10,
                                    bottomTrailingRadius: 10,
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
//    @State var value = ""
//    DropdownPicker(value: $value, text: "hello", color: Color.blue, items: ["basketball"])
//}
