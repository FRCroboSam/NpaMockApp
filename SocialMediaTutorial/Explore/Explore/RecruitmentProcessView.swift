
//
//  CategoryGroupView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/10/24.
//

import SwiftUI

struct RecruitmentProcessView: View {
    let recruitingSteps = [
        "Create NPA Account",
        "Verify your Profile",
        "Post Your Clips",
        "Chat With Coaches",
        "Receive Offer Letters",
        "Sign with a College"
    ]
    let images = [
        "step1",
        "step2",
        "step3",
        "step4",
        "step5",
        "step6",
    ]
    var body: some View {
        NavigationStack{
            VStack{
                HStack(spacing: 0 ){
                    ForEach(0..<3, id: \.self) {index in
                        RecruitmentStepView(
                            imageName: images[index],
                            textName: recruitingSteps[index],
                            stepNumber: String(index + 1)
                        )
                        .padding(10)
                    }
                }
                .padding(.top, 10)
                HStack(spacing: 0 ){
                    ForEach(3..<6, id: \.self) {index in
                        RecruitmentStepView(
                            imageName: images[index],
                            textName: recruitingSteps[index],
                            stepNumber: String(index + 1)
                        )
                        .padding(10)

                    }
                }
                .padding(.top, 5)
                
            }
            .scrollIndicators(.hidden)
            .padding(.horizontal, 5)
            .padding(.bottom, 5)
        }


    }
}

#Preview {
    CategoryGroupView()
}
