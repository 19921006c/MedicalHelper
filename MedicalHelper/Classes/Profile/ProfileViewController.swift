//
//  ProfileViewController.swift
//  MedicalHelper
//
//  Created by J on 16/8/11.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit
let kTopImageHeight = kScreenWidth * 0.6

let ProfileViewControllerCellIdentifier = "ProfileViewControllerCell"
class ProfileViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //顶部缩放imageView
    @IBOutlet weak var topImageViewWidth: NSLayoutConstraint!
    
    @IBOutlet weak var topImageViewTop: NSLayoutConstraint!
    
    @IBOutlet weak var tableViewTop: NSLayoutConstraint!
    
    var lastContentOffSetY: CGFloat = 0
    
    var firstCellHeight: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUIAttributes()
    }
    
    private func setUIAttributes(){

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: ProfileViewControllerCellIdentifier)
        topImageViewWidth.constant = kScreenWidth
        tableView.backgroundColor = UIColor.greenColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        tableViewTop.constant = kTopImageHeight - 20
    }
}

extension ProfileViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ProfileViewControllerCellIdentifier, forIndexPath: indexPath)
        if indexPath.row == 0{
            cell.contentView.backgroundColor = UIColor.blueColor()
        }else{
            cell.contentView.backgroundColor = UIColor.yellowColor()
        }
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0{
            return firstCellHeight
        }
        return 44
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
//        print("contentInsert = \(scrollView.contentInset.top)")
        
        lastContentOffSetY = scrollView.contentOffset.y
        
        
//        if scrollView.contentInset.top != 0{
//            scrollView.contentInset.top = 0
//        }
        print("y = \(tableView.contentOffset.y)")
        print("top = \(tableView.contentInset.top)")
        let changeY = scrollView.contentOffset.y + 20
        
        if changeY > 0{//上滑
            topImageViewTop.constant = -changeY
            print("topHeight = \(changeY)")
            return
        }
        
//        topImageViewTop.constant = 0
//        if changeY == -20{
//            return
//        }
//        
//        if changeY < -20{
//            let height = kTopImageHeight + changeY
//            topImageViewWidth.constant = height / 3 * 5
//        }
//        let changeY = -tableView.contentOffset.y - 225
//        print("changeY = \(changeY)")
//        print("height = \(topImageViewWidth.constant * 0.6)")
//        let height = topImageViewWidth.constant * 0.6 + changeY
//        print("changeHeight = \(height)")
//        topImageViewWidth.constant = height / 3 * 5
//        print("width = \(topImageViewWidth.constant)")
    }
}
