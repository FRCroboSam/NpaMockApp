//
//  HomePageView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/21/24.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .center){
                
                Image("transparent_full_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: deviceWidth, height: 400)
                    .padding(.top, 200)

                    Text("Elevate Your game")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                    Text("One Stride At A Time")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                    Spacer()
                        .frame(height: 50)
                    NavigationLink{
                        AccountTypeView()
                    }label:{
                        Text("Join Us")
                            .foregroundStyle(Color(hex: "0A66C2"))
                            .font(.system(.title2, design: .rounded))
                            .bold()
                        //.foregroundStyle(.black)
                            .background{
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(.white)
                                    .frame(width: 7/8 * deviceWidth)
                                    .padding(.vertical, -15)
                                
                            }
                    }
                    .padding(.bottom, 50)
                    
                    NavigationLink{
                        LoginPage()
                    }label:{
                        Text("Sign In")
                            .font(.system(.title2, design: .rounded))
                            .bold()
                            .foregroundStyle(.white)
                            .background{
                                RoundedRectangle(cornerRadius: 35)
                                    .strokeBorder(.white)
                                    //.padding(.horizontal, -20)
                                    .frame(width: 7/8 * deviceWidth)
                                    .padding(.vertical, -15)
                                
                            }
                    }
                    .padding(.bottom, 100)

                
                
            }
            .ignoresSafeArea(.all, edges: .top)
            .frame(width: deviceWidth, height: deviceHeight)
            .background{
                 Image("background")
//                LinearGradient(gradient:Gradient(colors:[
//
//                    Color(hex: "00008b"),
//                    Color(hex: "0A66C2"),
//                    
//
//
//                ]),
//                   startPoint:.top,endPoint:.bottom)

            }
            .ignoresSafeArea(.all, edges: .top)
        }.tint(.gray.opacity(0.7))
        

        
    }
}

#Preview {
    HomePageView()
}
