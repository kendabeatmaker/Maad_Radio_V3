//
//  FlickrData.swift
//  FRadioPlayer_ios
//
//  Created by Ken Taylor on 19/05/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

struct FlickrData: Decodable {
    let photos: Photos
    let stat: String

    }

struct Photos: Decodable {
    
    
    let page: Int
    let pages: Int
    let perpage: Int
    let photo: [PhotoArray]
    let total: String
}


