//
//  OrientationStack.swift
//  Product Store
//
//  Created by Hagar Usama on 03/06/2023.
//

import SwiftUI

struct OrientationStack: View {
    var width: Int
    var height: Int
    var orientation : UIDeviceOrientation
    var product: Product
    
    var body: some View {
        
        switch orientation {
        case .portrait, .portraitUpsideDown:
            PortraitStack(product: product)
        case .landscapeLeft, .landscapeRight:
            LandscapeStack(product: product)
        default:
            if width > height {
                LandscapeStack(product: product)
            }else{
                PortraitStack(product: product)
            }
        }
    }
}

struct OrientationStack_Previews: PreviewProvider {
    static var previews: some View {
        let product1 = Product(id: 1, name: "Some Title", description: "Some Description", price: 1, imageURL: "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0fGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60", imageData: nil)
        OrientationStack(width: 200, height: 1000, orientation: UIDeviceOrientation.unknown, product: product1)
        
    }

}
