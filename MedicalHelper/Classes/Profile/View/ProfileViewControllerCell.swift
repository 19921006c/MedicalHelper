//
//  ProfileViewControllerCell.swift
//  MedicalHelper
//
//  Created by J on 16/9/8.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

private let identifierProfileViewController = "ProfileViewControllerCell"

class ProfileViewControllerCell: UITableViewCell {

    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    var model: ProfileModel?{
        didSet{
            iconImageView.image = UIImage(named: (model?.image)!)
            label.text = model?.title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cellWithTableView(tableView: UITableView) -> ProfileViewControllerCell{
        var cell = tableView.dequeueReusableCellWithIdentifier(identifierProfileViewController) as?ProfileViewControllerCell
        
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed(identifierProfileViewController, owner: self, options: nil).last as? ProfileViewControllerCell
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
        }
        return cell!
    }
    
}
