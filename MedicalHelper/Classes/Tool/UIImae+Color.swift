//
//  UIImae+Color.swift
//  MedicalHelper
//
//  Created by J on 16/9/1.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

extension UIImage{
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRectMake(0, 0, 1, 1)
        
        UIGraphicsBeginImageContext(rect.size)
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        
        CGContextFillRect(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
