//
//  ProductDataManager.swift
//  Product Store
//
//  Created by Hagar Usama on 02/06/2023.
//

import Foundation
class ProductDataManager{
    
    private let remoteDM = RemoteProductDataManager()
    private let localDM = LocalProductDataManager()
    
    func getProducts(completion: @escaping ([Product]) -> ()) {
        completion(localDM.getAllProducts())
        remoteDM.getAllProducts { [weak self] products in
            if !products.isEmpty {
                completion(products)
//                self?.localDM.saveBatchProducts(products: products)
                if let productLocal = self?.localDM.getAllProducts(), productLocal.isEmpty{
                    self?.localDM.saveBatchProducts(products: products)
                }
            }else{
                completion(self?.localDM.getAllProducts() ?? [])
            }
        }
    }
    
    func checkOfflineProducts(){
        let products = localDM.getAllProducts()
        
        for product in products {
            print("[log]: Product: \(String(describing: product.name))")
        }
    }
    
    
    func clearDataBase(){
        localDM.deleteAllProducts()
    }
    
}
