//
//  CardImage.swift
//  Product Store
//
//  Created by Hagar Usama on 04/06/2023.
//

import SwiftUI

struct CardImage: View {
    var product: Product
    var body: some View {
        ZStack{
            // placeholder image
            Image("image_placeholder")
        if let data = product.imageData{
                // data image if valid
                Image(data: data)?
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 200)
                    .clipped()
        }else{
            if let url = product.imageURL {
                KingFisherImageView(url: url)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 200)
                    .clipped()
            }
        }
        }.frame(minWidth: 0, maxWidth: .infinity, maxHeight: 200)

    }
}

struct CardImage_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            let product1 = Product(id: 1, name: "", description: "", price: 1, imageURL: "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0fGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60", imageData: nil)
            CardImage(product: product1)
            let product2 = Product(id: 1, name: "", description: "", price: 1, imageURL:nil, imageData: UIImage(named: "not_found")?.pngData())
            CardImage(product: product2)
            
        }
        
    }
}
