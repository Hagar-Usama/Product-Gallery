//
//  RemoteProductDataManager.swift
//  Product Store
//
//  Created by Hagar Usama on 02/06/2023.
//

import Foundation
import Alamofire

class RemoteProductDataManager{
    private var productsUrl = "http://www.nweave.com/wp-content/uploads/2012/09/featured.txt"

    func getAllProducts(completion: @escaping ([Product]) -> ()) {
        AF.request(productsUrl)
            .validate()
            .responseDecodable(of: [ProductContainer].self) { response in
                guard let products = response.value else {
                    completion([Product]())
                    return}
                
                var productsList : [Product] = []
                for product in products{
                    productsList.append(product.product.toProduct())
                }
                
                completion(productsList.sorted {$0.name < $1.name})
            }
    }
}

