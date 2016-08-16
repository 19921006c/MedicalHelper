//
//  HotSectionExpertCollectionCellModel.swift
//  MedicalHelper
//
//  Created by J on 16/8/15.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class HotSectionExpertCollectionCellModel: NSObject {
    
    /*
    depart = "\U98ce\U6e7f\U514d\U75ab\U79d1";
    doctorid = 45139;
    "expert_id" = 17694;
    goodat = "\U98ce\U6e7f\U6027\U75be\U75c5\U5305\U62ec\U7c7b\U98ce\U6e7f\U5173\U8282\U708e\U3001\U5e72\U71e5\U7efc\U5408\U5f81\U3001\U7cfb\U7edf\U6027\U7ea2\U6591\U72fc\U75ae\U3001\U5f3a\U76f4\U6027\U810a\U67f1\U708e\U7b49\U7684\U8bca\U65ad\U6cbb\U7597\U4ee5\U53ca\U70ed\U5e26\U75c5\U4e0e\U5bc4\U751f\U866b\U75c5\U7684\U8bca\U65ad\U6cbb\U7597\U3002";
    "help_num" = 29248;
    hospital = "\U5317\U4eac\U5927\U5b66\U4eba\U6c11\U533b\U9662";
    level = "\U4e09\U7ea7\U7532\U7b49";
    name = "\U6768\U94c1\U751f";
    photo = "http://static.i2.xywy.com/zhuanjia/20150728/acad1e37b306ecba5fcff2050df6904f59933_a.jpg";
    teach = "\U6559\U6388";
    title = "\U4e3b\U4efb\U533b\U5e08";
    */
    var depart: String?
    var doctorid: NSNumber?
    var expert_id: NSNumber?
    var goodat: String?
    var help_num: NSNumber?
    var hospital: String?
    var level: String?
    var name: String?
    var photo: String?
        {
        didSet{
            photoURL = NSURL(string: photo!)
            }
        }
    var photoURL: NSURL?
    var teach: String?
    var title: String?
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dictionary)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    //打印当前模型
    var properties = ["depart", "doctorid", "expert_id", "goodat", "help_num", "hospital", "level", "name", "photo", "teach", "title"]
    
    override var description: String{
        let dictionary = dictionaryWithValuesForKeys(properties)
        
        return "\(dictionary)"
    }
}
