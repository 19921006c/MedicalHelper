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
    
    class func  hospitalDoctorListData(param: [String : String],finished: (responseObject: [HospitalDoctorListModel]?, error: NSError?) -> ()){
        let manager = CustomAFHTTPSessionManager.share()
        
        let url = "http://api.wws.xywy.com/?PageNum=1&act=zhuanjia&city=&fun=Doctor&id=&is_plus=1&level=2&pagesize=10&province=&sign=9b7da964e54e330952501c8b44c86f74&source=app_guahaozhushou&tag=app&title=&type=speciality&uuidDepart=&uuidHospital=\(param["uuidHospital"]!)"
        manager.GET(url, parameters: nil, success: { (_, responseObject) -> Void in
            
            let models = HospitalDoctorListModel.modelArrayWithDictionary(responseObject["data"] as! [[String : AnyObject]])
            
            finished(responseObject: models, error: nil)
            }) { (_, error) -> Void in
                finished(responseObject: nil, error: error)
        }
    }
    
    //  http://api.wws.xywy.com/?act=zhuanjia&fun=DoctorDetail&tag=app&sign=9b7da964e54e330952501c8b44c86f74&id=229086&pagesize=10&pagenum=1&expertid=45716
    class func doctorDetailData(param: DoctorDetailParam, finished:(responseObject: DoctorDetailModel?, error: NSError?) -> ()) {
        
        let manager = CustomAFHTTPSessionManager.share()
        
        let url = "http://api.wws.xywy.com/?act=zhuanjia&fun=DoctorDetail&tag=app&sign=9b7da964e54e330952501c8b44c86f74&id=\(param.doctorid!)&pagesize=10&pagenum=1&expertid=\(param.expert_id!)"
        
        manager.GET(url, parameters: nil, success: { (_, responseObject) -> Void in
            let model = DoctorDetailModel(dictionary: responseObject["data"] as! [String : AnyObject])
            
            
            finished(responseObject: model, error: nil)
            }) { (_, error) -> Void in
                finished(responseObject: nil, error: error)
        }
    }
}
