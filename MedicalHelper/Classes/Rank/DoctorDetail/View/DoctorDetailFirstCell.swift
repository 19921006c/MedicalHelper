//
//  DoctorDetailFirstCell.swift
//  MedicalHelper
//
//  Created by J on 16/9/6.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

let identifierDoctorDetailFirstCell = "DoctorDetailFirstCell"
class DoctorDetailFirstCell: UITableViewCell {
    
    var model: DoctorDetailModel?{
        didSet{
            iconImageView.sd_setImageWithURL(model!.photoURL, placeholderImage: UIImage(named: "FindHospital02"))
            namelabel.text = model?.name
            titleLabel.text = model?.title
        }
    }
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    class func cellWithTableView(tableView: UITableView) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identifierDoctorDetailFirstCell)
        
        if cell == nil{
            cell = NSBundle.mainBundle().loadNibNamed(identifierDoctorDetailFirstCell, owner: self, options: nil).last as? UITableViewCell
        }
        
        return cell!
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.cornerRadius = iconImageView.frame.size.width * 0.5
        iconImageView.layer.borderWidth = 0.5
        iconImageView.layer.borderColor = UIColor.colorWithHexString("#d6d6d6").CGColor
        iconImageView.clipsToBounds = true
    }
}
