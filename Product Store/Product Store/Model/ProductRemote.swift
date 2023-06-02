//
//  Product.swift
//  Product Store
//
//  Created by Hagar Usama on 01/06/2023.
//
//


struct ProductRemote: Codable, Identifiable {
    let id, name, description, price: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name, description, price
        case imageURL = "image_url"
    }
}

extension ProductRemote{
    func toProduct() -> Product{
        return Product(id: Int32(self.id) ?? 0, name: self.name, description: self.description, price: Double(self.price) ?? 0, imageURL: self.imageURL, imageData: nil)
    }
}
