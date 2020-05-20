//
//  NetworkStuff.swift
//  FRadioPlayer_ios
//
//  Created by Ken Taylor on 19/05/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

let flickrVC = FlickrscreenViewController()


struct NetworkStuff {

    let flickrURL = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=d22e5c3e492984638d76072b6d5b1c2c&user_id=188522128%40N06&safe_search=1&per_page=100&format=json&nojsoncallback=1"
    
    
    
    func performRequest() {
        
        guard let url = URL(string: flickrURL) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
        
        task.resume()
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        
        if error != nil {
            print(error!)
   
            return
        }
        
        
         if let safeData = data {
            
            parseJson(flickrData: safeData)
           
        }
        
    } // end of handle should still be running before resume func
   
    func parseJson(flickrData: Data) {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(FlickrData.self, from: flickrData)
            
            print(decodedData.photos.photo[1].imageURL)
            print(decodedData.photos.photo[1].title)
            
        } catch {
            
            print(error)
            
        }
    }
    
}


