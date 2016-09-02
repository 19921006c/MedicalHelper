//
//  HospitalDoctorListViewController.swift
//  MedicalHelper
//
//  Created by J on 16/9/2.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class HospitalDoctorListViewController: BaseViewController {

    var model : RandResultModel?
    {
        didSet{
            let param = ["uuidDepart" : "", "uuidHospital" : model!.uuidHospital!];
            RankHttpTool.hospitalDoctorListData(param) { (responseObject, error) -> () in
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
