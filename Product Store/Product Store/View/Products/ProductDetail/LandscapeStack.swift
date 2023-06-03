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
                KingFisherImageView(url: product.imageURL ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
                    .padding([.leading, .trailing], 24)
                
                Spacer()
                Spacer()
                Text(product.name ?? "")
                    .fontWeight(Font.Weight.heavy)
                    .foregroundColor(ThemeColor.primary)
                    .font(.system(size: 32))
                    .textCase(.uppercase)
                
                
            }.padding([.top, .bottom, .leading, .trailing], 24)
            Spacer()
        }
        
    }
}

//struct LandscapeStack_Previews: PreviewProvider {
//    static var previews: some View {
//        LandscapeStack()
//    }
//}
