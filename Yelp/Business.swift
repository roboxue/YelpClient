//
//  Business.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit

class Business: NSObject, MKAnnotation {
    let name: String?
    let address: String?
    let imageURL: NSURL?
    let categories: String?
    let distance: String?
    let ratingImageURL: NSURL?
    let reviewCount: NSNumber?
    let lat: Double?
    let lon: Double?
    let dealDescription: String?
    
    init(dictionary: NSDictionary) {
        name = dictionary["name"] as? String
        
        let imageURLString = dictionary["image_url"] as? String
        if imageURLString != nil {
            imageURL = NSURL(string: imageURLString!)!
        } else {
            imageURL = nil
        }
        
        let location = dictionary["location"] as? NSDictionary
        var address = ""
        var lat: Double? = nil
        var lon: Double? = nil
        if location != nil {
            let addressArray = location!["address"] as? NSArray
            if addressArray != nil && addressArray!.count > 0 {
                address = addressArray![0] as! String
            }
            
            let neighborhoods = location!["neighborhoods"] as? NSArray
            if neighborhoods != nil && neighborhoods!.count > 0 {
                if !address.isEmpty {
                    address += ", "
                }
                address += neighborhoods![0] as! String
            }

            if let coordinate = location!["coordinate"] as? NSDictionary {
                lat = coordinate["latitude"] as? Double
                lon = coordinate["longitude"] as? Double
            }
        }
        self.lat = lat
        self.lon = lon
        self.address = address

        if let deals = dictionary["deals"] as? NSArray {
            self.dealDescription = deals.map({ (deal) -> String in
                return (deal as? NSDictionary)!["title"] as! String
            }).joinWithSeparator(",")
        } else {
            self.dealDescription = nil
        }
        
        let categoriesArray = dictionary["categories"] as? [[String]]
        if categoriesArray != nil {
            var categoryNames = [String]()
            for category in categoriesArray! {
                let categoryName = category[0]
                categoryNames.append(categoryName)
            }
            categories = categoryNames.joinWithSeparator(", ")
        } else {
            categories = nil
        }
        
        let distanceMeters = dictionary["distance"] as? NSNumber
        if distanceMeters != nil {
            let milesPerMeter = 0.000621371
            distance = String(format: "%.2f mi", milesPerMeter * distanceMeters!.doubleValue)
        } else {
            distance = nil
        }
        
        let ratingImageURLString = dictionary["rating_img_url_large"] as? String
        if ratingImageURLString != nil {
            ratingImageURL = NSURL(string: ratingImageURLString!)
        } else {
            ratingImageURL = nil
        }
        
        reviewCount = dictionary["review_count"] as? NSNumber
    }

    var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2DMake(lat!, lon!)
        }
    }
    
    class func businesses(array array: [NSDictionary]) -> [Business] {
        var businesses = [Business]()
        for dictionary in array {
            let business = Business(dictionary: dictionary)
            businesses.append(business)
        }
        return businesses
    }
    
    class func searchWithTerm(term: String, sort: YelpSortMode? = .Distance, categories: [YelpCategory] = [YelpCategory](), radius: YelpFilterDistance = .Auto, deals: Bool? = nil, completion: ([Business]!, NSError!) -> Void) -> Void {
        YelpClient.sharedInstance.searchWithTerm(term, sort: sort, categories: categories.map({ (category) -> String in
            return category.code
        }), deals: deals, radius: radius.meters, completion: completion)
    }
}
