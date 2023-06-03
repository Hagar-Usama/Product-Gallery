//
//  View+Rotatate.swift
//  Product Store
//
//  Created by Hagar Usama on 03/06/2023.
//

import Foundation
import SwiftUI

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
