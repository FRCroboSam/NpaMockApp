//
//  DiscoverView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 3/21/24.
//

import SwiftUI

struct DiscoverView: View {
    @EnvironmentObject var athleteVM: AthleteVM
    var body: some View {
//        Text("Discover")
        ScrollView{
            ForEach(athleteVM.athletes){ athlete in
                AthleteListView(athlete: athlete)

            }
        }
        .onAppear{
            print(String(
                  athleteVM.athletes.count))
        }
        .navigationTitle("NPA") // Set the navigation title
        .navigationBarItems(trailing: Image(systemName: "bell.badge.fill"))
    }
}

#Preview {
    DiscoverView()
}
