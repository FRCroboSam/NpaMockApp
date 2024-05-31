//
//  SearchView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/19/24.
//

import SwiftUI

struct SearchView: View {
    @State var searchTeacher: String = ""
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(alignment: .leading){
            Spacer()
                .frame(height: 10)
            HStack(spacing: 5){
                Button{
                    dismiss()
                }label:{
                    Image(systemName: "chevron.down")
                        .font(.system(size: 30))
                        .bold()
                        .foregroundStyle(.blue)
                        .rotationEffect(.degrees(90))
                        .padding(.horizontal, 5)
                }
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                    TextField("What's on your mind", text: $searchTeacher)
                        .foregroundColor(.black)
                        .textContentType(.newPassword)
                        .keyboardType(.asciiCapable)
                        .autocorrectionDisabled()
                        .listRowSeparator(.hidden)
                }.modifier(customViewModifier(roundedCornes: 30, startColor: Color(UIColor.systemGray5), endColor: Color(UIColor.systemGray5), textColor: .black, ratio: 0.8))
            }
            ScrollView(.vertical){
                VStack(alignment: .leading, spacing: 15){
                    Spacer()
                        .frame(height: 15)
                    Text("Shop")
                        .bold()
                        .font(.system(size: 25))
                    HStack{
                        Image(systemName: "tshirt.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                        
                            .background{
                                Color(UIColor.systemGray4)
                                    .clipShape(.circle)
                            }
                        
                        Text("Apparel")
                            .font(.system(size: 20))
                        
                    }
                    
                    HStack{
                        Image(systemName: "shoeprints.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                        
                            .background{
                                Color(UIColor.systemGray4)
                                    .clipShape(.circle)
                            }
                        
                        Text("Shoes")
                            .font(.system(size: 20))
                        
                    }
                    HStack{
                        Image(systemName: "soccerball")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                        
                            .background{
                                Color(UIColor.systemGray4)
                                    .clipShape(.circle)
                            }
                        
                        Text("Sports Equipment")
                            .font(.system(size: 20))
                        
                    }
                    Text("Athletes")
                        .bold()
                        .font(.system(size: 25))
                    HStack{
                        Image(systemName: "person.icloud.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                        
                            .background{
                                Color(UIColor.systemGray4)
                                    .clipShape(.circle)
                            }
                        
                        Text("Agents")
                            .font(.system(size: 20))
                        
                    }
                    HStack{
                        Image(systemName: "person.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                        
                            .background{
                                Color(UIColor.systemGray4)
                                    .clipShape(.circle)
                            }
                        
                        Text("Coaches")
                            .font(.system(size: 20))
                        
                    }
                    HStack{
                        Image(systemName: "person.3.fill")
                            .font(.system(size: 15))
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                        
                            .background{
                                Color(UIColor.systemGray4)
                                    .clipShape(.circle)
                            }
                        
                        Text("Teams")
                            .font(.system(size: 20))
                        
                    }
                    HStack{
                        Image(systemName: "figure.run")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                        
                            .background{
                                Color(UIColor.systemGray4)
                                    .clipShape(.circle)
                            }
                        
                        Text("Athletes")
                            .font(.system(size: 20))
                        
                        
                    }
                    HStack{
                        Image(systemName: "trophy.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                        
                            .background{
                                Color(UIColor.systemGray4)
                                    .clipShape(.circle)
                            }
                        
                        Text("Showcases")
                            .font(.system(size: 20))
                        
                    }
                    HStack{
                        Image(systemName: "tent.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                        
                            .background{
                                Color(UIColor.systemGray4)
                                    .clipShape(.circle)
                            }
                        
                        Text("Camps")
                            .font(.system(size: 20))
                        
                    }
                    Text("Health and Wellness")
                        .bold()
                        .font(.system(size: 25))
                    HStack{
                        Image(systemName: "pill.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                        
                            .background{
                                Color(UIColor.systemGray4)
                                    .clipShape(.circle)
                            }
                        
                        Text("Supplements")
                            .font(.system(size: 20))
                        
                    }
                    HStack{
                        Image(systemName: "figure.mind.and.body")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                        
                            .background{
                                Color(UIColor.systemGray4)
                                    .clipShape(.circle)
                            }
                        
                        Text("Chiropractors")
                            .font(.system(size: 20))
                        
                    }
                    HStack{
                        Image(systemName: "figure.mind.and.body")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                        
                            .background{
                                Color(UIColor.systemGray4)
                                    .clipShape(.circle)
                            }
                        
                        Text("Sports Psychologists")
                            .font(.system(size: 20))
                        
                    }
                    HStack{
                        Image(systemName: "figure.mind.and.body")
                            .font(.system(size: 20))
                            .foregroundStyle(.black)
                            .frame(width: 40, height: 40)
                        
                            .background{
                                Color(UIColor.systemGray4)
                                    .clipShape(.circle)
                            }
                        
                        Text("Nutritionists")
                            .font(.system(size: 20))
                        
                    }


                    
                }
            }
                .scrollIndicators(.hidden)

        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    SearchView()
}
