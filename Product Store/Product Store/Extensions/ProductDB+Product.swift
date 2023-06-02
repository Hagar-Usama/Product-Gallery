//
//  ProductDB+toProduct.swift
//  Product Store
//
//  Created by Hagar Usama on 02/06/2023.
//

import Foundation
extension ProductDB{
    func toProduct() -> Product{
        return Product(id: self.id, name: self.name ?? "", description: self.productDescription ?? "" , price: self.price, imageURL: self.imageURL, imageData: self.imageData)
    }
}
