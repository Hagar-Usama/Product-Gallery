//
//  LandscapeStack.swift
//  Product Store
//
//  Created by Hagar Usama on 03/06/2023.
//

import SwiftUI

    
struct LandscapeStack: View {
    var product: Product
    var body: some View {
        VStack{
            Spacer()
            HStack(alignment: .center){
                CircleImage(product: product)
                Spacer()
                Spacer()
                Text(product.name)
                    .fontWeight(Font.Weight.heavy)
                    .foregroundColor(ThemeColor.primary)
                    .font(.system(size: 32))
                    .textCase(.uppercase)
                
                
            }.padding([.top, .bottom, .leading, .trailing], 24)
            Spacer()
        }
        
    }
}

struct LandscapeStack_Previews: PreviewProvider {
    static var previews: some View {
        let product1 = Product(id: 1, name: "Some Title", description: "Some Description", price: 1, imageURL: "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0fGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60", imageData: nil)
        LandscapeStack(product: product1)
        
    }
  
}
