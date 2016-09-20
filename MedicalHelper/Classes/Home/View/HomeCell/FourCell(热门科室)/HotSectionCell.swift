//
//  HotSectionCell.swift
//  MedicalHelper
//
//  Created by J on 16/8/15.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

let HotSectionCollectionCellIdentifier = "HotSectionCollectionCell"
class HotSectionCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var firstLineImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var secondLineImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var thirdLineImageViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
        
        loadData()
        firstLineImageViewHeight.constant = 0.5
        secondLineImageViewHeight.constant = 0.5
        thirdLineImageViewHeight.constant = 0.5
    }
    
    //设置collectionview
    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerNib(UINib(nibName: HotSectionCollectionCellIdentifier, bundle: nil), forCellWithReuseIdentifier: HotSectionCollectionCellIdentifier)
        collectionView.collectionViewLayout = HotSectionCollectionCellLayout()
        collectionView.backgroundColor = UIColor.colorWithHexString("#d6d6d6")
    }
    
    private func loadData(){
        
        for dictionary in dictionaryArray{
            
            let model = HotSectionCollectionCellModel(dictionary: dictionary as! [String : String])
            
            dataSourceArray.addObject(model)
        }
        
        collectionView.reloadData()
    }
    
    //
    private lazy var dictionaryArray: NSMutableArray = {
        let tmpArray = NSMutableArray(array: [
            ["title" : "普通内科","photoName" :"Depart11", "id" : "45"],
            ["title" : "普外科","photoName" :"Depart12", "id" : "44"],
            ["title" : "骨科","photoName" :"Depart13", "id" : "74"],
            ["title" : "肿瘤综合科","photoName" :"Depart14", "id" : "117"],
            ["title" : "中医科","photoName" :"Depart15", "id" : "148"],
            ["title" : "妇产科","photoName" :"Depart16", "id" : "67"]
            ])
        
        
        return tmpArray
    }()
    private lazy var dataSourceArray: NSMutableArray = NSMutableArray()
}

extension HotSectionCell: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(HotSectionCollectionCellIdentifier, forIndexPath: indexPath) as! HotSectionCollectionCell
        cell.contentView.backgroundColor = UIColor.whiteColor()
        cell.model = dataSourceArray[indexPath.row] as? HotSectionCollectionCellModel
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let model = dataSourceArray[indexPath.row] as? HotSectionCollectionCellModel
        
        let vc = FindExpertController(controllerName: "FindExpertController")
        vc.id = model!.id
        vc.title = model?.title
        Common.findNearsetViewController(self).navigationController?.pushViewController(vc, animated: true)
    }
}

class HotSectionCollectionCellLayout: UICollectionViewFlowLayout{
    override init() {
        super.init()
        itemSize.width = (kScreenWidth - 0.5) * 0.5
        itemSize.height = 84
        minimumInteritemSpacing = 0.5
        minimumLineSpacing = 0.5
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
