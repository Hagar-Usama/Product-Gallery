//
//  ProductDataManager.swift
//  Product Store
//
//  Created by Hagar Usama on 02/06/2023.
//

import Foundation
class ProductDataManager{
    
    private let remoteDM = RemoteProductDataManager()
//    private let localDM = CoreDataManager()
    
    
//    func getProductNames(isOnline: Bool) -> [String] {
////        return isOnline ? remoteDM.getProductNames() : localDM.getProductNames()
//    }
    
    func getProducts(completion: @escaping ([Product]) -> ()) {
        remoteDM.getProducts(completion: completion)
    }
    
}
