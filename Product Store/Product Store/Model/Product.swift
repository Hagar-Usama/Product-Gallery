//
//  Product.swift
//  Product Store
//
//  Created by Hagar Usama on 02/06/2023.
//

import Foundation


// What is parsed in view
class Product : Identifiable{
    var id: Int32
    var name: String
    var description: String
    var price: Double
    var imageURL: String?
    var imageData: Data?
    
    
    init(id: Int32, name: String, description: String, price: Double, imageURL: String?, imageData: Data? ) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.imageURL = imageURL
        self.imageData = imageData
    }
}
