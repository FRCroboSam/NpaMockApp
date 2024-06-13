//
//  VerificationNotification.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/3/24.
//

import SwiftUI

struct VerificationNotification: View {
    @State var fill: CGFloat = 0

    var body: some View {
        HStack(alignment: .center){
            ZStack{
                Circle()
                    .stroke(Color.gray.opacity(0.3),
                            style: StrokeStyle(lineWidth: 10,
                                               lineCap: .round)
                    )
                    .frame(width: 100, height: 100)
                Circle()
                    .trim(from: 0, to: self.fill)
                    .stroke(Color(hex: "0A66C2"),
                            style: StrokeStyle(lineWidth: 10,
                                               lineCap: .round)
                    )
                    .rotationEffect(.init(degrees: -90))
                    .frame(width: 100, height: 100)
                Text("33%")
                    .foregroundStyle(Color(hex: "0A66C2"))
                    .bold()
                    .font(.title)
            }
            .scaleEffect(0.7)

            
            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 10)

                Text("Verification Tasks")
                    .bold()
                    .foregroundStyle(.black)
                    .font(.title3)
                Spacer()
                    .frame(height: 5)
                HStack{
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "checkmark")
                                .bold()
                                .foregroundColor(.green)
                            Text("Verify Email")
                                .foregroundStyle(.green)

                        }
                        HStack{
                            Image(systemName: "xmark")
                            Text("Upload Transcript")
                                .lineLimit(1)
                        }
                        .foregroundStyle(.gray)

                        HStack{
                            Image(systemName: "xmark")
                            Text("Drug Screening")
                        }
                        .foregroundStyle(.gray)
                        Spacer()
                            .frame(height: 5)
                        
                    }
                }
                
                Spacer()
                    .frame(height: 5)
                
            }
            Spacer()
            Image(systemName: "chevron.down")
                .foregroundStyle(.gray)
                .font(.title2)
                .rotationEffect(.init(degrees: -90))
                .padding(10)

            
        }
            .frame(width: 7/8 * deviceWidth)
            .background{

                Color.white
                    .cornerRadius(30)
                    .shadow(radius: 1)
            }
            .onAppear{
                self.fill = 0.0
                withAnimation(.easeInOut.speed(0.5)){
                    self.fill = 0.33
                }
            }
    }
}

#Preview {
    VerificationNotification()
}
