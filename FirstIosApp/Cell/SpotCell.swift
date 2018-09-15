//
//  SpotCell.swift
//  FirstIosApp
//
//  Created by Weerawat Pleanchum on 15/9/2561 BE.
//  Copyright © 2561 Tom Weerawat. All rights reserved.
//

import UIKit

class SpotCell: UITableViewCell {
    
    @IBOutlet weak var ThumbImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let layOutGuide = UILayoutGuide()
        contentView.addLayoutGuide(layOutGuide)
        
        let topConstraint = layOutGuide.topAnchor
        .constraint(equalTo: nameLabel.topAnchor)
        
        
        let bottimConstraint = layOutGuide.bottomAnchor
            .constraint(equalTo: locationName.bottomAnchor)
        
        let centeringConstraint = layOutGuide.centerYAnchor
        .constraint(equalTo: contentView.centerYAnchor)
        NSLayoutConstraint.activate([topConstraint,bottimConstraint,centeringConstraint])
    }

  

}
