//
//  FindHospitalTooView.swift
//  MedicalHelper
//
//  Created by J on 16/8/16.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

class FindHospitalTooView: UIView {

    let toolViewHeight: CGFloat = 44
    //总数组，例如：全国，全部科室，三甲医院
    var totalArray: NSArray?
    {
        didSet
        {
            loadSubView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.grayColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadSubView(){
        for var index = 0; index < totalArray?.count; ++index{
            initBtn(index)
        }
    }
    
    private func initBtn(index: Int){
        let width = (kScreenWidth - 2) / CGFloat((totalArray?.count)!)
        let height = toolViewHeight
        let x:CGFloat = CGFloat(index) * (width + 1)
        let y:CGFloat = 0

        let btn = UIButton(frame: CGRect(x: x, y: y, width: width, height: height))
        btn.backgroundColor = UIColor.redColor()
        btn.tag = 10000 + index
        btn.setTitle(totalArray![index] as? String, forState: .Normal)
        addSubview(btn)
    }
    
}
