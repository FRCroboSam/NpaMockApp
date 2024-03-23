//
//  FilterView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/22/24.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject var vm: AthleteVM
    @State private var selectedSport: String = "Swimming"
    let sports = ["Swimming", "Tennis", "Baseball", "Football", "Lacrosse", "Badminton", "Soccer", "Rugby",
                  "Basketball", "Pickleball", "Cross Country", "Track and Field"]
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
                HStack{
                    Button {
                    } label: {
                        Text("Cancel")
                            .tint(Color.white)

                    }

                    Text("Athlete Filters")
                    Button{
                    } label: {
                        Text("Clear")
                            .tint(Color.red)
                    }
                }
                Divider()

                DropdownPicker(items: sports)
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
                .background(Color(UIColor.lightGray))
                .cornerRadius(15)
                Spacer()
                
            }
            .zIndex(15)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.lightGray)) // Fill the RoundedRectangle with gray color
        )
    }
}

//#Preview {
//    FilterView()
//}
