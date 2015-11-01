//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {

    var businesses = [Business]()
    private var _tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addLayouts()
        initData()
        automaticallyAdjustsScrollViewInsets = false
    }

    func addSubviews() {
        view.addSubview(tableView)
    }

    func addLayouts() {
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(snp_topLayoutGuideBottom)
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.bottom.equalTo(snp_bottomLayoutGuideTop)
        }
    }

    func initData() {
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        }
    }
}

extension BusinessesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseId = "business"
        let cell: UITableViewCell
        if let reuseCell = tableView.dequeueReusableCellWithIdentifier(reuseId) {
            cell = reuseCell
        } else {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: reuseId)
        }

        let business = businesses[indexPath.row]
        cell.textLabel?.text = business.name
        cell.imageView?.af_setImageWithURL(business.imageURL!, placeholderImage: YPPlaceholderImage)
        return cell
    }
}

extension BusinessesViewController {
    var tableView: UITableView {
        if _tableView == nil {
            let v = UITableView()
            v.dataSource = self
            v.delegate = self
            _tableView = v
        }
        return _tableView
    }
}