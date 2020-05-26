//
//  CollectionViewController.swift
//  FRadioPlayer_ios
//
//  Created by Ken Taylor on 25/05/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SDWebImage

class CollectionViewController: UIViewController {
    let networkStuff = NetworkStuff()
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    let cellIdentifier = "CustomCollectionViewCell"
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkStuff.performRequest()
        setupCollectionView()
        // collectionView.reloadData()

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemZize()
       
    }
    

    
    
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemZize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemPerRow: CGFloat = 4
            let lineSpacing: CGFloat = 5
            let interItemSpacing: CGFloat = 5
            let width = (collectionView.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = .zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
            
        }
    }
    
    
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        NetworkStuff.urlArrayReturnCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CustomCollectionViewCell
        
        cell.imageView?.sd_setImage(with: NetworkStuff.urlArrayReturn[indexPath.row], placeholderImage: #imageLiteral(resourceName: "placeholderImage"), options: .highPriority, completed: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(NetworkStuff.urlArrayReturn[indexPath.row])
       let vc = storyboard?.instantiateViewController(identifier: "ImageViewerViewController") as? ImageViewerViewController
      
        PassData.url = NetworkStuff.urlArrayReturn[indexPath.row]
    
        PassData.photoCaption = NetworkStuff.urlArrayReturnTitle[indexPath.row]
        //vc.imageView.sd_setImage(with: NetworkStuff.urlArrayReturn[indexPath.row], completed: nil)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    

    
}
