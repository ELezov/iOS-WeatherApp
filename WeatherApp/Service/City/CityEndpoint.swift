//
//  CityService.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Alamofire
import Foundation

enum CityEndpoint{
    case getCities(query: String)
}

extension CityEndpoint: Endpoint{
    
    internal var headers: HTTPHeaders {
        return ["" : ""]
    }
    
    internal var method: HTTPMethod {
        switch self {
        case .getCities:
            return .get
        }
    }
    
    internal var path: String {
        switch self {
        case .getCities:
            return Constants.MeetupApi.version + Constants.MeetupApi.Endpoint.city
        }
    }
    
    var body: Parameters{
        var parameters: Parameters = Parameters()
        switch self {
        case .getCities(let query): 
            parameters[Constants.MeetupApi.Parameter.query] = query
        }
        
        return parameters
    }
    
    internal var baseURL: String {
        switch self {
        case .getCities:
            return Constants.MeetupApi.hostUrl
        }
    }
}
