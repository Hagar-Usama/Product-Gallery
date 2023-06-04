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
    private let dataFM = DataFlowManager(localDM: LocalProductDataManager())
    
    
    func getProducts(completion: @escaping ([Product]) -> ()) {
        remoteDM.getAllProducts { [weak self] products in
            if !products.isEmpty {
                completion(products)
                if let productLocal = self?.localDM.getAllProducts(), productLocal.isEmpty{
                    self?.dataFM.saveToLocalDB(products: products)
                }
            }
            else{
                completion(self?.localDM.getAllProducts() ?? [])
            }
        }
    }
    
    func clearDataBase(){
        localDM.deleteAllProducts()
    }
    
}
