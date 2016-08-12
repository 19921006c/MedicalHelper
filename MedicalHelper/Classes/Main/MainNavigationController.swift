//
//  MainNavigationController.swift
//  MedicalHelper
//
//  Created by J on 16/8/10.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override class func initialize(){
        let navigationBar = UINavigationBar.appearance()
        
        navigationBar.barTintColor = UIColor.colorWithHexString("#ff5f64")
        navigationBar.translucent = false
//        var image = UIImage(named: "nav_bg")
//
//        image = image?.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 0, (image?.size.height)! - 1,(image?.size.width)! - 1))
//
//        navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarPosition.Any, bar)
        navigationBar.setBackgroundImage(UIImage(), forBarPosition: UIBarPosition.Any, barMetrics: UIBarMetrics.Default)
        navigationBar.shadowImage = UIImage()
//
//        navigationBar.shadowImage = UIImage()
        
        let mutDic : NSDictionary!
        
        mutDic = [
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont.systemFontOfSize(20)
        ]
        
        navigationBar.titleTextAttributes = mutDic as? [String : AnyObject]
        
//        print("initialize")
    }

}
