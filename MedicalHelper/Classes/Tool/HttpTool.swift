//
//  HttpTool.swift
//  MedicalHelper
//
//  Created by J on 16/8/31.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class HttpTool: NSObject {
    
    class func loadSearchInfo(finished: (responseObject: [RandResultModel]?, error: NSError?) -> ()){
        
        let manager = CustomAFHTTPSessionManager.share()
        
        manager.GET("http://api.wws.xywy.com/index.php?type=speciality&id=46&pagesize=20&tag=app&act=zhuanjia&fun=SpecialtyDepartments&source=zdws&sign=9b7da964e54e330952501c8b44c86f74", parameters: nil, success: { (_, responseObject) -> Void in

            let models = RandResultModel.modelArrayWithDictionary(responseObject["data"] as! [[String: AnyObject]])
            
            finished(responseObject: models, error: nil)
        }) { (_, error) -> Void in
//            print(error)
            finished(responseObject: nil, error: error)
        }
    }
    
    
}
