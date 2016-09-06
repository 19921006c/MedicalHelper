//
//  HotSectionExpertCollectionCell.swift
//  MedicalHelper
//
//  Created by J on 16/8/12.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit
import SDWebImage
class HotSectionExpertCollectionCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var departLabel: UILabel!
    var model: HotSectionExpertCollectionCellModel?{
        didSet{
            nameLabel.text = model?.name
            departLabel.text = model?.depart
            photoImageView.sd_setImageWithURL(model?.photoURL, placeholderImage: UIImage(named: "DoctorDetail01"))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.layer.cornerRadius = photoImageView.bounds.height * 0.5
        photoImageView.clipsToBounds = true
        photoImageView.layer.borderWidth = 1
        photoImageView.layer.borderColor = UIColor.colorWithHexString("#d6d6d6").CGColor
    }

}
