//
//  EnumConstants.swift
//  Yelp
//
//  Created by XueYan on 11/1/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

enum YelpFilterDistance: String {
    case Auto = "Auto"
    case Level1 = "0.3 miles"
    case Level2 = "1 mile"
    case Level3 = "5 miles"
    case Level4 = "20 miles"

    var meters: Int? {
        switch self {
        case .Auto: return nil
        case .Level1: return 480
        case .Level2: return 1600
        case .Level3: return 8000
        case .Level4: return 40000
        }
    }
}

class YelpCategory {
    let name: String
    let code: String
    let display: Bool

    init(name: String, code: String, display: Bool = false) {
        self.name = name
        self.code = code
        self.display = display
    }
}

let YelpCategories = [
    YelpCategory(name: "Afghan", code: "afghani"),
    YelpCategory(name: "African", code: "african"),
    YelpCategory(name: "American, New", code: "newamerican"),
    YelpCategory(name: "American, Traditional", code: "tradamerican"),
    YelpCategory(name: "Arabian", code: "arabian"),
    YelpCategory(name: "Argentine", code: "argentine"),
    YelpCategory(name: "Armenian", code: "armenian", display: true),
    YelpCategory(name: "Asian Fusion", code: "asianfusion"),
    YelpCategory(name: "Asturian", code: "asturian"),
    YelpCategory(name: "Australian", code: "australian"),
    YelpCategory(name: "Austrian", code: "austrian"),
    YelpCategory(name: "Baguettes", code: "baguettes"),
    YelpCategory(name: "Bangladeshi", code: "bangladeshi"),
    YelpCategory(name: "Barbeque", code: "bbq"),
    YelpCategory(name: "Basque", code: "basque"),
    YelpCategory(name: "Bavarian", code: "bavarian"),
    YelpCategory(name: "Beer Garden", code: "beergarden"),
    YelpCategory(name: "Beer Hall", code: "beerhall"),
    YelpCategory(name: "Beisl", code: "beisl"),
    YelpCategory(name: "Belgian", code: "belgian"),
    YelpCategory(name: "Bistros", code: "bistros"),
    YelpCategory(name: "Black Sea", code: "blacksea"),
    YelpCategory(name: "Brasseries", code: "brasseries"),
    YelpCategory(name: "Brazilian", code: "brazilian"),
    YelpCategory(name: "Breakfast & Brunch", code: "breakfast_brunch"),
    YelpCategory(name: "British", code: "british"),
    YelpCategory(name: "Buffets", code: "buffets"),
    YelpCategory(name: "Bulgarian", code: "bulgarian"),
    YelpCategory(name: "Burgers", code: "burgers"),
    YelpCategory(name: "Burmese", code: "burmese"),
    YelpCategory(name: "Cafes", code: "cafes"),
    YelpCategory(name: "Cafeteria", code: "cafeteria"),
    YelpCategory(name: "Cajun/Creole", code: "cajun"),
    YelpCategory(name: "Cambodian", code: "cambodian"),
    YelpCategory(name: "Canadian", code: "New)"),
    YelpCategory(name: "Canteen", code: "canteen"),
    YelpCategory(name: "Caribbean", code: "caribbean"),
    YelpCategory(name: "Catalan", code: "catalan"),
    YelpCategory(name: "Chech", code: "chech"),
    YelpCategory(name: "Cheesesteaks", code: "cheesesteaks"),
    YelpCategory(name: "Chicken Shop", code: "chickenshop"),
    YelpCategory(name: "Chicken Wings", code: "chicken_wings"),
    YelpCategory(name: "Chilean", code: "chilean"),
    YelpCategory(name: "Chinese", code: "chinese", display: true),
    YelpCategory(name: "Comfort Food", code: "comfortfood"),
    YelpCategory(name: "Corsican", code: "corsican"),
    YelpCategory(name: "Creperies", code: "creperies"),
    YelpCategory(name: "Cuban", code: "cuban"),
    YelpCategory(name: "Curry Sausage", code: "currysausage"),
    YelpCategory(name: "Cypriot", code: "cypriot"),
    YelpCategory(name: "Czech", code: "czech"),
    YelpCategory(name: "Czech/Slovakian", code: "czechslovakian"),
    YelpCategory(name: "Danish", code: "danish"),
    YelpCategory(name: "Delis", code: "delis"),
    YelpCategory(name: "Diners", code: "diners"),
    YelpCategory(name: "Dumplings", code: "dumplings"),
    YelpCategory(name: "Eastern European", code: "eastern_european"),
    YelpCategory(name: "Ethiopian", code: "ethiopian"),
    YelpCategory(name: "Fast Food", code: "hotdogs", display: true),
    YelpCategory(name: "Filipino", code: "filipino"),
    YelpCategory(name: "Fish & Chips", code: "fishnchips"),
    YelpCategory(name: "Fondue", code: "fondue"),
    YelpCategory(name: "Food Court", code: "food_court"),
    YelpCategory(name: "Food Stands", code: "foodstands"),
    YelpCategory(name: "French", code: "french"),
    YelpCategory(name: "French Southwest", code: "sud_ouest"),
    YelpCategory(name: "Galician", code: "galician"),
    YelpCategory(name: "Gastropubs", code: "gastropubs"),
    YelpCategory(name: "Georgian", code: "georgian"),
    YelpCategory(name: "German", code: "german"),
    YelpCategory(name: "Giblets", code: "giblets"),
    YelpCategory(name: "Gluten-Free", code: "gluten_free", display: true),
    YelpCategory(name: "Greek", code: "greek"),
    YelpCategory(name: "Halal", code: "halal"),
    YelpCategory(name: "Hawaiian", code: "hawaiian"),
    YelpCategory(name: "Heuriger", code: "heuriger"),
    YelpCategory(name: "Himalayan/Nepalese", code: "himalayan"),
    YelpCategory(name: "Hong Kong Style Cafe", code: "hkcafe"),
    YelpCategory(name: "Hot Dogs", code: "hotdog"),
    YelpCategory(name: "Hot Pot", code: "hotpot"),
    YelpCategory(name: "Hungarian", code: "hungarian"),
    YelpCategory(name: "Iberian", code: "iberian"),
    YelpCategory(name: "Indian", code: "indpak"),
    YelpCategory(name: "Indonesian", code: "indonesian"),
    YelpCategory(name: "International", code: "international"),
    YelpCategory(name: "Irish", code: "irish"),
    YelpCategory(name: "Island Pub", code: "island_pub"),
    YelpCategory(name: "Israeli", code: "israeli"),
    YelpCategory(name: "Italian", code: "italian"),
    YelpCategory(name: "Japanese", code: "japanese", display: true),
    YelpCategory(name: "Jewish", code: "jewish"),
    YelpCategory(name: "Kebab", code: "kebab"),
    YelpCategory(name: "Korean", code: "korean"),
    YelpCategory(name: "Kosher", code: "kosher"),
    YelpCategory(name: "Kurdish", code: "kurdish"),
    YelpCategory(name: "Laos", code: "laos"),
    YelpCategory(name: "Laotian", code: "laotian"),
    YelpCategory(name: "Latin American", code: "latin"),
    YelpCategory(name: "Live/Raw Food", code: "raw_food"),
    YelpCategory(name: "Lyonnais", code: "lyonnais"),
    YelpCategory(name: "Malaysian", code: "malaysian"),
    YelpCategory(name: "Meatballs", code: "meatballs"),
    YelpCategory(name: "Mediterranean", code: "mediterranean"),
    YelpCategory(name: "Mexican", code: "mexican"),
    YelpCategory(name: "Middle Eastern", code: "mideastern"),
    YelpCategory(name: "Milk Bars", code: "milkbars"),
    YelpCategory(name: "Modern Australian", code: "modern_australian"),
    YelpCategory(name: "Modern European", code: "modern_european"),
    YelpCategory(name: "Mongolian", code: "mongolian"),
    YelpCategory(name: "Moroccan", code: "moroccan"),
    YelpCategory(name: "New Zealand", code: "newzealand"),
    YelpCategory(name: "Night Food", code: "nightfood"),
    YelpCategory(name: "Norcinerie", code: "norcinerie"),
    YelpCategory(name: "Open Sandwiches", code: "opensandwiches"),
    YelpCategory(name: "Oriental", code: "oriental"),
    YelpCategory(name: "Pakistani", code: "pakistani"),
    YelpCategory(name: "Parent Cafes", code: "eltern_cafes"),
    YelpCategory(name: "Parma", code: "parma"),
    YelpCategory(name: "Persian/Iranian", code: "persian"),
    YelpCategory(name: "Peruvian", code: "peruvian"),
    YelpCategory(name: "Pita", code: "pita"),
    YelpCategory(name: "Pizza", code: "pizza", display: true),
    YelpCategory(name: "Polish", code: "polish"),
    YelpCategory(name: "Portuguese", code: "portuguese"),
    YelpCategory(name: "Potatoes", code: "potatoes"),
    YelpCategory(name: "Poutineries", code: "poutineries"),
    YelpCategory(name: "Pub Food", code: "pubfood"),
    YelpCategory(name: "Rice", code: "riceshop"),
    YelpCategory(name: "Romanian", code: "romanian"),
    YelpCategory(name: "Rotisserie Chicken", code: "rotisserie_chicken"),
    YelpCategory(name: "Rumanian", code: "rumanian"),
    YelpCategory(name: "Russian", code: "russian"),
    YelpCategory(name: "Salad", code: "salad"),
    YelpCategory(name: "Sandwiches", code: "sandwiches"),
    YelpCategory(name: "Scandinavian", code: "scandinavian"),
    YelpCategory(name: "Scottish", code: "scottish"),
    YelpCategory(name: "Seafood", code: "seafood"),
    YelpCategory(name: "Serbo Croatian", code: "serbocroatian"),
    YelpCategory(name: "Signature Cuisine", code: "signature_cuisine"),
    YelpCategory(name: "Singaporean", code: "singaporean"),
    YelpCategory(name: "Slovakian", code: "slovakian"),
    YelpCategory(name: "Soul Food", code: "soulfood"),
    YelpCategory(name: "Soup", code: "soup"),
    YelpCategory(name: "Southern", code: "southern"),
    YelpCategory(name: "Spanish", code: "spanish"),
    YelpCategory(name: "Steakhouses", code: "steak"),
    YelpCategory(name: "Sushi Bars", code: "sushi"),
    YelpCategory(name: "Swabian", code: "swabian"),
    YelpCategory(name: "Swedish", code: "swedish"),
    YelpCategory(name: "Swiss Food", code: "swissfood"),
    YelpCategory(name: "Tabernas", code: "tabernas"),
    YelpCategory(name: "Taiwanese", code: "taiwanese"),
    YelpCategory(name: "Tapas Bars", code: "tapas"),
    YelpCategory(name: "Tapas/Small Plates", code: "tapasmallplates"),
    YelpCategory(name: "Tex-Mex", code: "tex-mex"),
    YelpCategory(name: "Thai", code: "thai"),
    YelpCategory(name: "Traditional Norwegian", code: "norwegian"),
    YelpCategory(name: "Traditional Swedish", code: "traditional_swedish"),
    YelpCategory(name: "Trattorie", code: "trattorie"),
    YelpCategory(name: "Turkish", code: "turkish"),
    YelpCategory(name: "Ukrainian", code: "ukrainian"),
    YelpCategory(name: "Uzbek", code: "uzbek"),
    YelpCategory(name: "Vegan", code: "vegan"),
    YelpCategory(name: "Vegetarian", code: "vegetarian", display: true),
    YelpCategory(name: "Venison", code: "venison"),
    YelpCategory(name: "Vietnamese", code: "vietnamese"),
    YelpCategory(name: "Wok", code: "wok"),
    YelpCategory(name: "Wraps", code: "wraps"),
    YelpCategory(name: "Yugoslav", code: "yugoslav")
]
