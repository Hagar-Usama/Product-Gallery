//
//  DeviceRotation.swift
//  Product Store
//
//  Created by Hagar Usama on 03/06/2023.
//

import Foundation
import SwiftUI

// https://tutorial101.blogspot.com/2021/09/swiftui-detect-device-rotation-portrait.html
// orientation
struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}
