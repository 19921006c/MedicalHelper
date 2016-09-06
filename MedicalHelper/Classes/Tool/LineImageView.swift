//
//  LineImageView.swift
//  MedicalHelper
//
//  Created by J on 16/9/6.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class LineImageView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.colorWithHexString("#d6d6d6")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        frame.size.height = 0.5
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
