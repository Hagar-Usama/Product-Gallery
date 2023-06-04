//
//  ProductList.swift
//  Product Store
//
//  Created by Hagar Usama on 01/06/2023.
//

import SwiftUI

struct ProductList: View {
    
    @StateObject private var viewModel = ProductListViewModel()
    
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: gridItemLayout, spacing: 0) {
                ForEach(viewModel.products) { product in
                    NavigationLink {
                        ProductDetail(product: product)
                    } label: {
                        ProductCard(product: product)
                            .padding([.leading, .trailing], 2)
                            .padding([.top, .bottom], 6)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 180)
                    }
                    
                }
            }.padding([.leading, .trailing], 8)
        }
        .navigationTitle("Products")
        .foregroundColor(ThemeColor.primary)
        .background(ThemeColor.background)

    }

}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList()
    }
}
