//
//  VacationSpotCell.swift
//  FirstIosApp
//
//  Created by Weerawat Pleanchum on 15/9/2561 BE.
//  Copyright © 2561 Tom Weerawat. All rights reserved.
//

import UIKit

class VacationSpotCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // 1
        let layoutGuide = UILayoutGuide()
        contentView.addLayoutGuide(layoutGuide)
        
        // 2
        let topConstraint = layoutGuide.topAnchor
            .constraint(equalTo: nameLabel.topAnchor)
        
        // 3
        let bottomConstraint = layoutGuide.bottomAnchor
            .constraint(equalTo: locationNameLabel.bottomAnchor)
        
        // 4
        let centeringConstraint = layoutGuide.centerYAnchor
            .constraint(equalTo: contentView.centerYAnchor)
        
        // 5
        NSLayoutConstraint.activate(
            [topConstraint, bottomConstraint, centeringConstraint])
        
    }

  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
