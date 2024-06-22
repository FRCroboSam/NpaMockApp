//
//  AccountTypeView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 4/21/24.
//

import SwiftUI

struct ProfileInfoView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var location: String = ""
    
    @State var athleteIsChecked = false
    @State var coachIsChecked = false
    @State var fanIsChecked = false
    @State var businessIsChecked = false
    @EnvironmentObject var feedVM: FeedVM
    
    @State private var date = Date.now
    @State var email = ""
    @State var password = ""

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 70)
                Spacer()
                    .frame(height: 40)

                Text("Enter Your Personal Information")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.leading, 15)
                Spacer()
                    .frame(height: 20)
                HStack {
                    TextField("First Name", text: $firstName)
                        .foregroundColor(.black)
                        .textContentType(.newPassword)
                        .keyboardType(.asciiCapable)
                        .autocorrectionDisabled()
                        .listRowSeparator(.hidden)
                }.modifier(customViewModifier(roundedCornes: 15, startColor: Color(UIColor.white), endColor: Color(UIColor.white), textColor: .black, ratio: 0.9))
                    .padding(.leading, 10)

                
                HStack {
                    SecureField("Last Name", text: $lastName)
                        .foregroundColor(.black)
                        .textContentType(.newPassword)
                        .keyboardType(.asciiCapable)
                        .autocorrectionDisabled()
                        .listRowSeparator(.hidden)
                }.modifier(customViewModifier(roundedCornes: 15, startColor: Color(UIColor.white), endColor: Color(UIColor.white), textColor: .black, ratio: 0.9))
                    .padding(.leading, 10)

                Spacer()
                    .frame(height: 20)
                DatePicker(selection: $date, in: ...Date.now, displayedComponents: .date) {
                    Text("Select your birthday")
                        .font(.title2)
                        .bold()
                }
                .colorInvert()
                .colorMultiply(.white)
                .padding(.leading, 15)

                Spacer()
                    .frame(height: 20)

                Text("Enter your Location")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .bold()
                    .padding(.leading, 15)
                Spacer()
                    .frame(height: 20)
                HStack {
                    TextField("ie. 'Seattle, WA' ", text: $location)
                        .foregroundColor(.black)
                        .textContentType(.newPassword)
                        .keyboardType(.asciiCapable)
                        .autocorrectionDisabled()
                        .listRowSeparator(.hidden)
                }.modifier(customViewModifier(roundedCornes: 15, startColor: Color(UIColor.white), endColor: Color(UIColor.white), textColor: .black, ratio: 0.9))
                    .padding(.leading, 10)
                Spacer()
                    .frame(height: 20)
                
                Text("Login Information")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.leading, 15)

                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    TextField("Enter an email", text: $email)
                        .foregroundColor(.black)
                        .textContentType(.newPassword)
                        .keyboardType(.asciiCapable)
                        .autocorrectionDisabled()
                        .listRowSeparator(.hidden)
                }.modifier(customViewModifier(roundedCornes: 15, startColor: Color(UIColor.white), endColor: Color(UIColor.white), textColor: .black, ratio: 0.9))
                    .padding(.leading, 10)
                
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.black)
                    SecureField("Enter a Password", text: $password)
                        .foregroundColor(.black)
                        .textContentType(.newPassword)
                        .keyboardType(.asciiCapable)
                        .autocorrectionDisabled()
                        .listRowSeparator(.hidden)
                }.modifier(customViewModifier(roundedCornes: 15, startColor: Color(UIColor.white), endColor: Color(UIColor.white), textColor: .black, ratio: 0.9))
                    .padding(.leading, 10)
                
                
                
                
                
                Spacer()
                    .frame(height: 30)
                HStack{
                    Spacer()
                    Text("By selecting Agree and Finish, you agree to NPA terms and conditions outlined h̲e̲r̲e̲")
                        .padding(.horizontal, 10)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Spacer()
                }
                Spacer()
                    .frame(height: 15)
                HStack{
                    Spacer()
                    Button{
                        let defaults = UserDefaults.standard
                        defaults.set("Athlete", forKey: "User Type")
                        feedVM.loggedIn = true
                        feedVM.isSigningUp = false
                    }label:{
                        Text("Agree and Finish")
                            .foregroundStyle(Color(hex: "0A66C2"))
                            .font(.system(.title2, design: .rounded))
                            .bold()
                            .padding(.horizontal, 25)
                            .padding(.vertical, 10)

                            .background{
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(.white)
                            }
                        
                    }
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
            feedVM.signupProgress = 1.0
        }
    }
}

#Preview {
    ChooseSportView()
}
