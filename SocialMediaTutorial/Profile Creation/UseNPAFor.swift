//
//  UseNPAFor.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/16/24.
//

import Foundation
import SwiftUI

struct UseNPAFor: View{
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var feedVM: FeedVM
    @State var show = false
    let goals = [
        "Discover Athletes", "Watch Sport Highights", "Read Blogs",
        "Develop skills", "Shop for gear", "Sponsor Athletes", "Get Recruited"
    ]
    @State var selectedIndexes = [0, 0, 0, 0, 0, 0, 0]
    @State var showIndexes = [0, 0, 0, 0, 0, 0, 0]

    var body: some View{
        NavigationStack{
            VStack(alignment: .leading){
                Text("What do you want to use NPA for?")
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(.leading, 10)
                    .bold()
                
                Spacer()
                    .frame(height: 20)
                
                Text("This will help us customize your feed, recommendations, and more!")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .padding(.leading, 10)
                Spacer()
                    .frame(height: 20)
                if(show){
                    ForEach(Array(stride(from: 0, to: goals.count, by: 2)), id: \.self) { index in
                        HStack {
                            if(showIndexes[index] != 0){
                                Text(goals[index])
                                    .transition(.opacity)
                                
                                    .foregroundColor(selectedIndexes[index] == 0 ?
                                                     Color.black.opacity(0.6) : Color(hex: "0A66C2"))
                                    .padding(10)
                                    .background{
                                        RoundedRectangle(cornerRadius: 25)
                                            .foregroundStyle(selectedIndexes[index] == 0 ?
                                                             Color.gray.opacity(0.3) : Color.white)
                                    }
                                    .onTapGesture{
                                        withAnimation(.easeIn){
                                            if(selectedIndexes[index] == 0){
                                                selectedIndexes[index] = 1
                                            }
                                            else{
                                                selectedIndexes[index] = 0
                                            }
                                        }
                                    }
                                
                                    .padding(5)
                            }
                            if(index + 1 < goals.count && showIndexes[index + 1] != 0){
                                if index + 1 < goals.count {
                                    Text(goals[index + 1])
                                        .foregroundColor(selectedIndexes[index + 1] == 0 ?
                                                         Color.black.opacity(0.6) : Color(hex: "0A66C2"))
                                        .padding(10)
                                        .transition(.scale)
                                    
                                        .background{
                                            RoundedRectangle(cornerRadius: 25)
                                                .foregroundStyle(selectedIndexes[index + 1] == 0 ?
                                                                 Color.gray.opacity(0.3) : Color.white)
                                        }
                                        .onTapGesture{
                                            withAnimation(.easeIn){
                                                if(selectedIndexes[index + 1] == 0){
                                                    selectedIndexes[index + 1] = 1
                                                }
                                                else{
                                                    selectedIndexes[index + 1] = 0
                                                }
                                            }
                                        }
                                }
                            }
                        }
                    }
                    .padding(.leading, 10)
                }
                else{
                    EmptyView()
                }
                Spacer()
                    .frame(height: 50)
                HStack{
                    Spacer()
                    NavigationLink{
                        
                        ProfileInfoView()
                        
                    }label:{
                        Text("Next")
                            .foregroundStyle(Color(hex: "0A66C2"))
                            .font(.system(.title2, design: .rounded))
                            .bold()
                            .background{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.white)
                                    .padding(.horizontal, -30)
                                    .padding(.vertical, -10)
                                
                            }
                        
                    }
                    Spacer()
                }
            }
        }.navigationBarBackButtonHidden(true)
            .modifier(HideBackButton(dismiss: _dismiss, color: .white))
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                withAnimation(.easeIn){
                    show.toggle()
                    let initialDelay = 0.05
                    // Interval between each update
                    var interval = 0.3

                    for i in 0..<7 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + initialDelay + (interval * Double(i))) {
                            withAnimation(.easeIn){
                                showIndexes[i] = 1
                            }
                        }
                        interval -= 0.02

                    }
                }
            }
        }
        .background{
            Image("background")
                .blur(radius: 20)
        }
        .onAppear{
            feedVM.signupProgress = 0.75
        }
        .ignoresSafeArea(.all, edges: .top)
        
    }
}
