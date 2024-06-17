//
//  AccountTypeView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/21/24.
//

import SwiftUI

struct AccountTypeView: View {
    @Environment(\.dismiss) var dismiss


    @EnvironmentObject var feedVM: FeedVM
    @State var athleteIsChecked = false
    @State var coachIsChecked = false

    @State var fanIsChecked = false
    @State var businessIsChecked = false

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 60)
                EmptyNavBar()

                Text("Select your account type")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 40))
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                //.frame(width: 7/8 * deviceWidth)
                    .padding(.horizontal, 20)
                Spacer()
                    .frame(height: 60)
                ZStack {
                    // Overlay to capture taps
                    Color.clear
                        .contentShape(Rectangle())
                        .onTapGesture {
                            athleteIsChecked = false
                            coachIsChecked = false
                            fanIsChecked = false
                            businessIsChecked = false
                            
                            athleteIsChecked = !athleteIsChecked
                        }
                    VStack{
                        HStack{
                            Image(systemName: "figure.run")
                                .font(.system(size: 30))
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                                .background{
                                    Circle().fill(.white)
                                }
                            Spacer()
                                .frame(width: 20)
                            Text("Athletes")
                                .font(.title)
                                .bold()
                                .foregroundStyle(Color(UIColor.systemGray4))
                            Spacer()
                            
                            iosCheckboxToggleStyle(checked: $athleteIsChecked, color: Color(UIColor.white))
                        }
                        .padding(.horizontal, 20)
                        .padding(.trailing, 20)
                        Spacer()
                            .frame(height: 25)
                        Divider()
                            .overlay{
                                Color.white
                            }
                            .frame(width: 6/7 * deviceWidth)
                            .padding(.horizontal, 20)
                    }
                }.frame(height: 100)
                
                Spacer()
                    .frame(height: 20)
                ZStack {
                    // Overlay to capture taps
                    Color.clear
                        .contentShape(Rectangle())
                        .onTapGesture {
                            //TODO: wright code to uncheck all the other ones 
                            athleteIsChecked = false
                            coachIsChecked = false
                            fanIsChecked = false
                            businessIsChecked = false
                            coachIsChecked = !coachIsChecked
                        }
                    VStack{
                        HStack{
                            Image(systemName: "figure.run")
                                .font(.system(size: 30))
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                                .background{
                                    Circle().fill(.white)
                                }
                            Spacer()
                                .frame(width: 20)
                            Text("Coach")
                                .font(.title)
                                .bold()
                                .foregroundStyle(Color(UIColor.systemGray4))
                            Spacer()
                            
                            iosCheckboxToggleStyle(checked: $coachIsChecked, color: Color(UIColor.white))
                        }
                        .padding(.horizontal, 20)
                        .padding(.trailing, 20)
                        Spacer()
                            .frame(height: 25)
                        Divider()
                            .overlay{
                                Color.white
                            }
                            .frame(width: 6/7 * deviceWidth)
                            .padding(.horizontal, 20)
                    }
                }.frame(height: 100)
                Spacer()
                    .frame(height: 20)
                ZStack {
                    // Overlay to capture taps
                    Color.clear
                        .contentShape(Rectangle())
                        .onTapGesture {                            athleteIsChecked = false
                            coachIsChecked = false
                            fanIsChecked = false
                            businessIsChecked = false
                            fanIsChecked = !fanIsChecked
                        }
                    VStack{
                        HStack{
                            Image(systemName: "figure.run")
                                .font(.system(size: 30))
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                                .background{
                                    Circle().fill(.white)
                                }
                            Spacer()
                                .frame(width: 20)
                            Text("Fans")
                                .font(.title)
                                .bold()
                                .foregroundStyle(Color(UIColor.systemGray4))
                            Spacer()
                            
                            iosCheckboxToggleStyle(checked: $fanIsChecked, color: Color(UIColor.white))
                        }
                        .padding(.horizontal, 20)
                        .padding(.trailing, 20)
                        Spacer()
                            .frame(height: 25)
                        Divider()
                            .overlay{
                                Color.white
                            }
                            .frame(width: 6/7 * deviceWidth)
                            .padding(.horizontal, 20)
                    }
                }.frame(height: 100)
                Spacer()
                    .frame(height: 20)
                ZStack {
                    // Overlay to capture taps
                    Color.clear
                        .contentShape(Rectangle())
                        .onTapGesture {
                            athleteIsChecked = false
                            coachIsChecked = false
                            fanIsChecked = false
                            businessIsChecked = false
                            businessIsChecked = !businessIsChecked
                        }
                    VStack{
                        HStack{
                            Image(systemName: "figure.run")
                                .font(.system(size: 30))
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                                .background{
                                    Circle().fill(.white)
                                }
                            Spacer()
                                .frame(width: 20)
                            Text("Business")
                                .font(.title)
                                .bold()
                                .foregroundStyle(Color(UIColor.systemGray4))
                            Spacer()
                            
                            iosCheckboxToggleStyle(checked: $businessIsChecked, color: Color(UIColor.white))
                        }
                        .padding(.horizontal, 20)
                        .padding(.trailing, 20)
                        Spacer()
                            .frame(height: 25)
                        Divider()
                            .overlay{
                                Color.white
                            }
                            .frame(width: 6/7 * deviceWidth)
                            .padding(.horizontal, 20)
                    }
                }.frame(height: 100)
                Spacer()
                    .frame(height: 40)
                HStack{
                    Spacer()
                    
                    NavigationLink{
                        ChooseSportView()
                            .onAppear {
                                let defaults = UserDefaults.standard
                                defaults.set("HELLO", forKey: "User Type")
                            }

                    }label:{
                        Text("Next")
                            .foregroundStyle(Color(hex: "0A66C2"))
                            .font(.system(.title2, design: .rounded))
                            .bold()
                            .background{
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(.white)
                                    .padding(.horizontal, -20)
                                    .padding(.vertical, -15)
                                
                            }
                        
                    }
                    Spacer()
                }
                Spacer()
                
            }
            .onAppear{
                feedVM.isSigningUp = true
            }
            .frame(width: deviceWidth, height: deviceHeight)
            .background{
                Image("background")
                    .blur(radius: 20)

//                LinearGradient(gradient:Gradient(colors:[
//                    Color(hex: "00008b"),
//                    Color(hex: "0A66C2"),
//                    //                Color(hex: "ADD8E6"),
//                    
//                    
//                    
//                ]),
//                               startPoint:.top,endPoint:.bottom)
                
            }
            .ignoresSafeArea(.all, edges: .top)
            
            
        }//.navigationBarBackButtonHidden()

    }
}

#Preview {
    AccountTypeView()
}
