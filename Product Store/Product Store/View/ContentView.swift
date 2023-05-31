//
//  ContentView.swift
//  Product Store
//
//  Created by Hagar Usama on 31/05/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    var products : [ Product] = [
        Product(id: 1, title: "Perfect Headphone for everyday  used", imageName: "headphone", price: "15.00", description: "Perfect Headphone for everyday  used") ,
        Product(id: 2, title: "Perfect Headphone for everyday  used", imageName: "headphone", price: "15.00", description: "Perfect Headphone for everyday  used"),
        Product(id: 3, title: "Perfect Headphone for everyday  used", imageName: "headphone", price: "15.00", description: "Perfect Headphone for everyday  used"),
        Product(id: 4, title: "Perfect Headphone for everyday  used", imageName: "headphone", price: "15.00", description: "Perfect Headphone for everyday  use very comfortable"),
        Product(id: 5, title: "Perfect Headphone for everyday  used", imageName: "headphone", price: "15.00", description: "Perfect Headphone for everyday  used"),
        Product(id: 6, title: "Perfect Headphone for everyday  used", imageName: "headphone", price: "15.00", description: "Perfect Headphone for everyday  used"),
        Product(id: 7, title: "Perfect Headphone for everyday  used", imageName: "headphone", price: "15.00", description: "Perfect Headphone for everyday  used")
    ]
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridItemLayout, spacing: 6) {
                ForEach(products) { product in
                    ProductCard(product: product)
                        .padding([.leading, .trailing, .top, .bottom], 16)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 180)
                }
            }
        }

    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
