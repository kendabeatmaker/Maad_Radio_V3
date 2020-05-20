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

struct PhotoArray: Decodable {
    let farm : Int
    let id : String
    
    let isfamily : Int
    let isfriend : Int
    let ispublic : Int
    
    let owner: String
    let secret : String
    let server : String
    let title: String

    var imageURL: String {
        let urlString = String(format: FlickrConstants.imageURL, farm, server, id, secret)
        
        
        return urlString
    }

    
}
