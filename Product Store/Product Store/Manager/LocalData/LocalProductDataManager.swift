//
//  LocalDataManager.swift
//  Product Store
//
//  Created by Hagar Usama on 02/06/2023.
//

import CoreData

class LocalProductDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "Product_Store")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }
    
    
    func deleteAllProducts(){
        let products = getAllProductsLocal()
        
        for product in products {
            deleteProduct(product: product)
        }
    }

    private func deleteProduct(product: ProductDB) {
        persistentContainer.viewContext.delete(product)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error)")
        }
        
    }

    func getAllProducts() -> [Product] {
        
        let fetchRequest: NSFetchRequest<ProductDB> = ProductDB.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key:#keyPath(ProductDB.name), ascending: true)]
        
        do {
            let productsLocal : [ProductDB] =  try persistentContainer.viewContext.fetch(fetchRequest)
            var products = [Product]()
            for product in productsLocal {
                products.append(product.toProduct())
            }
            return products
            
        } catch {
            return []
        }
        
    }
    
    private func getAllProductsLocal() -> [ProductDB] {
        
        let fetchRequest: NSFetchRequest<ProductDB> = ProductDB.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
            
        } catch {
            return []
        }
        
    }
    
    
    private func saveProduct(product: Product) {
        
        let productDB = ProductDB(context: self.persistentContainer.viewContext)
        productDB.imageData = product.imageData
        productDB.id = product.id
        productDB.name = product.name
        productDB.price = product.price ?? 0
        productDB.productDescription = product.description ?? ""
        
        do {
            try self.persistentContainer.viewContext.save()
        } catch {
            print("Failed to save product \(error)")
        }
        
    }
    
    func saveBatchProducts(products: [Product]){
        deleteAllProducts()
        for product in products {
            saveProduct(product: product)
        }
    }
}

