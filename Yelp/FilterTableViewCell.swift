//
//  FilterTableViewCell.swift
//  Yelp
//
//  Created by XueYan on 11/1/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.layer.borderColor = UIColor.grayColor().CGColor
        contentView.layer.borderWidth = 0.5
        contentView.layer.cornerRadius = 5
        contentView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self).inset(UIEdgeInsetsMake(0.5, 15, 0.5, CGFloat(YPSpanSize)))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
