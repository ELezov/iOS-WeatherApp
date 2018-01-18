//
//  CityResult.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import ObjectMapper

public class CityResult:Mappable {
    var results : Array<City>?
    //var meta : Meta?

    required public init?(map: Map){
        
    }
    
    init() {
        
    }
    
    public func mapping(map: Map) {
        
        results <- map["results"]
//        country <- map["country"]
//        localizedCountryName <- map["localized_country_name"]
//        city <- map["city"]
//        lon <- map["lon"]
//        ranking <- map["ranking"]
//        id <- map["id"]
//        memberCount <- map["member_count"]
//        nameString <- map["name_string"]
//        lat <- map["lat"]
    }
}
