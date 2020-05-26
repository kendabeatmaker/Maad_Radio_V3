//
//  imageViewerViewController.swift
//  FRadioPlayer_ios
//
//  Created by Ken Taylor on 25/05/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SDWebImage



class ImageViewerViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
   
        
        imageView.sd_setImage(with: PassData.url!, placeholderImage: #imageLiteral(resourceName: "placeholderImage"), options: .highPriority, completed: nil)
        label.text = PassData.photoCaption
        print(PassData.photoCaption)

      
    }
    
    

   
}
