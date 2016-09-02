//
//  OrderViewController.swift
//  MedicalHelper
//
//  Created by J on 16/8/11.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class OrderViewController: BaseViewController {

    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = nil
        btn.setBackgroundImage(UIImage.imageWithColor(UIColor.colorWithHexString("#ff5f64")), forState: .Normal)
        btn.setBackgroundImage(UIImage.imageWithColor(UIColor.colorWithHexString("#e15053")), forState: .Highlighted)
        btn.layer.cornerRadius = 5.0
        btn.clipsToBounds = true
    }

    
}
