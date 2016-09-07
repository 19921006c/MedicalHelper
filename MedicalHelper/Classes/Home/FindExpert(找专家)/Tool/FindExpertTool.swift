//
//  FindExpertTool.swift
//  MedicalHelper
//
//  Created by J on 16/9/7.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class FindExpertTool: NSObject {
    class func findExpertRequest(page: Int,finished:(models: [HospitalDoctorListModel]?, error: NSError?) -> ()) {
        let manager = CustomAFHTTPSessionManager.share()
        
        manager.GET("http://api.wws.xywy.com/?PageNum=\(page)&act=zhuanjia&city=&fun=Doctor&id=&is_plus=1&level=2&pagesize=10&province=&sign=9b7da964e54e330952501c8b44c86f74&source=app_guahaozhushou&tag=app&title=&type=speciality&uuidDepart=&uuidHospital=", parameters: nil, success: { (_, responseObject) -> Void in
            
            let models = HospitalDoctorListModel.modelArrayWithDictionary(responseObject["data"] as! [[String : AnyObject]])
            
            finished(models: models, error: nil)
            
            }) { (_, error) -> Void in
                finished(models: nil, error: error)
        }
    }
}
