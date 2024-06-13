//
//  CategoryGroupView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/10/24.
//

import SwiftUI

struct CategoryGroupView: View {
    var body: some View {
        NavigationStack{
            ScrollView(.horizontal){
                HStack(spacing: 0 ){
                    NavigationLink{
                        ShopContentView()
                    }label: {
                        ExploreCategoryView()
                    }
                    NavigationLink{
                        EventTabContentView()
                    }label: {
                        ExploreCategoryView(
                            imageName: "events_icon",
                            textName: "Events"
                        )
                    }
                    NavigationLink{
                        TrainingContentView()
                    }label: {
                        ExploreCategoryView(imageName: "training_icon", textName: "Training")
                    }
                    
                    NavigationLink{
                        RecoveryContentView()
                    }label: {
                        ExploreCategoryView(imageName: "supplements_icon", textName: "Recovery")
                    }
                    NavigationLink{
                        MentalContentView()
                    }label: {
                        ExploreCategoryView(
                            imageName: "mental_icon",
                            textName: "Mental"
                        )
                    }
                    ExploreCategoryView(
                        imageName: "agent_icon",
                        textName: "Agents"
                    )
                    
                    ExploreCategoryView(imageName: "coaching_icon", textName: "Coaching")
                }
                .padding(.top, 5)
                
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal, 10)
            .padding(.top, -5)
            .padding(.bottom, 5)
        }


    }
}

#Preview {
    CategoryGroupView()
}
