//
//  FindHospitalTool.swift
//  MedicalHelper
//
//  Created by J on 16/9/6.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class FindHospitalTool: NSObject {

    //http://api.wws.xywy.com/default.php?level=1&act=Hospital&fun=Hospital&version=2&os=&source=app_guahaozhushou&illid=&speciality_id=&province=&city=&PageNum=1&pagesize=10&sign=e61e1dda637a3b706910c921e3dbe975
    class func  findHospitalListData(page: Int,finished: (responseObject: [FindHospitalModel]?, error: NSError?) -> ()){
        let manager = CustomAFHTTPSessionManager.share()
        
        let url = "http://api.wws.xywy.com/default.php?level=1&act=Hospital&fun=Hospital&version=2&os=&source=app_guahaozhushou&illid=&speciality_id=&province=&city=&PageNum=\(page)&pagesize=10&sign=e61e1dda637a3b706910c921e3dbe975"
        manager.GET(url, parameters: nil, success: { (_, responseObject) -> Void in
            
            let models = FindHospitalModel.modelArrayWithDictionary(responseObject["data"] as! [[String : AnyObject]])
            
            finished(responseObject: models, error: nil)
            }) { (_, error) -> Void in
                finished(responseObject: nil, error: error)
        }
    }
}
