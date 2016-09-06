//
//  HotSectionCollectionCellModel.swift
//  MedicalHelper
//
//  Created by J on 16/8/15.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class HotSectionCollectionCellModel: NSObject {

    var title: String?
    
    var photoName: String?
    
    init(dictionary: [String : String]) {
        super.init()
        setValuesForKeysWithDictionary(dictionary)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    var properties = ["title", "photoName"]
    
    override var description: String{
        let dictionary = dictionaryWithValuesForKeys(properties)
        
        return "\(dictionary)"
    }
}
