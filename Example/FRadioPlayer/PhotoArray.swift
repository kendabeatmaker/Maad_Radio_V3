//
//  PhotoArray.swift
//  FRadioPlayer_ios
//
//  Created by Ken Taylor on 20/05/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation


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

