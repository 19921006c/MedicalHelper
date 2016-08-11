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
        addAloneChildViewController(HomeViewController(), norImageName: "TabBar_Home", selectedImageName: "TabBar_HomeSelected", title: "首页")
        //1.2排行榜
        addAloneChildViewController(HomeViewController(), norImageName: "TabBar_Rank", selectedImageName: "TabBar_RankSelected", title: "排行榜")
        //1.3我的订单
        addAloneChildViewController(HomeViewController(), norImageName: "TabBar_Order", selectedImageName: "TabBar_OrderSelected", title: "我的订单")
        //1.4我
        addAloneChildViewController(HomeViewController(), norImageName: "TabBar_Profile", selectedImageName: "TabBar_ProfileSelected", title: "我")
    }
    
    //添加单个控制器
    private func addAloneChildViewController(controller: UIViewController, norImageName: String, selectedImageName: String, title: String){
        controller.title = title
        controller.tabBarItem.image = UIImage(named: norImageName)
        controller.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        tabBar.tintColor = UIColor.colorWithHexString("#ff5f64")
        
        let navController = MainNavigationController()
        navController.addChildViewController(controller)
        addChildViewController(navController)
    }
    
    //MARK: -懒加载
//    private lazy var homeVc: UIViewController = 

}
