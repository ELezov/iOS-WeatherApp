//
//  CityListViewModel.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation

class CityCellViewModel : CellViewModel {
    
    var cityName: String?
    var countryName: String?
    
    init(cityName: String?, countryName: String?) {
        super.init()
        self.cityName = cityName
        self.countryName = countryName
    }
    
  
}
