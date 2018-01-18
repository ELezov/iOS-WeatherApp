//
//  CityDetailCellViewModel.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation

class CityWeatherCellViewModel: CellViewModel {
    var dateString: String?
    var weatherDescription: String?
    var temp: Double?
    var pressure: Double?
    var icon: String?
    
    init(list: List) {
        super.init()
       
        if let dt = list.dtTxt {
            self.dateString = dt
        }
        
        if let main = list.main,
            let temp = main.temp,
            let pressure = main.pressure {
            self.temp = temp
            self.pressure = pressure
        }
        
        if let weathers = list.weather,
            let weather = weathers.first,
            let description = weather.description,
            let icon = weather.icon
        {
            
            self.weatherDescription = description
            self.icon = icon
        }
    }
}
