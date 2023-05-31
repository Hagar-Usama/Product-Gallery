//
//  Product.swift
//  Product Store
//
//  Created by Hagar Usama on 01/06/2023.
//

import Foundation
struct Product: Decodable, Identifiable {
    var id: Int
    var title: String
    var imageName: String
    var price: String
    var description: String
    var image_url: String?
    
}
