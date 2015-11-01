//
//  YPNavigationViewController.swift
//  Yelp
//
//  Created by XueYan on 11/1/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class YPNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = YPRed
        navigationBar.tintColor = YPBackgroundColor
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: YPBackgroundColor]
    }
}
