//
//  ProductListModelView.swift
//  Product Store
//
//  Created by Hagar Usama on 01/06/2023.
//

import Foundation
class ProductListViewModel: ObservableObject {
    @Published var dataManager: ProductDataManager = ProductDataManager()
    @Published var products: [Product] = []

    init(){
        self.loadData { _ in
            // intentionally left blank
        }
    }
    
    func loadData(completion: @escaping ([Product]) -> ()){
        
        dataManager.getProducts { products in
            self.products = products
        }
    }
    
    func clearDataBase(){
        dataManager.clearDataBase()
    }
}
