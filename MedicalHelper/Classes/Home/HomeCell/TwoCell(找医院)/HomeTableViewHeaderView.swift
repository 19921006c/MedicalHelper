//
//  HomeTableViewHeaderView.swift
//  MedicalHelper
//
//  Created by J on 16/8/11.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

let HomeTableViewHeaderViewCellIdentifier = "HomeTableViewHeaderViewCell"
let itemWidth : CGFloat = 60.0
class HomeTableViewHeaderView: UITableViewHeaderFooterView {

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI(){
        contentView.addSubview(collectionView)
        
        collectionView.registerClass(HomeTableViewHeaderViewCell.self, forCellWithReuseIdentifier: HomeTableViewHeaderViewCellIdentifier)
    }
    
    //MARK: - lazy
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 115), collectionViewLayout: HomeTableViewHeaderViewCellLayout())
        view.backgroundColor = UIColor.whiteColor()
        view.dataSource = self
        return view
    }()
}

extension HomeTableViewHeaderView: UICollectionViewDataSource{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(HomeTableViewHeaderViewCellIdentifier, forIndexPath: indexPath) as! HomeTableViewHeaderViewCell
        
        cell.index = indexPath.item + 1
        
        return cell
    }
}

private class HomeTableViewHeaderViewCellLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        
        let margin: CGFloat = 25
        
        scrollDirection = UICollectionViewScrollDirection.Horizontal
        minimumLineSpacing = margin
//        minimumInteritemSpacing = 20
        itemSize = CGSize(width: itemWidth, height: 95)
        headerReferenceSize = CGSize(width: (kScreenWidth - itemWidth * 4 - margin * 3) * 0.5, height: 115)
//        footerReferenceSize = CGSize(width: 10, height: 115)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private class HomeTableViewHeaderViewCell: UICollectionViewCell{
    
    var index: Int!{
        didSet{
//            print("TopBtn\(index)")
            imageBtn.setImage(UIImage(named: "TopBtn\(index)"), forState: .Normal)
            imageBtn.setImage(UIImage(named: "TopBtnSelect\(index)"), forState: .Highlighted)
            titleLabel.text = titleArray[index - 1]
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    private func setUpUI(){
        //添加子控件
        contentView.addSubview(imageBtn)
        contentView.addSubview(titleLabel)
        
        //布局
        imageBtn.frame = CGRectMake(0, 0, itemWidth, itemWidth)
        titleLabel.frame = CGRectMake(0, CGRectGetMaxY(imageBtn.frame) + 15, itemWidth, 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - lazy
    private lazy var imageBtn = UIButton()
    
    private lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(15)
        label.textAlignment = NSTextAlignment.Center
        return label
    }()
    
    private lazy var titleArray: [String] = {
        let array = ["找医院","找专家","疾病挂号","科室挂号"]
        return array
    }()
}

