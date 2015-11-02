//
//  BusinessTableViewCell.swift
//  Yelp
//
//  Created by XueYan on 11/1/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {
    private var _businessImage: UIImageView!
    private var _businessNameLabel: UILabel!
    private var _businessRatingImage: UIImageView!
    private var _businessReviewLabel: UILabel!
    private var _businessAddressLabel: UILabel!
    private var _businessCategoryLabel: UILabel!
    private var _businessDistanceLabel: UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func addSubviews() {
        addSubview(businessImage)
        addSubview(businessNameLabel)
        addSubview(businessRatingImage)
        addSubview(businessReviewLabel)
        addSubview(businessAddressLabel)
        addSubview(businessCategoryLabel)
        addSubview(businessDistanceLabel)
    }

    func addLayout() {
        businessImage.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self).offset(YPSpanSize)
            make.top.equalTo(self).offset(YPSpanSize)
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.bottom.lessThanOrEqualTo(self).offset(-YPSpanSize)
        }
        businessNameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(businessImage)
            make.left.equalTo(businessImage.snp_right).offset(YPSpanSize)
        }
        businessNameLabel.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, forAxis: .Horizontal)
        businessDistanceLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(businessImage)
            make.left.greaterThanOrEqualTo(businessNameLabel.snp_right).offset(YPSpanSize)
            make.right.lessThanOrEqualTo(self).offset(-YPSpanSize)
        }
        businessRatingImage.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(businessNameLabel.snp_bottom).offset(YPSpanSize)
            make.left.equalTo(businessNameLabel)
            make.height.equalTo(15)
            make.width.equalTo(83)
        }
        businessReviewLabel.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(businessRatingImage.snp_right).offset(YPSpanSize)
            make.right.lessThanOrEqualTo(self).offset(-YPSpanSize)
            make.top.equalTo(businessRatingImage)
        }
        businessAddressLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(businessRatingImage.snp_bottom).offset(YPSpanSize)
            make.left.equalTo(businessNameLabel)
            make.right.lessThanOrEqualTo(self).offset(-YPSpanSize)
        }
        businessCategoryLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(businessAddressLabel.snp_bottom)
            make.left.equalTo(businessNameLabel)
            make.right.lessThanOrEqualTo(self).offset(-YPSpanSize)
            make.bottom.lessThanOrEqualTo(self).offset(-YPSpanSize)
        }
    }

    func withBusiness(business: Business) {
        businessImage.af_setImageWithURL(business.imageURL!, placeholderImage: YPPlaceholderImage)
        businessNameLabel.text = business.name
        businessDistanceLabel.text = business.distance
        businessRatingImage.af_setImageWithURL(business.ratingImageURL!)
        businessReviewLabel.text = "\(business.reviewCount!) reviews"
        businessAddressLabel.text = business.address
        businessCategoryLabel.text = business.categories
    }
}

extension BusinessTableViewCell {
    var businessImage: UIImageView {
        if _businessImage == nil {
            let v = UIImageView()
            _businessImage = v
        }
        return _businessImage
    }

    var businessRatingImage: UIImageView {
        if _businessRatingImage == nil {
            let v = UIImageView()
            _businessRatingImage = v
        }
        return _businessRatingImage
    }

    var businessNameLabel: UILabel {
        if _businessNameLabel == nil {
            let v = UILabel()
            v.font = YPTitleFontBold
            _businessNameLabel = v
        }
        return _businessNameLabel
    }

    var businessReviewLabel: UILabel {
        if _businessReviewLabel == nil {
            let v = UILabel()
            v.font = YPContentFont
            v.textColor = YPSecondardColor
            _businessReviewLabel = v
        }
        return _businessReviewLabel
    }

    var businessAddressLabel: UILabel {
        if _businessAddressLabel == nil {
            let v = UILabel()
            v.numberOfLines = 0
            v.lineBreakMode = .ByWordWrapping
            v.font = YPContentFontBold
            _businessAddressLabel = v
        }
        return _businessAddressLabel
    }

    var businessCategoryLabel: UILabel {
        if _businessCategoryLabel == nil {
            let v = UILabel()
            v.numberOfLines = 0
            v.lineBreakMode = .ByWordWrapping
            v.font = YPContentFont
            v.textColor = YPSecondardColor
            _businessCategoryLabel = v
        }
        return _businessCategoryLabel
    }

    var businessDistanceLabel: UILabel {
        if _businessDistanceLabel == nil {
            let v = UILabel()
            v.font = YPTitleFont
            v.textColor = YPSecondardColor
            _businessDistanceLabel = v
        }
        return _businessDistanceLabel
    }
}