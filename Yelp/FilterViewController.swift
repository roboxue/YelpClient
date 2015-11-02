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
    private var _dealSwitch: UISwitch!

    private var _dealToggled = YPDealOnly
    private var _selectedFilterDistance = YPSelectedFilterDistance
    private var _selectedSortByOption = YPSelectedSortMode
    private var _selectedCategories = YPSelectedCategory

    private let distanceOptions: [YelpFilterDistance] = [.Auto, .Level1, .Level2, .Level3, .Level4]
    private var _distanceToggled = false

    private let sortByOptions: [YelpSortMode] = [.BestMatched, .Distance, .HighestRated]
    private var _sortByToggled = false

    private var _categoryToggled = false

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
        YPDealOnly = dealToggled
        YPSelectedFilterDistance = _selectedFilterDistance
        YPSelectedSortMode = _selectedSortByOption
        YPSelectedCategory = _selectedCategories
        dismissViewControllerAnimated(true, completion: nil)
    }

    func didPressedCancelButton() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    func didToggledDeal(sender: UISwitch) {
        dealToggled = sender.on
    }

    func didSelectedCategory(sender: UISwitch) {
        let row = sender.tag
        let option = categoryDataSource[row]
        if sender.on {
            if !_selectedCategories.contains({ (category) -> Bool in
                return category.code == option.code
            }) {
                _selectedCategories.append(option)
            }
        } else {
            if let index = _selectedCategories.indexOf({ (category) -> Bool in
                return category.code == option.code
            }) {
                _selectedCategories.removeAtIndex(index)
            }
        }
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
            return _distanceToggled ? distanceOptions.count: 1
        case SortBySection:
            return _sortByToggled ? sortByOptions.count: 1
        case CategorySection:
            return categoryToggled ? categoryDataSource.count: (categoryDataSource.count + 1)
        default:
            return 0
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = FilterTableViewCell(style: .Value1, reuseIdentifier: nil)
        cell.textLabel?.font = YPTitleFontBold
        switch indexPath.section {
        case DealSection:
            cell.textLabel?.text = "Offering a Deal"
            cell.accessoryView = dealSwitch
        case DistanceSection:
            let option = distanceToggled ? distanceOptions[indexPath.row] : _selectedFilterDistance
            cell.textLabel?.text = option.rawValue
            if distanceToggled {
                if option == _selectedFilterDistance {
                    cell.accessoryType = .Checkmark
                }
            } else {
                let downArrow = UILabel()
                downArrow.text = "∇"
                downArrow.sizeToFit()
                cell.accessoryView = downArrow
            }
        case SortBySection:
            let option = sortByToggled ? sortByOptions[indexPath.row]: _selectedSortByOption
            cell.textLabel?.text = option.toString()
            if sortByToggled {
                if option == _selectedSortByOption {
                    cell.accessoryType = .Checkmark
                }
            } else {
                let downArrow = UILabel()
                downArrow.text = "∇"
                downArrow.sizeToFit()
                cell.accessoryView = downArrow
            }
        case CategorySection:
            if categoryDataSource.count == indexPath.row {
                cell.textLabel?.textColor = YPSecondardColor
                cell.textLabel?.text = "See All"
            } else {
                let option = categoryDataSource[indexPath.row]
                let optionSwitch = UISwitch()
                optionSwitch.onTintColor = YPRed
                optionSwitch.on = _selectedCategories.contains({ (category) -> Bool in
                    return category.code == option.code
                })
                optionSwitch.tag = indexPath.row
                optionSwitch.addTarget(self, action: "didSelectedCategory:", forControlEvents: .ValueChanged)
                cell.accessoryView = optionSwitch
                cell.textLabel?.text = option.name
            }
        default:
            break
        }
        return cell
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case DistanceSection:
            return "Distance"
        case SortBySection:
            return "Sort By"
        case CategorySection:
            return "Category"
        default:
            return nil
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.section {
        case DealSection:
            dealToggled = !dealToggled
        case DistanceSection:
            if distanceToggled {
                _selectedFilterDistance = distanceOptions[indexPath.row]
                distanceToggled = false
            } else {
                distanceToggled = true
            }
        case SortBySection:
            if sortByToggled {
                _selectedSortByOption = sortByOptions[indexPath.row]
                sortByToggled = false
            } else {
                sortByToggled = true
            }
        case CategorySection:
            if indexPath.row == categoryDataSource.count {
                categoryToggled = true
            }
        default:
            break
        }
    }
}

extension FilterViewController {
    var tableView: UITableView {
        if _tableView == nil {
            let v = UITableView(frame: CGRectZero, style: .Grouped)
            v.dataSource = self
            v.delegate = self
            v.backgroundColor = YPBackgroundColor
            v.separatorStyle = .None
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

    var distanceToggled: Bool {
        get {
            return _distanceToggled
        }
        set {
            _distanceToggled = newValue
            self.tableView.reloadSections(NSIndexSet(index: DistanceSection), withRowAnimation: .Automatic)
        }
    }

    var sortByToggled: Bool {
        get {
            return _sortByToggled
        }
        set {
            _sortByToggled = newValue
            self.tableView.reloadSections(NSIndexSet(index: SortBySection), withRowAnimation: .Automatic)
        }
    }

    var categoryToggled: Bool {
        get {
            return _categoryToggled
        }
        set {
            _categoryToggled = newValue
            self.tableView.reloadSections(NSIndexSet(index: CategorySection), withRowAnimation: .Automatic)
        }
    }

    var dealToggled: Bool {
        get {
            return _dealToggled
        }
        set {
            _dealToggled = newValue
            dealSwitch.on = _dealToggled
        }
    }

    var dealSwitch: UISwitch {
        if _dealSwitch == nil {
            let v = UISwitch()
            v.onTintColor = YPRed
            v.addTarget(self, action: "didToggledDeal:", forControlEvents: .ValueChanged)
            _dealSwitch = v
        }
        _dealSwitch.on = dealToggled
        return _dealSwitch
    }

    var categoryDataSource: [YelpCategory] {
        return categoryToggled ? YelpCategories : (YelpCategories.filter { (category) -> Bool in
            return category.display
        } + _selectedCategories.filter({ (category) -> Bool in
            return category.display == false
        }))
    }
}
