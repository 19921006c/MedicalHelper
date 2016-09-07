//
//  FindHospitalCell.swift
//  MedicalHelper
//
//  Created by J on 16/8/31.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

let FindHospitalCellIdentifier = "FindHospitalCell"
class FindHospitalCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var sectionNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var bottomLineImageViewHeight: NSLayoutConstraint!
    
    var model: FindHospitalModel?{
        didSet{
            iconImageView.sd_setImageWithURL(NSURL(string: (model?.imginfo)!))
            sectionNameLabel.text = model?.name
            addressLabel.text = model?.address
            levelLabel.text = model?.level
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bottomLineImageViewHeight.constant = 0.5
    }
    
    class func cellWithTableView(tableView: UITableView) -> FindHospitalCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(RankTableViewCellIdentifier)
        
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed(FindHospitalCellIdentifier, owner: self, options: nil).last as! FindHospitalCell
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
        }
        return cell as! FindHospitalCell
    }
    
}
