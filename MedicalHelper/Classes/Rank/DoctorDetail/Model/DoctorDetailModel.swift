//
//  DoctorDetailModel.swift
//  MedicalHelper
//
//  Created by J on 16/9/5.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class DoctorDetailModel: NSObject {
    var id: String?
    var name: String?
    var title: String?
    var teach: String?
    var goodat: String?
    var photo: String?{
        didSet{
            photoURL = NSURL(string: photo!)
        }
    }
    var photoURL: NSURL?
    var info: String?
    var pinyin: String?
    var expertId: String?
    var answernum: String?
    var is_ask: String?
    var is_plus: String?
    var hospital: String?
    var depart: String?
    var plusNum: String?
    var plus_require: String?
    var expert_pinyin: String?
    var address: String?

    
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dictionary)
    }
    
    override init() {
        super.init()
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    var properties = ["id", "name", "title", "teach", "goodat", "photo", "info", "pinyin", "expertId", "answernum", "is_ask", "is_plus", "hospital", "depart", "plusNum", "plus_require", "expert_pinyin", "address"]
    
    override var description: String{
        let dictionary = dictionaryWithValuesForKeys(properties)
        
        return "\(dictionary)"
    }
}
