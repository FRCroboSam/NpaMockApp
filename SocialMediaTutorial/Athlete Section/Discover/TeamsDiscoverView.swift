//
//  TeamsDiscoverView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/20/24.
//

import SwiftUI

struct TeamsDiscoverView: View {
    @EnvironmentObject var athleteVM: AthleteVM
    @Binding var showTeams: Bool

    var body: some View {
        ScrollView{
            Spacer()
                .frame(height: 20)
            HStack(spacing: 0){
                Text("League: ")
                    .font(.title)
                    .padding(.leading, 5)
                Text("JUCO")
                    .font(.title2)
                    .foregroundStyle(Color(hex: "#2E8BC0"))
                Image(systemName: "chevron.down")
                    .font(.subheadline)
                    .foregroundStyle(Color(hex: "#2E8BC0"))
                Spacer()
                Button{
                    print("WTF MAN")
                    showTeams = false
                }label: {
                    Text("Explore Athletes")
                        .foregroundStyle(.blue)
                        .padding(10)
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(Color.blue)
                            
                        }
                        .padding(.trailing, 15)
                }
                
            }
            .padding(10)
            Spacer()
                .frame(height: 10)
            TeamScrollView()
            

        }
    }
}

//#Preview {
//    TeamsDiscoverView()
//}
