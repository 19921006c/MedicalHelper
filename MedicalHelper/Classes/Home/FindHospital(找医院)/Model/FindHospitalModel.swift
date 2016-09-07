//
//  FindHospitalModel.swift
//  MedicalHelper
//
//  Created by J on 16/9/6.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class FindHospitalModel: NSObject {
    
    var name: String?
    var level: String?
    var kind: String?
    var id: String?
    var imginfo: String?
    var address: String?
    var plus_expert: String?
    var ask_expert: String?
    var depart_id: String?
    
    init(dictionary: [String : AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dictionary)
    }
    
    class func modelArrayWithDictionary(data: [[String : AnyObject]]) -> [FindHospitalModel] {
        var models = [FindHospitalModel]()
        
        for dictionary in data{
            models.append(FindHospitalModel(dictionary: dictionary))
        }
        return models
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    var properties = ["name", "level", "kind", "id", "imginfo", "address", "plus_expert", "ask_expert", "depart_id"]
    
    override var description: String{
        let dictionary = dictionaryWithValuesForKeys(properties)
        
        return "\(dictionary)"
    }
}

/**
name: "北京301医院",
level: "三级甲等",
kind: "综合医院",
id: "45",
imginfo: "http://xs3.op.xywy.com/api.iu1.xywy.com/zhuanjia/20160217/4de46d78adfd02bad4915ae8eca51db494746.jpg",
address: "北京市海淀区复兴路28号",
plus_expert: "208",
ask_expert: "299",
depart_id: "0"
*/
