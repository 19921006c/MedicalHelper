//
//  HospitalDoctorListViewController.swift
//  MedicalHelper
//
//  Created by J on 16/9/2.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class HospitalDoctorListViewController: BaseViewController {

    var modelArray : [HospitalDoctorListModel]?
    
    @IBOutlet weak var tableView: UITableView!

    var model : RandResultModel?
    {
        didSet{
            let param = ["uuidDepart" : "", "uuidHospital" : model!.uuidHospital!];
            RankHttpTool.hospitalDoctorListData(param) { (responseObject, error) -> () in
                self.modelArray = responseObject
                
                self.tableView.reloadData()
                self.title = self.model?.hospital
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBarHidden = false
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension HospitalDoctorListViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = HospitalDoctorListCell.cellWithTableView(tableView) as! HospitalDoctorListCell
        
        cell.model = modelArray![indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 139
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = DoctorDetailController(controllerName: "DoctorDetailController")
        vc.param = modelArray![indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
