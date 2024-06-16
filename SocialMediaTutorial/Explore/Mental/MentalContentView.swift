//
//  MentalContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/10/24.
//

import Foundation
import SwiftUI

struct MentalContentView: View {
    @State var selection = "Modules"
    
    let tabs = [
        "Modules",
        "Coaching",
    ]
    @State var selected = "Modules"
    var body: some View{
        CustomNavBar(title: "Mental Mastery")

        ScrollView(.vertical){
            VStack(alignment: .leading){

                Spacer()
                    .frame(height: 25)
                    .font(.subheadline)
                CategoryTabView(selection: $selection, categories: tabs)
                Divider()
                    .padding(.top, 5)

                Spacer()
                    .frame(height: 10)
                VStack(alignment: .leading){
                    HStack{
                        Text("NPA+")
                            .foregroundStyle(.blue)
                            .bold()
                            .font(.title2)
                            .lineLimit(2)
                        Text("Modules")
                            .bold()
                            .font(.title2)
                        Spacer()
                    }
                    .padding(.leading, 10)
                    Spacer()
                        .frame(height: 10)
                        HStack(alignment: .center){
                            Image(systemName: "wind")
                                .font(.title)
                                .padding(10)
                                .background{
                                    Circle()
                                        .fill(Color.green.opacity(0.2))
                                    
                                }
                            VStack(alignment: .leading){
                                Text("Breathing")
                                    .bold()
                                Text("Learn how to breathe in big moments.")
                                    .font(.caption)
                            }
                            Spacer()
                            Image(systemName: "chevron.down")
                                .font(.title)
                                .rotationEffect(.init(degrees: -90))
                                .padding(.trailing, 10)

                        }
                        .padding(10)
                        .frame(width: 7/8 * deviceWidth, height: 120)
                        .background{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .shadow(radius: 1)
                        }
                        .padding(10)
                        
                        HStack(alignment: .center){
                            Image(systemName: "sun.max")
                                .font(.title)
                                .padding(10)
                                .background{
                                    Circle()
                                        .fill(Color.yellow.opacity(0.2))
                                    
                                }
                            VStack(alignment: .leading){
                                Text("Confidence")
                                    .bold()
                                Text("Use self talk to boost yourself up.")
                                    .font(.caption)
                            }
                            Spacer()
                            Image(systemName: "chevron.down")
                                .font(.title)
                                .rotationEffect(.init(degrees: -90))
                                .padding(.trailing, 10)

                        }
                        .padding(10)
                        .frame(width: 7/8 * deviceWidth, height: 120)
                        
                        .background{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .shadow(radius: 1)
                        }
                        .padding(10)
                        
                        HStack(alignment: .center){
                            Image(systemName: "brain.head.profile")
                                .font(.title)
                                .padding(10)
                                .background{
                                    Circle()
                                        .fill(Color.gray.opacity(0.2))
                                    
                                }
                            VStack(alignment: .leading){
                                Text("Image Visualization")
                                    .bold()
                                Text("Unlock your full potential with scenario visualization")
                                    .font(.caption)
                            }
                            Spacer()
                            Image(systemName: "chevron.down")
                                .font(.title)
                                .rotationEffect(.init(degrees: -90))
                                .padding(.trailing, 10)
                        }
                        .padding(10)
                        .frame(width: 7/8 * deviceWidth, height: 120)

                        .background{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .shadow(radius: 1)
                        }
                        .padding(10)
                    
                }.scrollIndicators(.hidden)
                    .padding(.leading, 20)
            }
        }
    }
}


