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

//struct CardImage_Previews: PreviewProvider {
//    static var previews: some View {
//        CardImage()
//    }
//}
