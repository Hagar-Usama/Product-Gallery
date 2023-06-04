//
//  ProductRemote+Product.swift
//  Product Store
//
//  Created by Hagar Usama on 02/06/2023.
//

import Foundation

extension ProductRemote{
    func toProduct() -> Product{
        return Product(id: Int32(self.id) ?? 0, name: self.name, description: self.description, price: Double(self.price) ?? 0, imageURL: self.imageURL, imageData: nil)
    }
}
