//
//  ProfileViewController.swift
//  MedicalHelper
//
//  Created by J on 16/8/11.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit
class ProfileViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self;
        tableView.delegate = self;
    }
    
    private lazy var modelArray: [ProfileModel] = {
        let dicArray = [
            ["title" : "意见反馈","image" : "my_suggest"],
            ["title" : "邀请好友","image" : "my_invite"],
            ["title" : "挂号帮助","image" : "my_registeredHelp"],
            ["title" : "设置","image" : "my_instal"]
        ]
        var array = [ProfileModel]()
        for dictionary in dicArray{
            let model = ProfileModel()
            model.title = dictionary["title"]
            model.image = dictionary["image"]
            array .append(model)
        }
        return array
    }()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = true
    }
}

extension ProfileViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = ProfileViewControllerCell.cellWithTableView(tableView)
        
        cell.model = modelArray[indexPath.row]
        
        return cell;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54 + 14
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 2{//挂号帮助
            let vc = RegisterHelpViewController(controllerName: "RegisterHelpViewController")
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}