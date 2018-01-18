//
//  CityDetailViewModel.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation

class CityDetailViewModel: ListViewModel {
    var title : String = ""
    var weathers : [CityWeatherCellViewModel]?
    
    override func numberOfCities() -> Int {
        if let count = weathers?.count {
            return count
        } else {
            return 0
        }
    }
    
    func getWeather(number: Int) -> CityWeatherCellViewModel? {
        return weathers?[number]
    }
}
