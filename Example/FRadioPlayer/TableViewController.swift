//
//  ViewController.swift
//  pics demo2
//
//  Created by Ken Taylor on 24/05/2020.
//  Copyright © 2020 Ken Taylor. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let netWorkStuff = NetworkStuff()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //netWorkStuff.performRequest()
        // Do any additional setup after loading the view.
        print(NetworkStuff.urlArrayReturn)
               
               print(NetworkStuff.urlArrayReturnCount)
       
       
       
        
    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//    }
    @IBAction func btn(_ sender: UIButton) {
        
         print(NetworkStuff.urlArrayReturn)
        
        print(NetworkStuff.urlArrayReturnCount)
    }
}

