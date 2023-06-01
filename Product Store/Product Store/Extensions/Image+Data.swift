//
//  Image+Data.swift
//  Product Store
//
//  Created by Hagar Usama on 01/06/2023.
//

import Foundation
import SwiftUI

extension Image {
    init?(data: Data){
        guard let image = UIImage(data: data) else { return nil}
        self.init(uiImage: image)
    }
}
