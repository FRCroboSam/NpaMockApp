//
//  AthleteScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/11/24.
//

import SwiftUI

struct AthleteScrollView: View {
    @State var athletes: [Athlete]
    var body: some View {
        ScrollView{
            VStack(spacing: 0){
                ForEach(athletes){ athlete in
                    
                    NavigationLink{
                        AthleteProfileView(athlete: athlete)
                    }label: {
                        AthleteBannerView(athlete: athlete)
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        Divider()
                        
                        
                    }
                }
                Spacer()
                    .frame(height: 50)
            }
            Spacer()
            
        }
    }
}

//#Preview {
//    AthleteScrollView()
//}
