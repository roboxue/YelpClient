//
//  FilterViewController.swift
//  Yelp
//
//  Created by XueYan on 11/1/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    private let DealSection = 0
    private let DistanceSection = 1
    private let SortBySection = 2
    private let CategorySection = 3

    private var _tableView: UITableView!
    private var _searchButton: UIBarButtonItem!
    private var _cancelButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addLayouts()
        title = "Filter"
        automaticallyAdjustsScrollViewInsets = false
    }

    func addSubviews() {
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.leftBarButtonItem = cancelButton
    }

    func addLayouts() {
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(snp_topLayoutGuideBottom)
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.bottom.equalTo(snp_bottomLayoutGuideTop)
        }
    }

    func didPressedSearchButton() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func didPressedCancelButton() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension FilterViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Deal, Distance, SortBy, Category
        return 4
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case DealSection:
            return 1
        case DistanceSection:
            return 1
        case SortBySection:
            return 1
        case CategorySection:
            return 1
        default:
            return 0
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}

extension FilterViewController {
    var tableView: UITableView {
        if _tableView == nil {
            let v = UITableView(frame: CGRectZero, style: .Grouped)
            v.dataSource = self
            v.delegate = self
            _tableView = v
        }
        return _tableView
    }

    var searchButton: UIBarButtonItem {
        if _searchButton == nil {
            let v = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: "didPressedSearchButton")
            _searchButton = v
        }
        return _searchButton
    }

    var cancelButton: UIBarButtonItem {
        if _cancelButton == nil {
            let v = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: "didPressedCancelButton")
            _cancelButton = v
        }
        return _cancelButton
    }
}
