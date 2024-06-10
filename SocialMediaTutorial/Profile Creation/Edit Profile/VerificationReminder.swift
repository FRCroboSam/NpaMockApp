//
//  VerificationNotification.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/3/24.
//

import SwiftUI

struct VerificationReminder: View {
    @State var fill: CGFloat = 0

    var body: some View {
        HStack(alignment: .center){
            ZStack{
                Circle()
                    .stroke(Color.gray.opacity(0.3),
                            style: StrokeStyle(lineWidth: 10,
                                               lineCap: .round)
                    )
                    .frame(width: 70, height: 70)
                Circle()
                    .trim(from: 0, to: self.fill)
                    .stroke(Color(hex: "0A66C2"),
                            style: StrokeStyle(lineWidth: 10,
                                               lineCap: .round)
                    )
                    .rotationEffect(.init(degrees: -90))
                    .frame(width: 70, height: 70)
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(Color(hex: "0A66C2"))
                    .bold()
                    .font(.title)
            }
            .scaleEffect(0.7)

            
            VStack(alignment: .leading){
                Spacer()
                    .frame(height: 5)

                Text("Verification Reminder")
                    .bold()
                    .font(.headline)
                Spacer()
                    .frame(height: 5)
                Text("Stand out to coaches, access full features, and more ")
                    .font(.subheadline)
                    .foregroundStyle(.black.opacity(0.4))
                
            }
            Spacer()
            Image(systemName: "chevron.down")
                .foregroundStyle(.gray)
                .font(.title2)
                .rotationEffect(.init(degrees: -90))
                .padding(10)

            
        }
        .frame(width: 9/10 * deviceWidth, height: 80)
            .background{

                Color(UIColor.white).opacity(0.95)
                    .cornerRadius(30)
                    .shadow(radius: 1.0)
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
    VerificationReminder()
}
