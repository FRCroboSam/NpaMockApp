//
//  ShopContentVIew.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/30/24.
//

import SwiftUI

struct ShopContentView: View {
    @State private var tabs: [String] = [
        "For You",
        "Sports Gear",
        "Shoes",
        "Apparel",
        "Supplements",
        "Courses"
    ]
    @State private var images: [String] = [
        "For You",
        "Sports Gear",
        "Shoes",
        "Apparel",
        "Supplements",
        "Courses"
    ]
    @State var selectedCategory = "For You"
    var item_urls = [
        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQ6tVuA-Ms1ouo00cL5xRgvs1xEXaAUvx77zRoms1qVgoWbQtxxls7k_ccQs3Q7W0cQ4X73rdG8RxXQ33Vrlf5gOO1dvtSgbeDtKbJjeNgY3fo8c0l6Jigqnw&usqp=CAE",
        "https://dks.scene7.com/is/image/dkscdn/24NIKAPHNTMGXLTFGNTHA_Red_White_is/?wid=252&hei=252&qlt=85,0&fmt=jpg&op_sharpen=1",
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS6qS0Vy-LZjb0kgsk-HCs5Do8Jp80me3kVr4s9psAl-pTYzFs04QBnALgbbV4PtnaX4icrG2RExoUh6LJSP9gBRvdAC-nr3T0Be9CkwbAImXBSxB_H8EUxMA&usqp=CAE",
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQ6F3cFfQuyEjlFnLDR-rr0bAWLL12zrPkEmfTAki-VibRkwdJpnmeMccz_VddryRhozYgrgN8Dqax-tdwDv1DYIwQjVacTwxPcN5aXl2E&usqp=CAE",
        "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSiQJ-EclFfDBq70tSirQZg8QDjfgo32fOOVRx3Wg0TiQG820gxvl1D7HwayGPoYO6WrBaM_UcLFSAL-cX_VIzdIw9zO82FlOX_akqx-zRhZBvdoIvKq7vr8Q&usqp=CAE"
    ]
    
    var shoeURLs = [
        "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/5e0a9f08-7b5c-49f7-a85f-36dfe7c2b3c7/infinityrn-4-mens-road-running-shoes-hlqHFQ.png",
        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTuo-8Q08zWPLMcPwoaIdYIZ_Qkas9-Z-5ojJ8ZppfF6OqsKa2enkhvAASBF1CSEb1eSV6pdTFZQA1iC1MrpSXC42WMGQ-RZbonLHKfXkvH3btJ2vZTIj2Wcpk&usqp=CAE",
        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQ4-HsdP3Th-dqwm2svbFbkliCX2MoSFySLU6Ozdb8FvhtppV5pdjyNN8QCMBD0koMr6qMFRzXBw8XxaycSPJtsAplzEE1i6T1x3AXd_QvDGzhpZ2ODFM4Njv4&usqp=CAE",
        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSZJm0Ew_jeuPwFkbYFHaDWJMWw4BvaAxwHOsiXmb3VZ2IoVqhfsyoXUiXTUMO58eWTbFht7V1MBl5IMjVWmGmRBGzLbko4UUSR4eYE5w-HwJrTQYDRnXPm",
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSgRni3XC5F4Ui157l1o7afP37fqsuYJ1w4TQ_uagbhPIse7fZ-tu6Y5shog86AzYMwAtnm-Sk69dv4ROhxoDccy9PXkB9CvJw1ZOWPPR2DbrW9RTOcAHyLaw&usqp=CAE"
        
        
        
        
    ]
    
    
    @State var searchText = ""
    

    
    var body: some View {
        VStack(spacing: 0){
            CustomNavBar(title: "Shop")
            Spacer()
                .frame(height: 15)
            CategoryTabView(selection: $selectedCategory, categories: tabs)
            Divider()
                .padding(.top, 5)
            
            ScrollView(.vertical){
                
                //CategoryTabView(selection: $selectedCategory, categories: categories)
                Spacer()
                    .frame(height: 5)
                HStack{
                    HStack{
                        Text("Top Nearby")
                            .bold()
                            .font(.title2)
                            .foregroundStyle(.black.opacity(0.8))
                        Image(systemName: "slider.horizontal.3")
                            .foregroundStyle(.gray)
                            .font(.title2)
                            .bold()
                        Spacer()
                        
                    }
                    .padding(8)
                    .padding(.leading, 10)
                    HStack(){
                        Spacer()
                        Image(systemName: "location.fill")
                            .font(.headline)
                        
                            .foregroundStyle(.blue)
                        Text("Seattle, WA")
                            .foregroundStyle(.blue)
                        
                    }
                    .padding(.trailing, 25)
                }
                
                
                ForEach(Array(stride(from: 0, to: item_urls.count, by: 2)), id: \.self) { index in
                    HStack {
                        let width = 1/3 * deviceWidth + 10
                        let height = 1/5 * deviceHeight
                        var itemURL = selectedCategory == "For You" ?
                            item_urls[index] : shoeURLs[index]
                        ItemCard(item_url: itemURL,
                                 width: width,
                                 height: 1/5 * deviceHeight
                        )
                        .padding(.leading, 5)
                        
                        if (index + 1 < item_urls.count) {
                            var nextURL = selectedCategory == "For You" ?
                                item_urls[index + 1] : shoeURLs[index + 1]
                            ItemCard(item_url: nextURL,
                                     width: width,
                                     height: height
                            )
                            
                            .padding(.trailing, 5)
                            
                        }
                    }
                }
                
                Spacer()
                    .frame(height: 30)
            }
        }
    }
}

#Preview {
    ShopContentView()
}
