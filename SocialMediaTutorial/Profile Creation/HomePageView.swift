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
            VStack(alignment: .leading){
                
                Image("transparent_full_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: deviceWidth, height: 400)
                HStack{
                    Spacer()
                    NavigationLink{
                        AccountTypeView()
                    }label:{
                        Text("Join Us")
                            .font(.system(.title2, design: .rounded))
                            .bold()
                        //.foregroundStyle(.black)
                            .background{
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(.white)
                                    .padding(.horizontal, -20)
                                    .padding(.vertical, -15)
                                
                            }
                    }
                    Spacer()
                        .frame(width: 70)
                    Button{
                        
                    }label:{
                        Text("Sign In")
                            .font(.system(.title2, design: .rounded))
                            .bold()
                            .foregroundStyle(.white)
                            .background{
                                RoundedRectangle(cornerRadius: 35)
                                    .strokeBorder(.white)
                                    .padding(.horizontal, -20)
                                    .padding(.vertical, -15)
                                
                            }
                    }
                    Spacer()
                    
                }
                Spacer()
                    .frame(height: 100)
                
                
            }
            .ignoresSafeArea(.all, edges: .top)
            .frame(width: deviceWidth, height: deviceHeight)
            .background{
                LinearGradient(gradient:Gradient(colors:[

                    Color(hex: "00008b"),
                    Color(hex: "0A66C2"),
                    


                ]),
                   startPoint:.top,endPoint:.bottom)

            }
            .ignoresSafeArea(.all, edges: .top)
        }
        

        
    }
}

#Preview {
    HomePageView()
}
