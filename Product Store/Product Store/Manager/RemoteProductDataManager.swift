//
//  RemoteProductDataManager.swift
//  Product Store
//
//  Created by Hagar Usama on 02/06/2023.
//

import Foundation
import Alamofire

class RemoteProductDataManager{
    private var ProductsUrl = "http://www.nweave.com/wp-content/uploads/2012/09/featured.txt"

    // MARK: - Services
//    func getProducts(completion: @escaping ([Product]?, Error?) -> ())
    func getProducts(completion: @escaping ([Product]) -> ()) {
        AF.request(ProductsUrl)
            .validate()
            .responseDecodable(of: [ProductContainer].self) { response in
                guard let products = response.value else {
                    // TODO: handle errors
                    completion([Product]())
                    return}
                
                var productsList : [Product] = []
                for product in products{
                    productsList.append(product.product.toProduct())
                }
                
                completion(productsList)
            }
    }
}

