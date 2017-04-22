//
//  regularCollectionViewCell.swift
//  imageSample
//
//  Created by IBM on 4/22/17.
//  Copyright © 2017 IBM. All rights reserved.
//

import UIKit

class regularCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var imageItem: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //imageItem.contentMode = .topLeft
        // Initialization code
    }
    
    func updateDataSource(_ url: String) {
        //bacggroundImage.image = UIImage(named: "topic\(index + 1)")
        imageItem.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "default"))
    }

}
