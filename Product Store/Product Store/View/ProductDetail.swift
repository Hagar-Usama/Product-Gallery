//
//  ProductDetail.swift
//  Product Store
//
//  Created by Hagar Usama on 01/06/2023.
//

import SwiftUI

struct ProductDetail: View {
    var productImageUrl: String
    var productName : String
    
    var body: some View {
        VStack{
            Text(productName)
                .fontWeight(Font.Weight.heavy)
                .foregroundColor(ThemeColor.primary)
                .font(.system(size: 32))
                .textCase(.uppercase)
             Spacer()
            KingFisherImageView(url: productImageUrl)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
                .padding([.leading, .trailing], 24)
        }.padding([.top, .bottom, .leading, .trailing], 24)
        
    }
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetail(productImageUrl: "https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80", productName: "Stylish Cat")
    }
}
