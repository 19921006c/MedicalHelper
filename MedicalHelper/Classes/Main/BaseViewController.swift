//
//  BaseViewController.swift
//  MedicalHelper
//
//  Created by J on 16/8/11.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBarAttributes()
    }
    
    private func setNavigationBarAttributes(){
        navigationItem.leftBarButtonItem = UIBarButtonItem.itemWithNorImageName("FindHospital06", highlightedImageName: "search01", target: self, action: Selector("leftDown"))
    }

    convenience init(controllerName: String) {
        let nibNameOrNil = controllerName
        
        self.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func leftDown(){
        navigationController?.popViewControllerAnimated(true)
    }
}
