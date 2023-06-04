//
//  CircleImage.swift
//  Product Store
//
//  Created by Hagar Usama on 04/06/2023.
//

import SwiftUI

struct CircleImage: View {
    var product: Product
    var body: some View {
        ZStack{
            // placeholder image
            Image("image_placeholder")
            if let data = product.imageData{
                // data image if valid
                Image(data: data)?
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
                    .padding([.leading, .trailing], 24)
            }else{
                if let url = product.imageURL {
                    KingFisherImageView(url: url)
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                        }
                        .shadow(radius: 7)
                        .padding([.leading, .trailing], 24)
                }
            }
        }
    }
    
}

//struct CircleImage_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleImage()
//    }
//}
