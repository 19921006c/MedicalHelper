//
//  CustomAFHTTPSessionManager.swift
//  MedicalHelper
//
//  Created by J on 16/8/12.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit
import AFNetworking
let kExpertsource = "app_guahaozhushou"
class CustomAFHTTPSessionManager: AFHTTPSessionManager {
    
    //单例
    static let tools: CustomAFHTTPSessionManager = {
//        let url = NSURL(string: "http://api.wws.xywy.com/")
        let manager = CustomAFHTTPSessionManager(sessionConfiguration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        //设置afn能够接受的类型
        manager.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json", "text/json", "text/javascript", "text/plain", "text/html") as! Set<String>
        
        return manager
    }()
    
    class func share() -> CustomAFHTTPSessionManager{
        return tools
    }
    
}

extension CustomAFHTTPSessionManager{

    func loadSearchInfo(finished: (responsable: AnyObject?, error: NSError?) -> ()){
        
        CustomAFHTTPSessionManager.share().GET("http://api.wws.xywy.com/index.php?type=speciality&id=46&pagesize=20&tag=app&act=zhuanjia&fun=SpecialtyDepartments&source=zdws&sign=9b7da964e54e330952501c8b44c86f74", parameters: nil, success: { (_, responseObject) -> Void in
            print(responseObject)
            finished(responsable: responseObject, error: nil)
            }) { (_, error) -> Void in
                print(error)
                finished(responsable: nil, error: error)
        }
    }
}
