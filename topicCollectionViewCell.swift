//
//  topicCollectionViewCell.swift
//  scrollCollectionView
//
//  Created by IBM on 4/9/17.
//  Copyright © 2017 IBM. All rights reserved.
//

import UIKit

class topicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bacggroundImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var username: UILabel!
    
    var index:Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateDataSource(_ url: String) {
         //bacggroundImage.image = UIImage(named: "topic\(index + 1)")
        bacggroundImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "default"))
    }
    
    func cellOnCollectionView(_ collectionView: UICollectionView, scrollView: UIView) {
        
        let rect = collectionView.convert(self.frame, to: scrollView)
        //所看到的每个CellY值(实时获取滚动的值)
        //以屏幕中心点为0点 获取能看到的每个Cell离中心点得值是多少
        
        let distanceCenter = scrollView.frame.height/2 - rect.minY
        
        // 获取图片超出cell高度部分，图片肯定要比cell大，否则不会有视觉差效果
        let difference = bacggroundImage.frame.height - frame.height
        
        let imageMove = (distanceCenter / scrollView.frame.height) * difference
        
        //旧的图片Frame
        var imageRect = bacggroundImage.frame
        
        //移动
        imageRect.origin.y = imageMove - difference/2
        
        //新的图片Frame
        bacggroundImage.frame = imageRect
    }

}
