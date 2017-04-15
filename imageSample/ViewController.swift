//
//  ViewController.swift
//  imageSample
//
//  Created by IBM on 4/15/17.
//  Copyright © 2017 IBM. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var lastPosition: CGFloat = 0
    
    let urlCollection = ["https://images.pexels.com/photos/36740/vegetables-vegetable-basket-harvest-garden.jpg?h=350&auto=compress&cs=tinysrgb","https://images.pexels.com/photos/196643/pexels-photo-196643.jpeg?h=350&auto=compress&cs=tinysrgb","https://images.pexels.com/photos/36156/pexels-photo.jpg?h=350&auto=compress&cs=tinysrgb","https://images.pexels.com/photos/89267/pexels-photo-89267.jpeg?h=350&auto=compress&cs=tinysrgb","https://images.pexels.com/photos/33307/carrot-kale-walnuts-tomatoes.jpg?h=350&auto=compress&cs=tinysrgb","https://images.pexels.com/photos/41123/pexels-photo-41123.jpeg?h=350&auto=compress&cs=tinysrgb"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        let nib = UINib(nibName: "topicCollectionViewCell", bundle: Bundle.main)
        collectionView.register(nib, forCellWithReuseIdentifier:"topicCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urlCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topicCollectionViewCell", for: indexPath as IndexPath) as! topicCollectionViewCell
        cell.updateDataSource(urlCollection[indexPath.item])
        return cell
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for cell in collectionView.visibleCells {
            if let cellView = cell as? topicCollectionViewCell {
                cellView.cellOnCollectionView(collectionView, scrollView: view)
            }
        }
    }
}



