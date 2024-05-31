//
//  EventFilterScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/30/24.
//

import SwiftUI

struct EventFilterScrollView: View {
    @State var filters = [
        "Dates",
        "Locations",
        "Categories",
        "Sport",
        "Gender"

    ]
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                Spacer()
                    .frame(width: 15)

                ForEach(filters.indices, id: \.self) { index in
                    HStack{
                        Text(filters[index])
                        Image(systemName: "chevron.down")
                        
                    }
                        .padding(10)
                        .background{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.gray.opacity(0.3))
                        }
                    
                }
            }
        }.scrollIndicators(.hidden)
            
    }
}

#Preview {
    EventFilterScrollView()
}
