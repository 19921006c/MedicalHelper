//
//  SearchDoctorViewController.swift
//  MedicalHelper
//
//  Created by J on 16/9/8.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class SearchDoctorViewController: BaseViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.font = UIFont.systemFontOfSize(14)
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 2
        textField.placeholder = "搜索医院、专家、疾病"
        textField.backgroundColor = UIColor.whiteColor()
//
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 22))
        imageView.image = UIImage(named: "search02")
        imageView.contentMode = .Center
        textField.leftView = imageView
        textField.leftViewMode = UITextFieldViewMode.Always
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBarHidden = false
    }
    @IBAction func leftBtnAction(sender: AnyObject) {
//        navigationController?.navigationBarHidden = false
        navigationController?.popViewControllerAnimated(true)
    }

}