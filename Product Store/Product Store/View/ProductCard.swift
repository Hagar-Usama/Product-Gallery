//
//  ProductCard.swift
//  Product Store
//
//  Created by Hagar Usama on 31/05/2023.
//


import SwiftUI

struct ProductCard: View {

    var product: Product
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Image(product.imageName)
                .resizable()
                .scaledToFill()
//                .frame(width:  UIScreen.main.bounds.width/2.25)
                .frame(minWidth: 0, maxWidth: .infinity)
                .clipped()
            
            // Stack bottom half of card
            VStack(alignment: .leading, spacing: 6) {
                HStack(alignment: .top, spacing: 4) {
                    Text(product.title)
                        .fontWeight(Font.Weight.heavy)
                        .foregroundColor(ThemeColor.primary)
                        .font(.system(size: 13))
                        .textCase(.uppercase)
                    Spacer()
                    // TODO: convert price to double in the right place
                    Text("$" + product.price)
                        .fontWeight(Font.Weight.heavy)
                        .foregroundColor(ThemeColor.secondary1)
                        .font(.system(size: 12))
                        .frame(width: 50)
                        .textCase(.uppercase)
                    
                    
//Text(String.init(format: "$%.2f", arguments: [Double(product.price)]))

                }
                
                Text(product.description)
                    .font(Font.custom("HelveticaNeue-Bold", size: 12))
                    .foregroundColor(Color.gray)
                    .lineLimit(2)
            }
            .padding(8)
            
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
//        .frame(width:  UIScreen.main.bounds.width/2.25)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 180)
        .onTapGesture {
            // TODO: Implement me
            print("Card Tapped")
        }
    } //body
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(id: 1, title: "Perfect Headphone for everyday  used", imageName: "headphone", price: "15.00", description: "Perfect Headphone for everyday  used")
        ProductCard(product: product)
    }
}
