//
//  AppDelegate.swift
//  MedicalHelper
//
//  Created by J on 16/8/10.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //1.创建窗口
        window = UIWindow(frame: kScreenBounds)
        //2.设置window背景色白色
        window?.backgroundColor = UIColor.whiteColor()
        //3.判断启动控制器是那个
        window?.rootViewController = NewVersionTool.rootController()
        //4.显示窗口
        window?.makeKeyAndVisible()
        return true
    }
}

