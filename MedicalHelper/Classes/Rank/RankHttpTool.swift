//
//  RankHttpTool.swift
//  MedicalHelper
//
//  Created by J on 16/9/1.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class RankHttpTool: NSObject {
    
    class func  hospitalDoctorListData(finished: (responseObject: [RandResultModel]?, error: NSError?) -> ()){
        let manager = CustomAFHTTPSessionManager.share()
        
        
        manager.GET(<#T##URLString: String!##String!#>, parameters: <#T##AnyObject!#>, success: <#T##((NSURLSessionDataTask!, AnyObject!) -> Void)!##((NSURLSessionDataTask!, AnyObject!) -> Void)!##(NSURLSessionDataTask!, AnyObject!) -> Void#>, failure: <#T##((NSURLSessionDataTask!, NSError!) -> Void)!##((NSURLSessionDataTask!, NSError!) -> Void)!##(NSURLSessionDataTask!, NSError!) -> Void#>)
    }
}
