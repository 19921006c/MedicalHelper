//
//  FindExpertController.swift
//  MedicalHelper
//
//  Created by J on 16/9/7.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit
import MJRefresh
class FindExpertController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var page = 1
    var id: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        setAttributes()
        
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: Selector("headerRefresh"))
        
        tableView.mj_header.beginRefreshing()
    }
    
    func headerRefresh(){
        FindExpertTool.findExpertRequest(page, id: id) { (models, error) in
            self.tableView?.mj_header.endRefreshing()
            
            if self.modelArray.count == 0{
                for model in models!{
                    self.modelArray.append(model)
                }
            }else{
                
                for newModel in models!{
                    self.modelArray.insert(newModel, atIndex: 0)
                }
                
            }
            self.tableView?.reloadData()
            self.page += 1
        }
    }
    
    func rightDown(){
        let vc = SearchDoctorViewController(controllerName: "SearchDoctorViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //设置页面属性
    private func setAttributes(){
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.itemWithNorImageName("Search", highlightedImageName: "Search02", target: self, action: Selector("rightDown"))
    }
    
    //MARK: - 懒加载
    private lazy var modelArray = [HospitalDoctorListModel]()
}

extension FindExpertController: UITableViewDataSource, UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = HospitalDoctorListCell.cellWithTableView(tableView) as! HospitalDoctorListCell
        
        cell.model = modelArray[indexPath.row]
        
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 139
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = DoctorDetailController(controllerName: "DoctorDetailController")
        vc.param = modelArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
