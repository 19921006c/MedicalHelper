//
//  HospitalDoctorListCell.swift
//  MedicalHelper
//
//  Created by J on 16/9/5.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

let identifierHospitalDoctorListCell = "HospitalDoctorListCell"
class HospitalDoctorListCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var hospitalLabel: UILabel!
    @IBOutlet weak var sessionLabel: UILabel!
    @IBOutlet weak var fourthImageView: UIImageView!
    @IBOutlet weak var fifthImageView: UIImageView!
    @IBOutlet weak var helpNumLabel: UILabel!
    @IBOutlet weak var lineViewHeight: NSLayoutConstraint!
    var model: HospitalDoctorListModel?{
        didSet{
            iconImageView.sd_setImageWithURL(model?.photoUrl, placeholderImage: UIImage(named: "FindHospital02"))
            nameLabel.text = model?.name
            levelLabel.text = model?.title
            hospitalLabel.text = model?.hospital
            sessionLabel.text = model?.depart
            helpNumLabel.text = "帮助患者 \((model?.help_num)!)"
            
            let num = Int((model?.help_num!)!)
            fourthImageView.image = UIImage(named: "startBack")
            fifthImageView.image = UIImage(named: "startBack")
            if num >= 100{
                fourthImageView.image = UIImage(named: "star")
                fifthImageView.image = UIImage(named: "star")
            }else if num < 100 && num >= 10{
                fourthImageView.image = UIImage(named: "star")
            }
        }
    }
    
    class func cellWithTableView(tableView: UITableView) -> UITableViewCell{
        var cell = tableView.dequeueReusableCellWithIdentifier(identifierHospitalDoctorListCell)
        
        if cell == nil{
            cell = NSBundle.mainBundle().loadNibNamed(identifierHospitalDoctorListCell, owner: self, options: nil).last as? UITableViewCell
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
        }
        return cell!
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.cornerRadius = iconImageView.frame.size.height * 0.5
        iconImageView.clipsToBounds = true
        iconImageView.layer.borderWidth = 0.5
        iconImageView.layer.borderColor = UIColor.colorWithHexString("#d6d6d6").CGColor
        
        lineViewHeight.constant = 0.5
    }
    
}
