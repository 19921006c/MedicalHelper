//
//  Common.swift
//  MedicalHelper
//
//  Created by J on 16/8/10.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

let kScreenBounds = UIScreen.mainScreen().bounds
let kScreenWidth = kScreenBounds.size.width
let kScreenHeight = kScreenBounds.size.height
let kNavigationBarHeight = CGFloat(64.0)

class Common: NSObject {
    class func findNearsetViewController(view: UIView) -> UIViewController{
        var viewController: UIViewController?
        
        var next = view.superview
        
        var nextResponder = next?.nextResponder()
        
        while !nextResponder!.isKindOfClass(UIViewController){
            next = next?.superview
            
            nextResponder = next?.nextResponder()
        }
        
        viewController = nextResponder as? UIViewController
        
        return viewController!
    }
}