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

//struct OrientationStack_Previews: PreviewProvider {
//    static var previews: some View {
//        OrientationStack()
//    }
//}
