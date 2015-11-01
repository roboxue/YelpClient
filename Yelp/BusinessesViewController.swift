//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {
    private var _tableView: UITableView!
    private var _searchBar: UISearchBar!
    private var _filterButton: UIBarButtonItem!

    var businesses = [Business]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addLayouts()
        initData()
        automaticallyAdjustsScrollViewInsets = false
    }

    func addSubviews() {
        view.addSubview(tableView)
        navigationItem.titleView = searchBar
        navigationItem.leftBarButtonItem = filterButton
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
        Business.searchWithTerm("Restaurants", sort: .Distance, categories: nil, deals: nil) { (businesses: [Business]!, error: NSError!) -> Void in
            self.saveData(businesses)
        }
    }

    func saveData(businesses: [Business]) {
        self.businesses = businesses
        tableView.reloadData()
    }

    func didPressedFilterButton() {
        let filterPage = YPNavigationViewController(rootViewController: FilterViewController())
        presentViewController(filterPage, animated: true, completion: nil)
    }
}

extension BusinessesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let reuseId = "business"
        let cell: BusinessTableViewCell
        if let reuseCell = tableView.dequeueReusableCellWithIdentifier(reuseId) as? BusinessTableViewCell {
            cell = reuseCell
        } else {
            cell = BusinessTableViewCell(style: .Subtitle, reuseIdentifier: reuseId)
        }

        let business = businesses[indexPath.row]
        cell.withBusiness(business)
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
}

extension BusinessesViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let term = searchBar.text ?? ""
        Business.searchWithTerm(term, sort: .BestMatched, categories: nil, deals: nil) { (businesses, error) -> Void in
            self.saveData(businesses)
        }
    }

    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}

extension BusinessesViewController {
    var tableView: UITableView {
        if _tableView == nil {
            let v = UITableView()
            v.dataSource = self
            v.delegate = self
            v.estimatedRowHeight = 100
            v.rowHeight = UITableViewAutomaticDimension
            v.tableFooterView = UIView()
            _tableView = v
        }
        return _tableView
    }

    var searchBar: UISearchBar {
        if _searchBar == nil {
            let v = UISearchBar()
            v.placeholder = "Restaurants"
            v.showsCancelButton = true
            v.delegate = self
            _searchBar = v
        }
        return _searchBar
    }

    var filterButton: UIBarButtonItem {
        if _filterButton == nil {
            let v = UIBarButtonItem(title: "Filter", style: .Plain, target: self, action: "didPressedFilterButton")
            _filterButton = v
        }
        return _filterButton
    }
}