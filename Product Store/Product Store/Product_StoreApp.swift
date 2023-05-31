//
//  Product_StoreApp.swift
//  Product Store
//
//  Created by Hagar Usama on 31/05/2023.
//

import SwiftUI

@main
struct Product_StoreApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
