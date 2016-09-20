//
//  RegisterHelpViewController.swift
//  MedicalHelper
//
//  Created by J on 16/9/8.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class RegisterHelpViewController: BaseViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBarHidden = false
        textView.editable = false
        title = "挂号帮助"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
