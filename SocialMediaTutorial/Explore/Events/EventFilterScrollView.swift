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
                
                Image(systemName: "slider.horizontal.3")
                    .font(.title2)
                    .padding(10)
                    .background{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray.opacity(0.3))
                    }

                ForEach(filters.indices, id: \.self) { index in
                    HStack{
                        Text(filters[index])
                        Image(systemName: "triangle.fill")
                            .font(.system(size: 8))
                            .rotationEffect(Angle(degrees: 180))
                        
                    }
                        .padding(10)
                        .background{
                            RoundedRectangle(cornerRadius: 5)
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
