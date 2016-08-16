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
        let url = NSURL(string: "http://api.wws.xywy.com/")
        let t = CustomAFHTTPSessionManager(baseURL: url)
        
        //设置afn能够接受的类型
        t.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json", "text/json", "text/javascript", "text/plain") as! Set<String>
        
        return t
    }()
    
    class func share() -> CustomAFHTTPSessionManager{
        return tools
    }
    
}

extension CustomAFHTTPSessionManager{

    func loadSearchInfo(finished: (responsable: AnyObject?, error: NSError?) -> ()){
        
        /*
        parameters[@"keyword"] = param[@"keyword"];
        parameters[@"act"] = @"zhuanjia";
        parameters[@"fun"] = @"Doctor";
        parameters[@"tag"] = @"app";
        parameters[@"source"] = kExpertsource;
        parameters[@"is_plus"] = @"1";
        parameters[@"type"] = @"speciality";
        parameters[@"level"] = @"1";
        parameters[@"PageNum"] = param[@"PageNum"];
        
        
        
        NSString *signStr = [NSString stringWithFormat:@"%@%@",SignDefaultStr,parameters[@"tag"]].md5String;
        parameters[@"sign"] = signStr;
        */
        let param: [String: String] = [
            "keyword" : "keyword",
            "act" : "zhuanjia",
            "fun" : "Doctor",
            "tag" : "app",
            "source" : kExpertsource,
            "is_plus" : "1",
            "type" : "1",
            "level" : "keyword",
            "PageNum" : "PageNum"
        ]
        
        CustomAFHTTPSessionManager.share().GET(nil, parameters: param, success: { (_, responseObject) -> Void in
            print(responseObject)
            finished(responsable: responseObject, error: nil)
            }) { (_, error) -> Void in
                print(error)
                finished(responsable: nil, error: error)
        }
    }
}
