//
//  RankTableViewCell.swift
//  MedicalHelper
//
//  Created by J on 16/8/31.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

let RankTableViewCellIdentifier = "RankTableViewCell"
class RankTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var rankImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var sectionNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var bottomLineImageViewHeight: NSLayoutConstraint!
    
    var model: RandResultModel?{
        didSet{
            iconImageView.sd_setImageWithURL(NSURL(string: (model?.imginfo)!))
            sectionNameLabel.text = (model?.hospital)! + (model?.depart)!
            addressLabel.text = model?.address
        }
    }
    var index = 0{
        didSet{
            rankLabel.text = "\(index + 1)"
            if index <= 2{
                rankImageView.image = UIImage(named: "RankTop\(index + 1)Flag")
            }else{
                rankImageView.image = UIImage(named: "RankTopOtherFlag")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bottomLineImageViewHeight.constant = 0.5
    }
    
    class func cellWithTableView(tableView: UITableView) -> RankTableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(RankTableViewCellIdentifier)
        
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed(RankTableViewCellIdentifier, owner: self, options: nil).last as! RankTableViewCell
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
        }
        return cell as! RankTableViewCell
    }
    
}
