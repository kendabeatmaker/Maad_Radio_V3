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
let networkStuff = NetworkStuff()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        networkStuff.performRequest()
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CustomTableViewCell")

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorColor = .clear
        //tableView.separatorInset = UIEdgeInsets(top: 40, left: 5, bottom: 5, right: 5)
        
    }
 

}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NetworkStuff.urlArrayReturnCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
       
       // cell.imageView?.sd_setImage(with: NetworkStuff.urlArrayReturn[indexPath.row], completed: nil)
        
            //cell.myImageView?.sd_setImage(with: NetworkStuff.urlArrayReturn[indexPath.row], completed: nil)
        cell.myImageView?.sd_setImage(with: NetworkStuff.urlArrayReturn[indexPath.row], placeholderImage: #imageLiteral(resourceName: "placeholderImage"), options: .highPriority, completed: nil)
        cell.myLabel?.text = NetworkStuff.urlArrayReturnTitle[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped row")
    }
    
    
    
    
}
