//
//  ProductContainer.swift
//  Product Store
//
//  Created by Hagar Usama on 01/06/2023.
//

import Foundation
struct ProductContainer: Codable {
    let product: ProductRemote

    enum CodingKeys: String, CodingKey {
        case product = "Product"
    }
}

