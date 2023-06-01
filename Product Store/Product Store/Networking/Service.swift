//
//  Service.swift
//  Product Store
//
//  Created by Hagar Usama on 01/06/2023.
//

import Foundation
import Alamofire

struct DataService {
    
    static let shared = DataService()
    private var ProductsUrl = "http://www.nweave.com/wp-content/uploads/2012/09/featured.txt"
    
    // MARK: - Services
    func requestFetchProducts(completion: @escaping ([Product]?, Error?) -> ()) {
        AF.request(ProductsUrl)
            .validate()
            .responseDecodable(of: [ProductContainer].self) { response in
                guard let products = response.value else {
                    // TODO: handle errors
                    completion(nil, response.error)
                    return}
                print(products[0].product.description)
                
                var productsList : [Product] = []
                
                for product in products{
                    productsList.append(product.product)
                }
                
                completion(productsList, nil)
            }
    }
    
}
