//
//  HotSectionCollectionCell.swift
//  MedicalHelper
//
//  Created by J on 16/8/15.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class HotSectionCollectionCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    var model: HotSectionCollectionCellModel?{
        didSet{
            titleLabel.text = model?.title
            photoImageView.image = UIImage(named: (model?.photoName)!)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
