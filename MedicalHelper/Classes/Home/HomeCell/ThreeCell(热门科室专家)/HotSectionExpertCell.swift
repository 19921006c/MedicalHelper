//
//  HotSectionExpertCell.swift
//  MedicalHelper
//
//  Created by J on 16/8/12.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

let HotSectionExpertCollectionCellIdentifier = "HotSectionExpertCollectionCell"

class HotSectionExpertCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
        
        requestData()
    }
    //拿数据
    private func requestData(){
        
    }
    
    //设置collection view
    private func setupCollectionView(){
        collectionView.registerNib(UINib(nibName: HotSectionExpertCollectionCellIdentifier, bundle: nil), forCellWithReuseIdentifier: HotSectionExpertCollectionCellIdentifier)
        collectionView.collectionViewLayout = HotSectionExpertCollectionCellLayout()
        collectionView.dataSource = self
    }
    
    @IBAction func MoreBtnAction(sender: AnyObject) {
        
    }
}

extension HotSectionExpertCell: UICollectionViewDataSource{
    //data source
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(HotSectionExpertCollectionCellIdentifier, forIndexPath: indexPath) as! HotSectionExpertCollectionCell
        cell.contentView.backgroundColor = UIColor .redColor()
        return cell
    }
}

private class HotSectionExpertCollectionCellLayout: UICollectionViewFlowLayout{
    override init() {
        super.init()
        let width = kScreenWidth / 4.5
        let margin: CGFloat = 8.0
        let height = (width - margin * 2) + margin * 2 + 4 * 2 + 14 + 13
        itemSize = CGSize(width: width, height: height)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = UICollectionViewScrollDirection.Horizontal
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}