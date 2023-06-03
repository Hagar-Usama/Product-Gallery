//
//  ProductDetail.swift
//  Product Store
//
//  Created by Hagar Usama on 01/06/2023.
//

import SwiftUI

struct  ProductDetail: View {
     @State private var orientation = UIDeviceOrientation.unknown
    var product: Product
    
    
    var body: some View {
        ZStack{
        Group {
            GeometryReader{ geometry in
                let width = Int(geometry.size.width)
                let height = Int(geometry.size.height)
                    OrientationStack(width: width, height: height, orientation: orientation, product: product)
            }
            
        }.onRotate { newOrientation in
            orientation = newOrientation
        }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
         .padding([.leading, .trailing, .top, .bottom], 24)
    
    }
}


struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        let product = Product(id: 1, name: "Stylish Cat", description: "", price: 88.9, imageURL: "https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80", imageData: nil)
        ProductDetail(product: product)
    }
}
