//
//  TableViewController.swift
//  FRadioPlayer_ios
//
//  Created by Ken Taylor on 25/05/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SDWebImage
class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
 

}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NetworkStuff.urlArrayReturnCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        
       
        //cell.imageView?.sd_setImage(with: NetworkStuff.urlArrayReturn[indexPath.row], completed: nil)
        
        cell.imageView?.sd_setImage(with: NetworkStuff.urlArrayReturn[indexPath.row], placeholderImage: #imageLiteral(resourceName: "placeholderImage"), options: .highPriority, completed: nil)
        cell.textLabel?.text = NetworkStuff.urlArrayReturnTitle[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped row")
    }
    
    
    
}
