//
//  CityListPresentationModel.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation

/**
 PresentationModel экрана с ближайшими организациями.
 */
class CityListPresentationModel: PresentationModel {
    
    //поисковая строка
    var queryString: String = ""

    var cityService: CityService?
    
    // MARK: - Инициализация
    
    init(presenter: ViewController?) {
        super.init()
        self.presenter = presenter
        cityService = CityService()
        self.reloadData()
    }
    
    override func reloadData() {
        cityService?.getCityList(query: queryString){ (cities) -> Void in
            if let cityList = cities {
                for item in cityList {
                    print(item.city)
                }
                guard let presenter = self.presenter as? CityListViewController else {return}
                presenter.reloadData(cities: cityList)
            }
        }
    }
    
}
