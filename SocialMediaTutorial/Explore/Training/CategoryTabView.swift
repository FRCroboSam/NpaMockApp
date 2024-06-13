//
//  TrainingTabView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/12/24.
//

import SwiftUI

struct CategoryTabView: View{
    @Binding var selection: String
    @State var categories: [String]
    @State var fillMode = true
    @State var horizontalPadding =  10.0
    var body: some View{
        ScrollView(.horizontal){
            HStack{
                Spacer()
                ForEach(categories.indices, id: \.self){ index in
                    VStack{

                        Text(categories[index])
                            .foregroundStyle(selection == categories[index] ? Color.blue.opacity(0.8) : Color.gray.opacity(0.5))
                            .font(.headline)
                        
                            .onTapGesture {
                                withAnimation(.easeIn){
                                    selection = categories[index]
                                }
                            }
                            .padding(5)

//                        Rectangle()
//                            .fill(selection == categories[index] ? Color.blue : Color.clear)
//                        
//                            .frame(width: 50, height: 3)
//                            .offset(y: -5)
                    }
                    .padding(.horizontal, horizontalPadding)
                    .padding(.vertical, 5)

                    .background{
                        if(fillMode){
                            RoundedRectangle(cornerRadius: 25)
                                .fill(selection == categories[index] ?  Color.blue.opacity(0.1) : Color.clear)
                        }
                    }
                    Spacer()
                }
            }
            .padding(.leading, 10)

            
        }.scrollIndicators(.hidden)
    }
    
    
    
    
}
