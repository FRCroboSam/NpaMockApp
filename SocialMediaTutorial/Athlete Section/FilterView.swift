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
    var body: some View {
        VStack{
            Text("Apply Filters")
                .font(.system(size: 40))
            Picker("Strength", selection: $selectedSport) {
                ForEach(sports, id: \.self) {
                    Text($0)
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                }
            }
            .foregroundStyle(Color.pink)
            .pickerStyle(DefaultPickerStyle())
        }
        .frame(width: 3/4 * deviceWidth, height: 1/2 * deviceHeight)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray) // Fill the RoundedRectangle with gray color
        )
    }
}

#Preview {
    FilterView()
}
