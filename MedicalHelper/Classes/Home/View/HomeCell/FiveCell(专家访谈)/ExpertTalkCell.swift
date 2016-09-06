//
//  ExpertTalkCell.swift
//  MedicalHelper
//
//  Created by J on 16/8/15.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class ExpertTalkCell: UITableViewCell {

    @IBOutlet weak var firstLineImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var secondLineImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var thirdLineImageViewHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        firstLineImageViewHeight.constant = 0.5
        secondLineImageViewHeight.constant = 0.5
        thirdLineImageViewHeight.constant = 0.5
        
    }
}
