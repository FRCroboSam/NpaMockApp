//
//  TrainingContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/31/24.
//

import SwiftUI

struct TrainingContentView: View {
    var body: some View {
        ScrollView(){
            let workoutTypes = [
                "HIIT",
                "Yoga",
                "Build Muscle",
                "Beginner",
                "Trending"
            ]
            let workoutNames = [
                "Full Body Gauntlet",
                "Strength and Conditioning Circuit",
                "Bodyweight Master",
                "High Intensity Interval Training",
                "Cardiovascular Endurance"
            ]
            let workoutAppImages = [
                "https://media.istockphoto.com/id/1464035806/photo/black-sportswoman-doing-chest-exercises-on-machine-while-working-out-in-gym.jpg?s=612x612&w=0&k=20&c=QC6pNijzOzDbvgZUeKzSEsFXM4OThz10LA3My98fjDA=",
                "https://img.freepik.com/premium-photo/young-woman-workout-exercises-machine-fitness-gym_171337-71060.jpg",
                "https://hauteintexas.com/wp-content/uploads/2023/12/Untitled-design-25-1024x576.png",
                "https://phantom-marca.unidadeditorial.es/47d16b4c50d24d2010d04fa45a0966bb/resize/828/f/jpg/assets/multimedia/imagenes/2022/02/08/16443258478254.jpg",
                "https://images.pexels.com/photos/416778/pexels-photo-416778.jpeg?cs=srgb&dl=pexels-pixabay-416778.jpg&fm=jpg"
            ]
            ShopTypes(shopTypes: workoutTypes)
            Divider()
            Spacer()
                .frame(height: 20)
            let filters = [
                "Length",
                "Level",
                "Type"
            ]
            
            EventFilterScrollView(filters: filters)
            Spacer()
                .frame(height: 20)
            Spacer()
                .frame(height: 15)
            ForEach(workoutTypes.indices, id: \.self) { index in
                let event_url = workoutAppImages[index]
                AsyncImage(
                    url: URL(string: event_url),
                    content: { image in
                        image.resizable()
                            .resizable()
                            .scaledToFill()
                            .frame(width:  7/8 * deviceWidth, height:200)
                            .clipped()
                            .brightness(-0.2)

                            .roundedCorner(12, corners: .topLeft)
                            .roundedCorner(12, corners: .topRight)
                            .roundedCorner(12, corners: .bottomLeft)
                            .roundedCorner(12, corners: .bottomRight)

                            .overlay(alignment: .topTrailing) {
                                HStack{
                                    HStack{
                                        Image(systemName: "timer")
                                        Text("15 min")
                                            .bold()
                                            .foregroundStyle(Color.white)
                                    }
                                        .background{
                                            RoundedRectangle(cornerRadius: 12)
                                                .foregroundStyle(Color.gray.opacity(0.8))
                                                .padding(-10)
                                                .shadow(radius: 3)
                                        }
                                        .offset(x: -15, y: 15)
                                    Spacer()
                                        .frame(width: 30)
                                    Text("Intermediate")
                                        .bold()
                                        .foregroundStyle(Color.white)
                                        .background{
                                            RoundedRectangle(cornerRadius: 12)
                                                .foregroundStyle(Color.teal.opacity(0.8))
                                                .padding(-10)
                                                .shadow(radius: 3)
                                        }
                                        .offset(x: -15, y: 15)
                                }
                                
                            }
                            .overlay(alignment: .bottomLeading) {
                                HStack(alignment: .bottom){
                                    Text(workoutNames[index])
                                        .bold()
                                        .foregroundStyle(.white)
                                        .shadow(color: .blue, radius: 10)
                                        .font(.title2)
                                        .padding(10)
                                    
//                                        .background(Color.orange.opacity(0.5))
//                                        .roundedCorner(15, corners: .allCorners)
                                        .padding(.leading, 0)
                                    Spacer()
                                    HStack{
                                        Image(systemName: "flame.fill")
                                        Text("600 cal")
                                            .bold()
                                            .foregroundStyle(Color.white)
                                    }
                                        .background{
                                            RoundedRectangle(cornerRadius: 12)
                                                .foregroundStyle(Color.red.opacity(0.8))
                                                .padding(-10)
                                                .shadow(radius: 3)
                                        }
                                        .padding(.trailing, 15)
                                        .padding(.bottom, 15)

                                    
                                }
                                
                                
                                
                            }
                        
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .offset(x: -5)
                .padding(.bottom, 10)
                Spacer()
                    .frame(height: 10)
            }
            
            
        }
    }
}

#Preview {
    TrainingContentView()
}
