//
//  ShopContentVIew.swift
//  NpaMockApp
//
//  Created by Samuel Wang on 5/30/24.
//

import SwiftUI

struct SupplementsScrollView: View {
    var item_urls = [
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQUIN_B7ff4rpouvODzyzDxzgsyLZO1l6t7hd3-0GrZICL_8NxLC5Pwt-C28OVAOjx1E-HYdWitUgv-zyEmOTdQjKBaCnlib_NLj2-QTIba&usqp=CAE",

        "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSYplVL98sZ9jhEr0iQJtKkONoB70bQGxop1DItZfBlJG7joZOoNm0B6o_8yXhCXyYmz8LB4eH9UwiEBnQF50_50c2Y50mw7vbfYfvNMTEa79uhzMly9T0C&usqp=CAE",

        "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRfrkBsRMFkeClTBtyzn04SFjs6JRleXm_OMdcflZ0aEhau1s1WeZTgCoB6SEFYq5C8nsMzjLhdQ2qfyH2nP0JoNSPztQH7JHEVO7jNYHJdEQTlapEKw06vPg&usqp=CAE",


        "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQTXyY-NBjxc2M_iFKe_mWWc74NWesXMqbVrH54y2_z8CxrUwcEFd8tTVwCFkv452y5sENTH1hbAS4TNt_NI7qREFJLrzSBYHClbUqRtHo4z7-mpaf-cSh7Aw&usqp=CAE",

        "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTTdbgrLXKOah3_TA7uxJ7GNaUPi_PNpcj0iyPlA62xqs4bHl9n2_HiuLIFFwP5cGOjdy5fcXZIi8RNLRjyf2exq6S4X3kRk9_o6FM7FkcVuInzz1e-sC3J&usqp=CAE"

    ]
    var itemNames = [
        "L-arganine",
        "AG-1",
        "EPO-Boost",
        "Peak O2",
        "BCAA Powder"
    ]
    @State var searchText = ""
    
    var body: some View {
//        HStack {
//            Image(systemName: "magnifyingglass")
//                .foregroundColor(.black)
//            TextField("Shop the latest", text: $searchText)
//                .foregroundColor(.black)
//                .textContentType(.newPassword)
//                .keyboardType(.asciiCapable)
//                .autocorrectionDisabled()
//                .listRowSeparator(.hidden)
//        }.modifier(customViewModifier(roundedCornes: 30, startColor: Color(UIColor.systemGray5), endColor: Color(UIColor.systemGray5), textColor: .black, ratio: 0.95))
        Spacer()
            .frame(height: 35)
        ShopTypes()
            .frame(height: 10)
        Spacer()
            .frame(height: 30)
        Divider()
        Spacer()
            .frame(height: 10)
        EventFilterScrollView()
        
        ScrollView(.vertical){
            ForEach(Array(stride(from: 0, to: item_urls.count, by: 2)), id: \.self) { index in
                HStack {
                    ItemCard(item_url: item_urls[index], 
                             itemName: itemNames[index], width: 90, height: 100)
                        .padding(.leading, 15)

                    if index + 1 < item_urls.count {

                        ItemCard(item_url: item_urls[index],
                                 itemName: itemNames[index], width: 80, height: 100)
                            .padding(.leading, 10)
                    }
                    Spacer()
                }
                .padding(.bottom, -10)
            }
            .padding(.leading, 10)
        }
    }
}

#Preview {
    ShopContentView()
}
