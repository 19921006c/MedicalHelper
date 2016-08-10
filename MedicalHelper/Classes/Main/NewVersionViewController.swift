//
//  NewVersionViewController.swift
//  MedicalHelper
//
//  Created by J on 16/8/10.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class NewVersionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(){
        let nibNameOrNil = String?("NewVersionViewController")
        
        self.init(nibName: nibNameOrNil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

//extension NewVersionViewController: UICollectionViewDataSource{
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//    }
//    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        
//    }
//}
