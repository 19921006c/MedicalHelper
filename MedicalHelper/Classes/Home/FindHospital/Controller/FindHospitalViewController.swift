//
//  FindHospitalViewController.swift
//  MedicalHelper
//
//  Created by J on 16/8/16.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class FindHospitalViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setControllerAttributes()
        
        setUpUI()
        
        
        FindHospitalTool.findHospitalListData(1) { (responseObject, error) -> () in
            self.modelArray = responseObject!
            
            self.tableView.reloadData()
        }
    }
    
    //设置控制器页面属性
    private func setControllerAttributes(){
        view.backgroundColor = UIColor.whiteColor()
        
    }
    
    //布局子控件
    private func setUpUI(){
        //添加
        view.addSubview(tableView)
        //frame
        tableView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kNavigationBarHeight)
    }
    
    //MARK: - lazy
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.separatorStyle = .None
        return view
    }()
    
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
