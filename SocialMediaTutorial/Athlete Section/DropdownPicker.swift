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
    let sports = ["Swimming", "Tennis", "Baseball", "Football", "Lacrosse", "Badminton", "Soccer", "Rugby",
                                   "Basketball", "Pickleball", "Cross Country", "Track and Field"]
    var body: some View{
        ZStack{
            VStack{
                VStack(alignment: .leading){
                    HStack{
                        Text("Select a Sport: ")
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
                VStack(alignment: .leading){
                    HStack{
                        Text("Select a Sport: ")
                        Spacer()
                        Image(systemName: "chevron.down")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            .rotationEffect(.degrees(isExpanded ? -180 : 0))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading) // Align text within its frame to the leading edge

                }
                .frame(width: 3/4 * 3/4 * deviceWidth)
                .padding()
                .background(Color.orange)
                .cornerRadius(15)
            }

            
            if(isExpanded){
                ScrollView{
                    VStack(alignment: .leading){
                        ForEach(sports, id: \.self) {
                            Text($0)
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading) // Align text to the left
                                .frame(maxWidth: .infinity, alignment: .leading) // Align text within its frame to the leading edge
                            Divider()
                            
                        }
                    }
                }
                .frame(width: 3/4 * 3/4 * deviceWidth, height: 200)
                .padding()
                .background(Color.orange)
                .cornerRadius(15)
                
                .offset(x: 0, y: 150)

            }
        }

    }
    
}
#Preview {
    DropdownPicker()
}
