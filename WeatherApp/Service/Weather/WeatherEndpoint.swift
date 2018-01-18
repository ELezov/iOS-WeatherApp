//
//  WeatherEndpoint.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation


import Alamofire
import Foundation

enum WeatherEndpoint{
    case getWeather(cityName: String)
}

extension WeatherEndpoint: Endpoint{
    
    internal var headers: HTTPHeaders {
        return ["" : ""]
    }
    
    internal var method: HTTPMethod {
        switch self {
        case .getWeather:
            return .get
        }
    }
    
    internal var path: String {
        switch self {
        case .getWeather:
            return Constants.OpenWeather.Endpoint.data +
            Constants.OpenWeather.version +
            Constants.OpenWeather.Endpoint.forecast
        }
    }
    
    var body: Parameters{
        var parameters: Parameters = Parameters()
        switch self {
        case .getWeather(let cityName):
            parameters[Constants.OpenWeather.Parameter.query] = cityName
            parameters[Constants.OpenWeather.Parameter.mode] = "json"
            parameters[Constants.OpenWeather.Parameter.appId] = Constants.OpenWeather.apiKey
            parameters[Constants.OpenWeather.Parameter.units] = Constants.OpenWeather.Parameter.metric
        }
        
        return parameters
    }
    
    internal var baseURL: String {
        switch self {
        case .getWeather:
            return Constants.OpenWeather.hostUrl
        }
    }
}
