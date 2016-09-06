//
//  DoctorDetailSubModel.swift
//  MedicalHelper
//
//  Created by J on 16/9/6.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class DoctorDetailSubModel: NSObject {
    var imageName: String?
    var title: String?
    var content: String?
    {
        didSet{
            let size = CGSizeMake(kScreenWidth - 28, 2000)
            
            cellHeight = sizeWithString(content!, font: UIFont.systemFontOfSize(14), size: size).height + 39 + 14 * 3
            
        }
    }
    var cellHeight: CGFloat?
    
    private func sizeWithString(string: String, font: UIFont, size: CGSize) -> CGSize{
        let str = NSString(string: string)
        
        let rect  = str.boundingRectWithSize(size, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return rect.size
    }
}
