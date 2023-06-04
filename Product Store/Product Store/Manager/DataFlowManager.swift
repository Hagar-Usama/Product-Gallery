//
//  DataFlowManager.swift
//  Product Store
//
//  Created by Hagar Usama on 04/06/2023.
//

import Foundation
class DataFlowManager{
    
    var localDM: LocalProductDataManager
    
    init(localDM: LocalProductDataManager){
        self.localDM = localDM
    }
    
    func addImagesToProducts(products: [Product], completion: @escaping ([Product]) -> ()){
        for product in products {
            getImageData(from: URL(string: product.imageURL ?? "")!) { imageData, _, _ in
                product.imageData = imageData
                print("Image Downloaded")
            }
        }
        completion(products)
    }

    func saveToLocalDB(products: [Product]){
        addImagesToProducts(products: products) { [weak self] productsWithImages in
            self?.localDM.saveBatchProducts(products: productsWithImages)
        }
    }
    
    func getImageData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
         URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
     }
    
    
}
