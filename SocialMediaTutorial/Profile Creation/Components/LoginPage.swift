//
//  LoginPage.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 6/16/24.
//

import Foundation
import SwiftUI

struct LoginPage: View {
    @EnvironmentObject var feedVM: FeedVM
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        NavigationStack{
            VStack(alignment: .center){
                Spacer()
                    .frame(height: 100)
                HStack{
                    Text("Login ")
                        .font(.title)
                        .padding(.leading, 15)
                        .bold()
                        .foregroundStyle(.white)
                    Spacer()
                }
                
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    TextField("Enter your email", text: $email)
                        .foregroundColor(.black)
                        .textContentType(.newPassword)
                        .keyboardType(.asciiCapable)
                        .autocorrectionDisabled()
                        .listRowSeparator(.hidden)
                }.modifier(customViewModifier(roundedCornes: 15, startColor: Color(UIColor.white), endColor: Color(UIColor.white), textColor: .black, ratio: 0.9))
                
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.black)
                    SecureField("Enter your Password", text: $password)
                        .foregroundColor(.black)
                        .textContentType(.newPassword)
                        .keyboardType(.asciiCapable)
                        .autocorrectionDisabled()
                        .listRowSeparator(.hidden)
                }.modifier(customViewModifier(roundedCornes: 15, startColor: Color(UIColor.white), endColor: Color(UIColor.white), textColor: .black, ratio: 0.9))
                Spacer()
                    .frame(height: 15)
                Button{
                    self.dismissKeyboard()

                    feedVM.loggedIn = true

                }label:{
                    Text("Sign In")
                        .font(.system(.title2, design: .rounded))
                        .bold()
                        .foregroundStyle(.white)
                        .padding(10)
                        .background{
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(.white)
                                //.padding(.horizontal, -20)
                                .frame(width: 3/4 * deviceWidth)
                        }
                }
                Spacer()
                    .frame(height: 10)
                Text("Forgot Password? Click Here")
                    .font(.headline)
                    .foregroundStyle(.white)
                Spacer()
                    .frame(height: 20)
                HStack{
                    Rectangle()
                        .foregroundStyle(.white)
                        .frame(height: 2)
                        .padding(.leading, 15)
                    Text("or")
                        .font(.caption)
                        .foregroundStyle(.white)
                    Rectangle()
                        .foregroundStyle(.white)
                        .frame(height: 2)
                        .padding(.trailing , 15)



                }
                Spacer()
                    .frame(height: 10)
                HStack{
                    Spacer()
                        .frame(width: 20)
                    Image(systemName: "apple.logo")
                        .foregroundStyle(.black)
                        .font(.system(size: 40))
                    Spacer()
                        .frame(width: 20)
                    Text("Continue with Apple")
                    Spacer()
                }
                .frame(width: 7/8 * deviceWidth)
                .padding(10)
                .background{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(radius: 1)
                }
                Spacer()
                    .frame(height: 10)
                HStack{
                    Spacer()
                        .frame(width: 20)
                    
                    Image("google.logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                    Spacer()
                        .frame(width: 20)
                    Text("Continue with Google")
                    Spacer()
                }
                .frame(width: 7/8 * deviceWidth)
                .padding(10)
                .background{
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .shadow(radius: 1)

                }
                Spacer()
            }
            
            .background{
                Image("background")
                    .blur(radius: 20)
            }
            .ignoresSafeArea(.all, edges: .top)

        }
    }
    func dismissKeyboard(){
        UIApplication.shared.dismissKeyboard()
    }

}

