//
//  PortraitStack.swift
//  Product Store
//
//  Created by Hagar Usama on 03/06/2023.
//

import SwiftUI

struct PortraitStack: View {
    var product: Product
    var body: some View {
        HStack{
            Spacer()
            VStack{
                Text(product.name ?? "")
                    .fontWeight(Font.Weight.heavy)
                    .foregroundColor(ThemeColor.primary)
                    .font(.system(size: 32))
                    .textCase(.uppercase)
                Spacer(minLength: 32)
                CircleImage(product: product)
            }.padding([.top, .bottom, .leading, .trailing], 24)
            Spacer()
        }
        
    }
    
}

//struct PortraitStack_Previews: PreviewProvider {
//    static var previews: some View {
//        PortraitStack()
//    }
//}
