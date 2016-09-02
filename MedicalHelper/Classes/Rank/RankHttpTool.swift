//
//  RankHttpTool.swift
//  MedicalHelper
//
//  Created by J on 16/9/1.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

let SignDefaultStr = "KHy69gsk8%#@kl$"
class RankHttpTool: NSObject {
    
    class func  hospitalDoctorListData(param: [String : String],finished: (responseObject: [RandResultModel]?, error: NSError?) -> ()){
        let manager = CustomAFHTTPSessionManager.share()
        
        let url = "http://api.wws.xywy.com/?PageNum=1&act=zhuanjia&city=&fun=Doctor&id=&is_plus=1&level=2&pagesize=10&province=&sign=9b7da964e54e330952501c8b44c86f74&source=app_guahaozhushou&tag=app&title=&type=speciality&uuidDepart=&uuidHospital=\(param["uuidHospital"]!)"
        manager.GET(url, parameters: nil, success: { (_, responseObject) -> Void in
            print(responseObject)
            }) { (_, error) -> Void in
                
        }
    }
}
