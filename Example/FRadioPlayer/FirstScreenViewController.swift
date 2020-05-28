//
//  SecondViewController.swift
//  FRadioPlayer_ios
//
//  Created by Ken Taylor on 16/05/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import MediaPlayer
import FRadioPlayer
import SDWebImage

class FirstScreenViewController: UIViewController {
    
    var networkStuff = NetworkStuff()
    var photoArrayLink = PhotoArray.self

    @IBOutlet weak var gotoPlayerHidddenOutlet: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let player: FRadioPlayer = FRadioPlayer.shared
        
        player.radioURL = URL(string: "https://streaming.broadcastradio.com:8872/maad975fm")
        
        
        networkStuff.performRequest()
           
    }
    
    @IBAction func goToPlayerHiddenButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToPlayer", sender: self)
        
    }
    @IBAction func smallPlay(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToPlayer", sender: self)
        
    }
    
    @IBAction func whatsappButton(_ sender: UIButton) {
        
        guard let url = URL(string: "https://wa.me/5926223975") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    @IBAction func facebookButton(_ sender: UIButton) {
        
        guard let url = URL(string: "https://www.facebook.com/pg/maad975/posts/") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func igButton(_ sender: UIButton) {
        guard let url = URL(string: "https://www.instagram.com/maad975fm/") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    @IBAction func twitterButton(_ sender: UIButton) {
        guard let url = URL(string: "https://twitter.com/maad975fm") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    @IBAction func youtubeButton(_ sender: UIButton) {
        guard let url = URL(string: "https://www.youtube.com/c/MAAD97FMRadio") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func gallery(_ sender: UIButton) {
        networkStuff.performRequest()
        
        print("clickedddd")
    }
}
