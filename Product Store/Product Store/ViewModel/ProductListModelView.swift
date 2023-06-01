//
//  ProductListModelView.swift
//  Product Store
//
//  Created by Hagar Usama on 01/06/2023.
//

import Foundation
class ProductListViewModel: ObservableObject {
    
    @Published var products: [Product] = []

    init(){
        self.loadData { _ in
            
        }
    }
    
    func loadData(completion: @escaping ([Product]?) -> ()){
        DataService.shared.requestFetchProducts { products, error in
            if let products = products{
                self.products = products
                completion(products)
            }else{
                completion(nil)
            }
            
        }
    }
}
