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
                ZStack{
                    SignupIndicatorView()

                    
                }
                Spacer()
                    .frame(height: 40)

                Text("Enter Your Information")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 40))
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                //.frame(width: 7/8 * deviceWidth)
                    .padding(.horizontal, 20)
                
                Text("Personal Information")
                HStack {
                    TextField("First Name", text: $firstName)
                        .foregroundColor(.black)
                        .textContentType(.newPassword)
                        .keyboardType(.asciiCapable)
                        .autocorrectionDisabled()
                        .listRowSeparator(.hidden)
                }.modifier(customViewModifier(roundedCornes: 15, startColor: Color(UIColor.white), endColor: Color(UIColor.white), textColor: .black, ratio: 0.9))
                
                HStack {
                    SecureField("Last Name", text: $lastName)
                        .foregroundColor(.black)
                        .textContentType(.newPassword)
                        .keyboardType(.asciiCapable)
                        .autocorrectionDisabled()
                        .listRowSeparator(.hidden)
                }.modifier(customViewModifier(roundedCornes: 15, startColor: Color(UIColor.white), endColor: Color(UIColor.white), textColor: .black, ratio: 0.9))

                DatePicker(selection: $date, in: ...Date.now, displayedComponents: .date) {
                    Text("Select your birthday")
                }
                .colorInvert()
                .colorMultiply(.white)
                Text("Enter your Location")
                    .font(.title2)
                    .foregroundStyle(.white)
                HStack {
                    TextField("ie. 'Seattle, WA' ", text: $location)
                        .foregroundColor(.black)
                        .textContentType(.newPassword)
                        .keyboardType(.asciiCapable)
                        .autocorrectionDisabled()
                        .listRowSeparator(.hidden)
                }.modifier(customViewModifier(roundedCornes: 15, startColor: Color(UIColor.white), endColor: Color(UIColor.white), textColor: .black, ratio: 0.9))
                
                Text("Login Information")
                
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
                    .frame(height: 40)
                HStack{
                    Spacer()
                    Button{
                        let defaults = UserDefaults.standard
                        defaults.set("Athlete", forKey: "User Type")
                        feedVM.loggedIn = true
                    }label:{
                        Text("Finish")
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
            .frame(width: deviceWidth, height: deviceHeight)
            .background{
                Image("background")
                    .blur(radius: 20)
            }
            .ignoresSafeArea(.all, edges: .top)
            
            
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    ChooseSportView()
}
