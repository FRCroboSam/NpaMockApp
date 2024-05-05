//
//  Preferences.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/3/24.
//

import SwiftUI

struct AthleteDocs: View {
    @State var preferences = [
        "Academic Transcripts", "Drug Screening","Medical Waivers"
    ]
    
    @State var preferenceImages = [
        "doc.text", "pill", "calendar"
    ]
    var body: some View {
        VStack{
            HStack(alignment: .center){
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 5, height: 40)
                    .padding(.leading, -10)
                Spacer()
                    .frame(width: 10)
                Text("Documents")
                    .font(.title)
                    .bold()
                Spacer()
                Text("40% Complete")
                    .foregroundStyle(Color(UIColor.red).opacity(2.0))
                    .padding(5)
                    .background{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.red.opacity(0.2))
                    }
            }
            .listRowSeparator(.hidden)
            .padding(.top, 10)
            ForEach(preferences.indices, id: \.self) { index in
                HStack(alignment: .center){
                    Image(systemName: preferenceImages[index])
                        .font(.title2)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color(.gray))
                        .padding(10)
                        .background{
                            Color(UIColor.systemGray5).opacity(0.8)
                                .clipped()
                                .clipShape(.circle)
                        }
                    Text(preferences[index])
                        .foregroundStyle(.black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .font(.title2)
                        .foregroundStyle(.gray)
                        .rotationEffect(.init(degrees: -90))
                    //
                }
                if(index != preferences.count - 1){
                    HStack{
                        Spacer()
                        VStack(alignment: .trailing){
                            Divider()
                                .frame(width: 2/3 * deviceWidth)
                        }
                        
                    }
                }
                
                
            }

        }
        .padding(10)

        .frame(width: 7/8 * deviceWidth)
        .background{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 1)
        }
    }
}

#Preview {
    AthleteDocs()
}
