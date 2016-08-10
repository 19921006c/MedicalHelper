//
//  NewVersionTool.swift
//  MedicalHelper
//
//  Created by J on 16/8/10.
//  Copyright © 2016年 J. All rights reserved.
//  检测死否为新版本，是则进入新版本介绍，否则进入MainTabBarController

import UIKit
/// 版本号key
let CFBundleShortVersionString = "CFBundleShortVersionString"

class NewVersionTool: NSObject {
    class func rootController() -> UIViewController{
        //1.获取当前版本号
        let currentVersion = NSBundle.mainBundle().infoDictionary![CFBundleShortVersionString] as! String
        //2.获取上一版本号
        let lastVersion = NSUserDefaults.standardUserDefaults().objectForKey(CFBundleShortVersionString) as? String ?? ""
        //3.比较是否相同
        if lastVersion == currentVersion {//没有新版本
            return MainTabBarController()
        }
        //4.1 缓存新的版本号
        NSUserDefaults.standardUserDefaults().setObject(currentVersion, forKey: CFBundleShortVersionString)
        //4.2跳转新版本介绍controller
        return NewVersionViewController()
    }
}
