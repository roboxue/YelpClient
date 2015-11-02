//
//  MapViewController.swift
//  Yelp
//
//  Created by XueYan on 11/1/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    private var _mapView: MKMapView!
    private var _listviewButton: UIBarButtonItem!
    var businesses: [Business]!

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addLayouts()
        navigationItem.rightBarButtonItem = listviewButton
        title = "Businesses around"
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        mapView.addAnnotations(businesses)
    }

    func addSubviews() {
        view.addSubview(mapView)
    }

    func addLayouts() {
        mapView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(snp_topLayoutGuideBottom)
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.bottom.equalTo(snp_bottomLayoutGuideTop)
        }
    }

    func didPressedListButton() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

extension MapViewController {
    var mapView: MKMapView {
        if _mapView == nil {
            let v = MKMapView()
            let center = CLLocationCoordinate2DMake(SimulateLat, SimulateLon)
            v.centerCoordinate = center
            v.setRegion(MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)), animated: true)
            v.zoomEnabled = true
            if #available(iOS 9.0, *) {
                v.showsScale = true
                v.showsCompass = true
            }
            v.showsBuildings = true
            _mapView = v
        }
        return _mapView
    }

    var listviewButton: UIBarButtonItem {
        if _listviewButton == nil {
            let v = UIBarButtonItem(title: "List", style: .Plain, target: self, action: "didPressedListButton")
            _listviewButton = v
        }
        return _listviewButton
    }
}
