//
//  FilterView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/22/24.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject var vm: AthleteVM
    @State private var selectedSport: String = ""
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
        VStack(alignment: .leading ){
                HStack{
                    Button {
                    } label: {
                        Text("Cancel")
                            .tint(Color.white)

                    }
                    Spacer()
                    Text("Athlete Filters")
                        .font(.system(size: 15))
                        .bold()
                    Spacer()
                    Button{
                    } label: {
                        Text("Clear")
                            .tint(Color.red)
                    }
                }
                Divider()
                Text("Sport")
            DropdownPicker(value: $selectedSport, text: "Select a sport: ", color: Color(UIColor.systemGray3), items: sports)
                    .zIndex(500)
                Spacer()
                
//                VStack(alignment: .leading){
//                    HStack{
//                        Text("Choose a year: ")
//                        Spacer()
//                        Image(systemName: "chevron.down")
//                            .font(.subheadline)
//                            .foregroundStyle(.gray)
//                            .rotationEffect(.degrees(isExpanded ? -180 : 0))
//                    }
//                    .onTapGesture {
//                        isExpanded = !isExpanded
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading) // Align text within its frame to the leading edge
//                    
//                }
//                .background(Color(UIColor.lightGray))
//                .cornerRadius(15)
//                Spacer()
                
            }
        .padding(10)
        .frame(width: deviceWidth, height: 300)///3/4 * deviceWidth, height: 300)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.gray)) // Fill the RoundedRectangle with gray color
        )
    }
}

//#Preview {
//    FilterView()
//}
