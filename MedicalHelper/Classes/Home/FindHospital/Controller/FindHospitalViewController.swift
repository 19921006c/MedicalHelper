//
//  FindHospitalViewController.swift
//  MedicalHelper
//
//  Created by J on 16/8/16.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit
import MJRefresh
class FindHospitalViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    let footer = MJRefreshAutoNormalFooter()
    
    var page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setControllerAttributes()
        
        tableView?.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: Selector("headerRefresh"))
        tableView?.mj_header.beginRefreshing()
    }
    
    func headerRefresh(){
        FindHospitalTool.findHospitalListData(page) { (responseObject, error) -> () in
            
            self.tableView?.mj_header.endRefreshing()
            
            if self.modelArray.count == 0{
                for model in responseObject!{
                    self.modelArray.append(model)
                }
            }else{
                
                for newModel in responseObject!{
                    self.modelArray.insert(newModel, atIndex: 0)
                }
                
            }
//            var indexArray = [NSIndexPath]()
//            
//            for i in 0..<self.modelArray.count{
//                let indexPath = NSIndexPath(index: i)
//                indexArray.insert(indexPath, atIndex: i)
//            }
//            self.tableView!.reloadRowsAtIndexPaths(indexArray, withRowAnimation: UITableViewRowAnimation.Right)
            self.tableView?.reloadData()
            self.page += 1
        }
    }
    
    //设置控制器页面属性
    private func setControllerAttributes(){
        view.backgroundColor = UIColor.whiteColor()
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    //MARK: - lazy
    
    private lazy var modelArray = [FindHospitalModel]()
}

extension FindHospitalViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = FindHospitalCell.cellWithTableView(tableView)
        cell.model = modelArray[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 98
    }
}
