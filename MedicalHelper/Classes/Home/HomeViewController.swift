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
let HotSectionExpertCellIdentifier = "HotSectionExpertCell"
let kCarouselCellHeight = 115

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
    }
    
    //注册cell
    private func registerCell(){
        tableView.registerNib(UINib(nibName: HomeCarouselCellIdentifier, bundle: nil), forCellReuseIdentifier: HomeCarouselCellIdentifier)
        tableView.registerClass(HomeTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: HomeTableViewHeaderViewIdentifier)
        tableView.registerNib(UINib(nibName: HotSectionExpertCellIdentifier, bundle: nil), forCellReuseIdentifier: HotSectionExpertCellIdentifier)
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        if indexPath.section == 0{
            cell = tableView.dequeueReusableCellWithIdentifier(HomeCarouselCellIdentifier, forIndexPath: indexPath)
        }
        
        if indexPath.section == 1{
            if indexPath.row == 0 {//热门科室专家
                cell = tableView.dequeueReusableCellWithIdentifier(HotSectionExpertCellIdentifier, forIndexPath: indexPath)
                cell?.selectionStyle = UITableViewCellSelectionStyle.None
            }
        }
        
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 115.0
        }
        
        if indexPath.row == 0 {
            let width = kScreenWidth / 4.5
            let margin: CGFloat = 8.0
            let height = width - margin * 2 + margin * 2 + 4 * 2 + 14 + 13
            let cellHeight = height + 39 + 14
            return cellHeight
        }
        return 50.0
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier(HomeTableViewHeaderViewIdentifier) as! HomeTableViewHeaderView
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