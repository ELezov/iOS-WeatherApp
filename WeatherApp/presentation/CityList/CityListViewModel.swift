//
//  CityListViewModel.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import UIKit


class  CityListViewModel: ListViewModel {
    
    //MARK: - Свойства
    
    var cityList: [City]?
    var queryString: String = ""
    
    override func numberOfCities() -> Int {
        if let count = cityList?.count {
            return count
        } else {
            return 0
        }
    }
    
    func getCity(number: Int) -> City? {
        return cityList?[number]
    }
    
}
