//
//  FilterScrollView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/9/24.
//

import SwiftUI

struct FilterScrollView: View {
    var body: some View {
        ScrollView(.horizontal)
        {
            HStack(spacing: 15){
                //                            Text("Sponsor and interact with your favorite athletes!")
                //                                .bold()
                //                                .font(.subheadline)
               
            

                HStack{
                    Image(systemName: "cart")
                    Text("Shop")
                        .foregroundStyle(.black.opacity(0.7))
                }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    
                    .background{
                        
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.gray.opacity(0.3))
                        
                        //.strokeBorder(Color(UIColor.systemGray4))
                            //.shadow(color: Color(UIColor.gray).opacity(0.6),radius: 1.6)*/
                            //.mask(RoundedRectangle(cornerRadius: 15).padding(.bottom, -10))
                                //.padding(.horizontal, -10)
                            //.shadow(color: Color(UIColor.gray).opacity(0.8), radius: 1.7)
                        
                    }
                    .padding(.leading, 10)
//                                            Divider()
//                                                .overlay(Color.gray.opacity(0.8)
//                                                    .frame(width: 0.2)
//                                                )
                HStack{
                    Image(systemName: "tent")
                    Text("Camps")
                        .foregroundStyle(.black.opacity(0.7))
                }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    
                    .background{
                        
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.gray.opacity(0.3))
                        
                        //.strokeBorder(Color(UIColor.systemGray4))
                            //.shadow(color: Color(UIColor.gray).opacity(0.6),radius: 1.6)*/
                            //.mask(RoundedRectangle(cornerRadius: 15).padding(.bottom, -10))
                                //.padding(.horizontal, -10)
                            //.shadow(color: Color(UIColor.gray).opacity(0.8), radius: 1.7)
                        
                    }
                HStack{
                    Image(systemName: "trophy")
                    Text("games")
                        .foregroundStyle(.black.opacity(0.7))
                }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    
                    .background{
                        
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.gray.opacity(0.3))
                        
                        //.strokeBorder(Color(UIColor.systemGray4))
                            //.shadow(color: Color(UIColor.gray).opacity(0.6),radius: 1.6)*/
                            //.mask(RoundedRectangle(cornerRadius: 15).padding(.bottom, -10))
                                //.padding(.horizontal, -10)
                            //.shadow(color: Color(UIColor.gray).opacity(0.8), radius: 1.7)
                        
                    }
                HStack{
                    Image(systemName: "dumbell")
                    Text("Workout Plans")
                        .foregroundStyle(.black.opacity(0.7))
                }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    
                    .background{
                        
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(Color.gray.opacity(0.3))
                        
                        //.strokeBorder(Color(UIColor.systemGray4))
                            //.shadow(color: Color(UIColor.gray).opacity(0.6),radius: 1.6)*/
                            //.mask(RoundedRectangle(cornerRadius: 15).padding(.bottom, -10))
                                //.padding(.horizontal, -10)
                            //.shadow(color: Color(UIColor.gray).opacity(0.8), radius: 1.7)
                        
                    }
                
                
            }
            .padding(10)
        }.scrollIndicators(.hidden)
            
    }
}

#Preview {
    FilterScrollView()
}
