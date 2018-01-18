//
//  City.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation

import ObjectMapper

public class City: Mappable {
    var zip : String?
    var country : String?
    var localizedCountryName : String?
    var city : String?
    var lon : Double?
    var ranking : Int?
    var id : Int?
    var memberCount : Int?
    var nameString : String?
    var lat : Double?
    
    required public init?(map: Map){
        
    }
    
    init() {
        
    }
    
    public func mapping(map: Map) {
        
        zip <- map["zip"]
        country <- map["country"]
        localizedCountryName <- map["localized_country_name"]
        city <- map["city"]
        lon <- map["lon"]
        ranking <- map["ranking"]
        id <- map["id"]
        memberCount <- map["member_count"]
        nameString <- map["name_string"]
        lat <- map["lat"]
    }
    
}
