//
//  FindHospitalViewController.swift
//  MedicalHelper
//
//  Created by J on 16/8/16.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class FindHospitalViewController: BaseViewController {

    var totalArray: NSArray?
    {
        didSet
        {
            toolView.totalArray = totalArray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setControllerAttributes()
        
        setUpUI()
    }
    
    //设置控制器页面属性
    private func setControllerAttributes(){
        view.backgroundColor = UIColor.whiteColor()
        
    }
    
    //布局子控件
    private func setUpUI(){
        //添加
        view.addSubview(toolView)
        view.addSubview(tableView)
        //frame
        toolView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 44)
        tableView.frame = CGRect(x: 0, y: CGRectGetMaxY(toolView.frame), width: kScreenWidth, height: kScreenHeight - CGRectGetHeight(toolView.frame))
    }
    
    //MARK: - lazy
    private lazy var toolView: FindHospitalTooView = {
        let toolView = FindHospitalTooView()
        return toolView
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = UIColor.greenColor()
        return view
    }()
}
