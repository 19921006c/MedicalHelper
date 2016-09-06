//
//  DoctorDetailSecondCell.swift
//  MedicalHelper
//
//  Created by J on 16/9/6.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

let identifierDoctorDetailSecondCell = "DoctorDetailSecondCell"
class DoctorDetailSecondCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var contentLabel: UILabel?
    
    var cellHeight: CGFloat?{
        get{
            return 100
        }
    }
    var model: DoctorDetailSubModel?{
        didSet{
            iconImageView?.image = UIImage(named: (model?.imageName)!)
            titleLabel?.text = model?.title
            contentLabel?.text = model?.content
        }
    }
    class func cellWithTableView(tableView: UITableView) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identifierDoctorDetailSecondCell)
        
        if cell == nil{
            cell = NSBundle.mainBundle().loadNibNamed(identifierDoctorDetailSecondCell, owner: self, options: nil).last as? UITableViewCell
        }
        
        return cell!
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }
    
}
