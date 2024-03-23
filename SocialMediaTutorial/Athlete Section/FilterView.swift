//
//  FilterView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/22/24.
//

import SwiftUI

struct FilterView: View {
    @State private var selectedSport: String = "Swimming"
    let sports = ["Swimming", "Tennis", "Baseball", "Football", "Lacrosse", "Badminton", "Soccer", "Rugby",
                  "Basketball", "Pickleball", "Cross Country", "Track and Field"
                  
    ]
    var deviceWidth: CGFloat{
        UIScreen.main.bounds.width
    }
    var deviceHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    @State private var selectingSport: Bool = false
    @State private var isExpanded: Bool = false
    
    var body: some View {
            VStack{
                Text("Apply Filters")
                    .font(.system(size: 40))
                DropdownPicker()
                    .zIndex(500)
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Choose a year: ")
                        Spacer()
                        Image(systemName: "chevron.down")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            .rotationEffect(.degrees(isExpanded ? -180 : 0))
                    }
                    .onTapGesture {
                        isExpanded = !isExpanded
                    }
                    .frame(maxWidth: .infinity, alignment: .leading) // Align text within its frame to the leading edge
                    
                }
                .frame(width: 3/4 * 3/4 * deviceWidth)
                .padding()
                .background(Color.orange)
                .cornerRadius(15)
                Spacer()
                
            }
        .frame(width: 3/4 * deviceWidth, height: 1/2 * deviceHeight)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray) // Fill the RoundedRectangle with gray color
        )
    }
}

//#Preview {
//    FilterView()
//}
