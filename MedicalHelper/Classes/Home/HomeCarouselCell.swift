//
//  HomeCarouselCell.swift
//  MedicalHelper
//
//  Created by J on 16/8/11.
//  Copyright © 2016年 J. All rights reserved.
//  轮播图cell

import UIKit

let HomeCarouselCollectionCellIdentifier = "HomeCarouselCollectionCell"
class HomeCarouselCell: UITableViewCell{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var height: CGFloat = 0
    //记录上次滑动结束时contentOffSet X
    var recordX: CGFloat = 0
    //记录当前显示的是0  还是 1
    var recordCurrentIndex: Int = 0
    //记录开始滑动X
    var beginDraggingX: CGFloat = 0.0
    override func awakeFromNib() {
        super.awakeFromNib()
        
        height = self.contentView.bounds.width
        print("height = \(height)")
        setupCollectionViewAttributes()
    }
    
    //设置collection view
    private func setupCollectionViewAttributes(){
        collectionView.registerClass(HomeCarouselCollectionCell.self, forCellWithReuseIdentifier: HomeCarouselCollectionCellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = layout
        collectionView.pagingEnabled = true
        collectionView.bounces = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    //MARK: -懒加载
    //流水布局
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kScreenWidth, height: 115.0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        return layout
    }()
    //data source 数组
    private lazy var dataSourceArray: NSMutableArray = NSMutableArray(objects: "0","1")
    
    //放轮播图的imageview
    private lazy var carouselImageView: UIImageView = UIImageView()
}

extension HomeCarouselCell: UICollectionViewDataSource, UICollectionViewDelegate{
    
    //MARK: collection view data source
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(HomeCarouselCollectionCellIdentifier, forIndexPath: indexPath) as! HomeCarouselCollectionCell
        
        cell.imageName = dataSourceArray[indexPath.item] as? String
        
        return cell
    }
    
    //MARK: collection view delegate
//    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
//        
//        let lastX = scrollView.contentOffset.x
//        
//        if lastX == recordX {
//            return
//        }
//        dataSourceArray.exchangeObjectAtIndex(0, withObjectAtIndex: 1)
//        if lastX == kScreenWidth {
//            
//            scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
//            print("left = \(lastX)")
//            recordX = lastX
//            return
//        }
//        print("right = \(lastX)")
//        
//        scrollView.setContentOffset(CGPoint(x: kScreenWidth, y: 0), animated: false)
//        recordX = lastX
//    }
    //滑动减速结束
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let lastX = scrollView.contentOffset.x
        
        if lastX == 0 {
            //未翻页
            print("未翻页")
            scrollView.setContentOffset(CGPointZero, animated: false)
            return
        }
        
        if lastX == kScreenWidth {
            //翻页
            print("翻页")
            if recordCurrentIndex == 0 {//第一张
                exchangeDataSourceArrayOne()
                recordCurrentIndex = 1
            }else{
                exchangeDataSourceArrayZero()
                recordCurrentIndex = 0
            }
            scrollView.setContentOffset(CGPointZero, animated: false)
            return
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
        beginDraggingX = scrollView.contentOffset.x
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let beginDraggingNext = scrollView.contentOffset.x
        if (beginDraggingNext - beginDraggingX) > 0 {//右滑
            if recordCurrentIndex == 0 {//第一张
                
            }else{//第二张
//                exchangeDataSourceArrayZero()
            }
        }else{//左滑
            if recordCurrentIndex == 0 {//第一张
//                exchangeDataSourceArrayOne()
            }else{//第二张
                
            }
        }
    }
    
    private func exchangeDataSourceArrayZero(){
        dataSourceArray.removeAllObjects()
        dataSourceArray.addObject("0")
        dataSourceArray.addObject("1")
        collectionView.reloadData()
    }
    private func exchangeDataSourceArrayOne(){
        dataSourceArray.removeAllObjects()
        dataSourceArray.addObject("1")
        dataSourceArray.addObject("0")
        collectionView.reloadData()
    }
}

class HomeCarouselCollectionCell: UICollectionViewCell{
    
    var imageName: String?{
        didSet{
            carouseImageView.image = UIImage(named: imageName!)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    //初始化UI控件
    private func setupUI(){
        contentView.addSubview(carouseImageView)
        
        carouseImageView.frame = contentView.bounds
    }
    
    //MARK: - 懒加载
    private lazy var carouseImageView: UIImageView = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
