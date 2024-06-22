//
//  AccountTypeView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/21/24.
//

import SwiftUI

struct ChooseSportView: View {
    @State var athleteIsChecked = false
    @State var coachIsChecked = false

    @State var fanIsChecked = false
    @State var businessIsChecked = false
    @EnvironmentObject var feedVM: FeedVM

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 70)
                Spacer()
                    .frame(height: 40)

                Text("Choose your sport")
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
                            Image("football_icon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                            Spacer()
                                .frame(width: 20)
                            Text("Football")
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
                            Image("basketball_icon")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                                .background{
                                    Circle().fill(.white)
                                }
                            Spacer()
                                .frame(width: 20)
                            Text("Basketball")
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
                            Image("soccer_icon")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                                .background{
                                    Circle().fill(.white)
                                }
                            Spacer()
                                .frame(width: 20)
                            Text("Soccer")
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
                            Image("swimming_icon")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 60, height: 60)
                                .background{
                                    Circle().fill(.white)
                                }
                            Spacer()
                                .frame(width: 20)
                            Text("Swimming")
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
                HStack{
                    Spacer()
                    Button{
                        
                    }label: {
                        Text("Show More Sports")
                            .foregroundStyle(.white)
                            .font(.title2)
                            .padding(.vertical, 10)
                    }
                    Spacer()
                }
                Spacer()
                    .frame(height: 40)
                
                HStack{
                    Spacer()
                    NavigationLink{
                        
                        UseNPAFor()//ProfileInfoView()
                        
                    }label:{
                        Text("Next")
                            .foregroundStyle(Color(hex: "0A66C2"))
                            .font(.system(.title2, design: .rounded))
                            .bold()
                            .background{
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(.white)
                                    .padding(.horizontal, -35)
                                    .padding(.vertical, -15)
                                
                            }
                        
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        let defaults = UserDefaults.standard
                        defaults.set("Athlete", forKey: "User Type")
                        print("Hello world!")
                    })
                    Spacer()
                }
                Spacer()
                
            }
            .frame(width: deviceWidth, height: deviceHeight)
            .background{
                Image("background")
                    .blur(radius: 20)
            }
            .ignoresSafeArea(.all, edges: .top)
            
            
        }.navigationBarBackButtonHidden()
            .onAppear{
                feedVM.signupProgress = 0.5
            }
    }
}

#Preview {
    ChooseSportView()
}
