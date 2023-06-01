//
//  KingFisherImageView.swift
//  Product Store
//
//  Created by Hagar Usama on 01/06/2023.
//

import SwiftUI

// TODO: move to Utility or helper
import struct Kingfisher.KFImage
struct InternetAvailability{
    static let isOnline = false
}

@ViewBuilder
func KingFisherImageView(url:String)-> KFImage{
   
    KFImage(
        URL(string: url),
        options: [
            .transition(.fade(0.35))
        ]
    ).onSuccess { result in
        print("sucess")
    }.onFailure { error in
        print("image failed to load \(error)")
    }
    .placeholder{
        InternetAvailability.isOnline ?
        Image("not_found").frame(width: 50, height: 50) : Image("thumbnail").frame(width: 50, height: 50)
    }
}


