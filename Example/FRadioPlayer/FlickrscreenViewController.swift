//
//  FlickrscreenViewController.swift
//  FRadioPlayer_ios
//
//  Created by Ken Taylor on 19/05/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class FlickrscreenViewController: UIViewController {
    var networkStuff = NetworkStuff()
    
    
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkStuff.performRequest()
        
        
        
        //textView1.text = "Hellooooooo"
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
