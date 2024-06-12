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
    var body: some View{
        Spacer()
            .frame(height: 10)
        ScrollView(.vertical){
            VStack(alignment: .leading){
                Text("Discover Mental Mastery.")
                    .bold()
                    .font(.title)
                    .frame(width: 3/4 * deviceWidth)
                    .lineLimit(2)
                    .padding(.leading, -10)
                Spacer()
                    .frame(height: 25)
                    .font(.subheadline)
                HStack{
                    Spacer()
                    VStack{
                        
                        Text("Modules")
                            .foregroundStyle(selection == "Modules" ? Color.blue.opacity(0.8) : Color.gray.opacity(0.5))
                            .font(.title3)
                        
                            .onTapGesture {
                                withAnimation(.easeIn){
                                    selection = "Modules"
                                }
                            }
                            .padding(10)
                        Rectangle()
                            .fill(selection == "Modules" ? Color.blue : Color.clear)

                            .frame(width: 50, height: 3)
                    }
                    .padding(10)
                    .background{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(selection == "Modules" ?  Color.blue.opacity(0.1) : Color.clear)
                    }
                    Spacer()
                    VStack{
                        Text("Coaching")
                            .foregroundStyle(selection != "Modules" ? Color.blue.opacity(0.8) : Color.gray.opacity(0.5))
                            .font(.title3)
                            .onTapGesture {
                                withAnimation(.easeIn){
                                    selection = "Coaching"
                                }
                            }
                            .padding(10)
                            
                        Rectangle()
                            .fill(selection == "Coaching" ? Color.blue : Color.clear)
                            .frame(width: 50, height: 3)
                    }
                    .padding(10)
                    .background{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(selection == "Coaching" ?  Color.blue.opacity(0.1) : Color.clear)
                    }
                    Spacer()
                }
                .frame(width: deviceWidth)
                Spacer()
                    .frame(height: 10)
                VStack{
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
                        .frame(width: 3/4 * deviceWidth, height: 120)
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
                        .frame(width: 3/4 * deviceWidth, height: 120)
                        
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
                        .frame(width: 3/4 * deviceWidth, height: 120)

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


