//
//  ViewController.swift
//  CollectionView
//
//  Created by 10.12 on 2018/11/28.
//  Copyright © 2018 Rui. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController{

    var items : NSArray = [UIImage(named:"image1.jpg")!,UIImage(named:"image2.jpg")!,UIImage(named:"image3.jpg")!,UIImage(named:"image4.jpg")!,UIImage(named:"image5.jpg")!,UIImage(named:"image6.jpg")!,UIImage(named:"image7.jpg")!,UIImage(named:"image8.jpg")!,UIImage(named:"image9.jpg")!]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(items)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count * 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier: String = "CollectionCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as!CollectionViewControllerCell
    
        cell.imageView?.image = items.object(at: (indexPath as NSIndexPath).row%9) as? UIImage
        
        return cell
    }
    
}



