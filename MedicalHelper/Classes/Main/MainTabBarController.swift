//
//  MainTabBarController.swift
//  MedicalHelper
//
//  Created by J on 16/8/10.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1.添加所有控制器
        addChildViewControllers()
    }
    
    //添加所有控制器
    private func addChildViewControllers(){
        //1.1首页
        addAloneChildViewController()
        //1.2排行榜
        
        //1.3我的订单
        
        //1.4我
    }
    
    //添加单个控制器
    private func addAloneChildViewController(){
        
    }
    
    //MARK: -懒加载
//    private lazy var homeVc: UIViewController = 

}
