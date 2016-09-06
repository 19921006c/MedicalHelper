//
//  RandResultModel.swift
//  MedicalHelper
//
//  Created by J on 16/8/31.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class RandResultModel: NSObject {
    var uuidHospital: String?
    var hospital: String?
    var uuidDepart: String?
    var depart: String?
    var province: String?
    var city: String?
    var level: String?
    var address: String?
    var imginfo: String?
    
    class func modelArrayWithDictionary(data: [[String: AnyObject]]) -> [RandResultModel]{
        var models = [RandResultModel]()
        
        for dictionary in data {
            models.append(RandResultModel(dictionary: dictionary))
        }
        return models
    }
    init(dictionary: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dictionary)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    var properties = ["uuidHospital", "hospital", "uuidDepart", "depart", "province", "city", "level", "address", "imginfo"]
    
    override var description: String{
        let dictionary = dictionaryWithValuesForKeys(properties)
        
        return "\(dictionary)"
    }
}
