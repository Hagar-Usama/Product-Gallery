//
//  KingFisherImageView.swift
//  Product Store
//
//  Created by Hagar Usama on 01/06/2023.
//

import SwiftUI

import struct Kingfisher.KFImage
import Kingfisher
struct InternetAvailability{
    static let isOnline = false
}

@ViewBuilder
func KingFisherImageView(url:String)-> KFImage{
   
    KFImage(
        URL(string: url)
        ,
        options: [
            KingfisherOptionsInfoItem
            .forceRefresh
        ]
    ).onSuccess { result in
        print("sucess")
    }.onFailure { error in
        print("image failed to load \(error)")
    }
    .placeholder{
        InternetAvailability.isOnline ?
        Image("not_found").frame(width: 50, height: 50) : Image("image_placeholder").frame(width: 50, height: 50)
    }
}
