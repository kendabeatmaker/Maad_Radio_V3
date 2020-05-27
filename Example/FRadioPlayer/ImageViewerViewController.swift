//
//  imageViewerViewController.swift
//  FRadioPlayer_ios
//
//  Created by Ken Taylor on 25/05/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SDWebImage



class ImageViewerViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollV: UIScrollView!
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imageView.sd_setImage(with: PassData.url!, placeholderImage: #imageLiteral(resourceName: "placeholderImage"), options: .highPriority, completed: nil)
        label.text = PassData.photoCaption
        print(PassData.photoCaption)
       
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}






