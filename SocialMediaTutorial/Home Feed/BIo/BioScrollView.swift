//
//  AthleteScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/11/24.
//

import SwiftUI

struct BioScrollView: View {
    @EnvironmentObject var athleteVM: AthleteVM
    @State var athletes: [Athlete] = [
        Athlete.defaultAthlete(), Athlete.defaultAthlete(), Athlete.defaultAthlete(),
        Athlete.defaultAthlete()
    ]
    var body: some View {
        VStack(spacing: 0){


            ScrollView(.horizontal){
                
                HStack(spacing: 10){
                    Spacer()
                        .frame(width: 10)
                    ForEach(athleteVM.athletes.indices, id: \.self) { index in
                        BioCard(athlete: athleteVM.athletes[index] )
                            .zIndex(10000)
                        
                            .padding(.horizontal, 5)
                            
                    }
                }
                .padding(.top, 45)
                .padding(.bottom, 35)

                Spacer()
                
                
            }
            .padding(.top, -35)

            .zIndex(200)
            .scrollIndicators(.hidden)
            Text("(Tap to read about your favorite athletes)")
                .font(.headline)
                .padding(.top, -35)
                .padding(.leading, -10)
                .padding(.bottom, 15)
            
        }
    }
}

//#Preview {
//    AthleteScrollView()
//}
