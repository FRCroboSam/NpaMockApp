//
//  StatsView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/2/24.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Text("Followers")
                    .foregroundStyle(.gray).opacity(0.8)
                Spacer()
                    .frame(height: 5)
                Text(String(678))
                    .font(.title2)
            }
            .frame(width: 1/5 * deviceWidth)
            
            Spacer()
            VStack{
                Text("Following")
                    .foregroundStyle(.gray).opacity(0.8)
                Spacer()
                    .frame(height: 5)
                Text(String(858))
                    .font(.title2)

            }
            .frame(width: 1/5 * deviceWidth)
            
            
            Spacer()
            VStack{
                Text("Posts")
                    .foregroundStyle(.gray).opacity(0.8)
                Spacer()
                    .frame(height: 5)
                Text(String(13))
                    .font(.title2)

            }
            .frame(width: 1/5 * deviceWidth)
            
            Spacer()
        }
    }
}

#Preview {
    StatsView()
}
