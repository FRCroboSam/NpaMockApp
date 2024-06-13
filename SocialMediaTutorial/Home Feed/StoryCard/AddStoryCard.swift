//
//  AddStoryCard.swift
//  SocialMediaTutorial
//
//  Created by Eymen on 14.07.2023.
//

import SwiftUI

struct AddStoryCard: View {
    let imageName: String

    var body: some View {
        VStack{
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 5)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 140)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .zIndex(20)
                
            }
            .padding(4)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.teal, Color.orange, Color.yellow, Color.purple]), startPoint: .bottom, endPoint: .top), lineWidth: 3)
                    .zIndex(1)
                
            )
            .overlay{
                VStack(alignment: .leading){
                    Text("SHARE")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                        .bold()
                        .shadow(color: .black, radius: 3)
                    Text("YOUR")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                        .bold()
                        .shadow(color: .black, radius: 3)

                    
                    Text("STORY")
                        .font(.system(size: 17))
                        .foregroundStyle(.white)
                        .bold()
                        .shadow(color: .black, radius: 3)

                    
                }
                .padding(.leading, 5)
                //.padding(.trailing, 10)
                //.offset(x: 10, y: -15)
                //            .background{
                //                Color.blue.opacity(0.6)
                //                    .blur(radius: 10)
                //                    .offset(x: 5, y: -5)
                //            }
            }
        }
        .overlay(alignment: .bottomTrailing){
            Image(systemName: "plus.circle.fill")
                .font(.title)
                .foregroundColor(.blue)
                .frame(width: 40, height: 40)
                .background(Color.white)
                .clipShape(Circle())
                .offset(x: 12, y: 8)
                .zIndex(20)
        }
        .zIndex(20)

    
        .padding(4)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .zIndex(20)
        )
        .zIndex(20)

        //.padding(.bottom, 5)


        
    }
}

struct AddStoryCard_Previews: PreviewProvider {
    static var previews: some View {
        AddStoryCard(imageName: "male_athlete1")
    }
}

