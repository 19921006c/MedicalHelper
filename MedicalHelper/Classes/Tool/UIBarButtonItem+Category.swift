//
//  UIBarButtonItem+Category.swift
//  MedicalHelper
//
//  Created by J on 16/8/16.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    class func itemWithNorImageName(normalImageName: String, highlightedImageName: String, target: AnyObject?, action: Selector) -> UIBarButtonItem{
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        
        button.setImage(UIImage(named: normalImageName), forState: .Normal)
        
        button.setImage(UIImage(named: highlightedImageName), forState: .Highlighted)
        
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        
        return UIBarButtonItem(customView: button)
    }
}
