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
    @IBOutlet weak var topLineImageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var bottomLineImageViewHeight: NSLayoutConstraint!

    var height: CGFloat = 0
    
    var timer: NSTimer?
    override func awakeFromNib() {
        super.awakeFromNib()

        height = self.contentView.bounds.width
//        print("height = \(height)")
        setupCollectionViewAttributes()
        
        //
        collectionView.performBatchUpdates(nil) { (_) in
            self.collectionView.setContentOffset(CGPoint(x: kScreenWidth, y: 0), animated: false)
            self.addNSTimer()
        }
        topLineImageViewHeight.constant = 0.5
        bottomLineImageViewHeight.constant = 0.5
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
    
    func next(){
        var pageIndex = collectionView.contentOffset.x / kScreenWidth
        pageIndex++
        self.collectionView.setContentOffset(CGPoint(x: kScreenWidth * pageIndex, y: 0), animated: true)
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
    private lazy var dataSourceArray: NSMutableArray = NSMutableArray(objects: "0","1","0","1")
    
    //放轮播图的imageview
    private lazy var carouselImageView: UIImageView = UIImageView()
    
    private lazy var loop: NSRunLoop = NSRunLoop.currentRunLoop()
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
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.item == 1 || indexPath.item == 3{//点击免费挂号预约专家
            
            return
        }
        //点击姨妈思密达
        let str = "http://itunes.apple.com/us/app/id867910885"
        let url = NSURL(string: str)
        UIApplication.sharedApplication().openURL(url!)
    }
    
    //MARK: collection view delegate
    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        let pageIndex = scrollView.contentOffset.x / kScreenWidth
        
        if pageIndex == 3 {
            toSecondPage()
        }
        
    }
    //滑动减速结束
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let lastX = scrollView.contentOffset.x
        
        if lastX == 1125 {//到第四张时，自动跳转到第2张
            toSecondPage()
            return
        }
        
        if lastX == 0 {//到第一张时，自动跳转到第3张
            toThirdPage()
            return
        }
    }
    
    private func toSecondPage(){
        collectionView.setContentOffset(CGPoint(x: kScreenWidth, y: 0), animated: false)
    }
    private func toThirdPage(){
        collectionView.setContentOffset(CGPoint(x: kScreenWidth * 2, y: 0), animated: false)
    }
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        addNSTimer()
    }
    
    //
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        removeNSTimer()
    }
    //添加定时器
    private func addNSTimer(){
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("next"), userInfo: nil, repeats: true)
        
        loop.addTimer(timer!, forMode: NSRunLoopCommonModes)
    }
    //移除定时器
    private func removeNSTimer(){
        timer!.invalidate()
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
    private lazy var carouseImageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 115))
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
