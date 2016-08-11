//
//  HomeViewController.swift
//  MedicalHelper
//
//  Created by J on 16/8/11.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

let HomeCarouselCellIdentifier = "HomeCarouselCell"
let HomeTableViewHeaderViewIdentifier = "HomeTableViewHeaderView"
let kCarouselCellHeight = 115 * FITSCALE

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
    }
    
    //注册cell
    private func registerCell(){
        tableView.registerNib(UINib(nibName: HomeCarouselCellIdentifier, bundle: nil), forCellReuseIdentifier: HomeCarouselCellIdentifier)
        tableView.registerNib(UINib(nibName: HomeCarouselCellIdentifier, bundle: nil), forCellReuseIdentifier: HomeCarouselCellIdentifier)
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(HomeCarouselCellIdentifier, forIndexPath: indexPath)
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 115.0
        }
        return 50.0
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier(HomeCarouselCellIdentifier)
            return headerView
        }
        return nil
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 115
    }
    
    
}