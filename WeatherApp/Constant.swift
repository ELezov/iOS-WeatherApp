//
//  Constant.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation

enum Constants {
    enum  MeetupApi {
        static let hostUrl = "https://api.meetup.com"
        static let version = "/2"
        
        enum Endpoint {
            static let city = "/cities"
        }
        
        enum Parameter {
            static let query = "query"
        }
    }
    
    enum OpenWeather {
        static let hostUrl = "https://api.openweathermap.org"
        static let version = "/2.5"
        static let apiKey = "4264c8b0b687a575351fefb6562585e0"
        
        enum Endpoint {
            static let data = "/data"
            static let forecast = "/forecast"
        }
        
        enum Parameter {
            static let query = "q"
            static let mode = "mode"
            static let appId = "appid"
            static let units = "units"
            static let metric = "metric"
        }
        
        enum Icon {
            static let url = "https://openweathermap.org/img/w/"
        }
    }
    
    enum Storyboard {
        static let main = "Main"
    }
}
