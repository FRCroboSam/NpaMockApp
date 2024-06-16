//
//  TrainingContentView.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/31/24.
//

import SwiftUI

struct RecoveryContentView: View {
    let recipeTypes = [
        "Trending",
        "Gluten-Free",
        "Vegan",
        "Protein-Heavy",
        "Low Carb",
    ]
    @State var selectedRecipe = "Trending"
    let recipeNames = [
        "Sweet Potato Mac and Cheese",
        "Almand Flour Banana Muffins",
        "Fruit and Oat Protein Bars",
        "Baked Plantain Chips",
        "Sweet Potato Toasts"
    ]
    let recipeImages = [
        "https://www.bucketlisttummy.com/wp-content/uploads/2019/06/Veggie-Pasta-Bake2_resize.jpg",
        "https://www.bucketlisttummy.com/wp-content/uploads/2019/06/Almond-Flour-Banana-Muffins-in-bowl.jpg",
        "https://www.bucketlisttummy.com/wp-content/uploads/2019/06/Healthy-Fruit-Oatmeal-bars.jpg",
        "https://www.bucketlisttummy.com/wp-content/uploads/2019/06/almond-butter-stuffed-dates-3.jpg",
        "https://www.bucketlisttummy.com/wp-content/uploads/2019/06/ProteinOats.jpg"
    ]
    @State var categories = [
        "Nutrition",
        "Recovery",
        "Physical Therapy",
        "Injury Recovery"
        
    ]
    @State var selectedCategory = "Nutrition"
    
    var body: some View {
        CustomNavBar(title: "Recovery")
            

        ScrollView(){
            Spacer()
                .frame(height: 10)
            
            CategoryTabView( selection: $selectedCategory, categories: categories)

            Divider()
                .padding(.top, 5)

            Spacer()
                .frame(height: 20)
            let filters = [
                "Length",
                "Level",
                "Type"
            ]
            
            HStack{
                Image(systemName: "slider.horizontal.3")
                    .font(.title2)
                    .padding(10)
                    .foregroundStyle(.white)
                    .background{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.gray.opacity(0.5))
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, -15)
                CategoryTabView( selection: $selectedRecipe, categories: recipeTypes, fillMode: false, horizontalPadding: 5)
            }
            Spacer()
                .frame(height: 15)
            ForEach(recipeTypes.indices, id: \.self) { index in
                let event_url = recipeImages[index]
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
                                        Text("45 min")
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
                                    Text("Beginner-Friendly")
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
                                    Text(recipeNames[index])
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
                        LoadingView(width:  7/8 * deviceWidth, height:200)

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

