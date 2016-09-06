//
//  DoctorDetailController.swift
//  MedicalHelper
//
//  Created by J on 16/9/5.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

private let content = "一、申请资格\n只有符合医生设定的病情条件的患者才有资格获得加号机会。\n 二、完全免费\n寻医问药网专家频道提供该服务不向患者收取任何费用，但您在医院就诊所涉及的挂号、检查以及治疗等费用需患者本人承担。\n三、预约流程/r选择门诊时间——提交订单——等待审核——领取加号凭证——换取加号单——挂号就诊。\n四、特别提示寻医问药网专家频道提供的网上预约，是和医生合作的加号服务，不能代替医院挂号，请您在门诊当天按照短信提示找医生开加号单后，再凭加号单到挂号处正常挂号。对于网上预约加号的患者不提供任何特权，医生在看完医院正常挂号的患者后，加号患者才可按序就诊。\n五、预约加号可能遇到的情况\n（1）为保障医疗资源不被浪费，如您不能在约定时间就诊，请在就诊前一天16:00前到个人中心取消预约。一旦爽约今后将不能再使用寻医问药网专家频道网上预约专家服务。\n（2）鉴于临床工作的特殊性，遇到病人抢救、急诊等突发事件，专家可能停诊或更改门诊时间，寻医问药网专家频道工作人员会在得到通知的第一时间联系您，请保持手机畅通。对于医生临时停诊导致的无法就诊，若您无法接受，请放弃预约。"

class DoctorDetailController: BaseViewController {

    @IBOutlet weak var tableView: UITableView?
    
    var model: DoctorDetailModel?
    //传过来的数据
    var param: HospitalDoctorListModel?{
        didSet{
            self.title = "\((param?.name)!)医生"
            //参数模型
            let params = DoctorDetailParam()
            params.expert_id = param?.expert_id
            params.doctorid = param?.doctorid
            RankHttpTool.doctorDetailData(params) { (responseObject, error) -> () in
                self.model = responseObject!
                
                for i in 0...3{
                    let subModel = self.subModelArray[i]
                    if i == 0{
                        subModel.content = "医院: \(self.model!.hospital!)\n地址: \(self.model!.address!)\n科室: \(self.model!.depart!)"
                    }else if i == 1{
                        subModel.content = self.model!.plus_require
                    }else if i == 2{
                        subModel.content = self.model!.info
                    }else if i == 3{
                        subModel.content = content
                    }
                }
                self.tableView?.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
    private lazy var subModelArray: [DoctorDetailSubModel] = {
        let sub1 = DoctorDetailSubModel()
        sub1.imageName = "DoctorDetail04"
        sub1.title = "地址和科室"
        let sub2 = DoctorDetailSubModel()
        sub2.imageName = "DoctorDetail05"
        sub2.title = "擅长"
        let sub3 = DoctorDetailSubModel()
        sub3.imageName = "DoctorDetail06"
        sub3.title = "简介"
        let sub4 = DoctorDetailSubModel()
        sub4.imageName = "DoctorDetail09"
        sub4.title = "预约规则"
        let array = [sub1,sub2,sub3,sub4]
        return array
    }()
}

extension DoctorDetailController: UITableViewDataSource,UITableViewDelegate
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model == nil{
            return 0
        }else{
            return 5
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = DoctorDetailFirstCell.cellWithTableView(tableView) as! DoctorDetailFirstCell
        
            cell.model = model
            return cell
        }else{
            let cell = DoctorDetailSecondCell.cellWithTableView(tableView) as! DoctorDetailSecondCell

            cell.model = subModelArray[indexPath.row - 1]
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 115
        }else{
            let subModel = subModelArray[indexPath.row - 1]
            
            return subModel.cellHeight!
        }
    }
}