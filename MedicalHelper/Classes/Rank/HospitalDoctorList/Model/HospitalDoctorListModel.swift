//
//  HospitalDoctorListModel.swift
//  MedicalHelper
//
//  Created by J on 16/9/2.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class HospitalDoctorListModel: NSObject {
    var expert_id: String?
    var name: String?
    var photo: String?{
        didSet{
            photoUrl = NSURL(string: photo!)
        }
    }
    var photoUrl: NSURL?
    var title: String?
    var level: String?
    var teach: String?
    var hospital: String?
    var depart: String?
    var goodat: String?
    var doctorid: String?
    var help_num: String?
    
    class func modelArrayWithDictionary(data: [[String: AnyObject]]) -> [HospitalDoctorListModel] {
        var models = [HospitalDoctorListModel]()
        
        for dictionary in data{
            models.append(HospitalDoctorListModel(dictionary: dictionary))
        }
        return models
    }
    init(dictionary: [String : AnyObject]) {
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
    
    var properties = ["expert_id", "name", "photo", "title", "level", "teach", "hospital", "depart", "goodat", "doctorid", "help_num"]
    
    override var description: String{
        let dictionary = dictionaryWithValuesForKeys(properties)
        
        return "\(dictionary)"
    }
    
}
