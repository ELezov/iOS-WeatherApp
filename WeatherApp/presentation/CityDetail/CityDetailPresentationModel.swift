//
//  CityDetailPresentationModel.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation

class CityDetailPresentationModel: PresentationModel {
    
    var weatherService: WeatherService?
    
    // MARK: - Инициализация
    
    init(presenter: ViewController?) {
        super.init()
        self.presenter = presenter
        weatherService = WeatherService()
        self.reloadData()
    }
    
    override func reloadData() {
        guard let presenter = self.presenter as? CityDetailViewController else {return}
        guard let title = presenter.title else {return}
        weatherService?.getWeather(cityName: title) { (weather) -> Void in
            if let weather = weather {
                if let lists = weather.list {
                    var weathersViewModel = [CityWeatherCellViewModel]()
                    for list in lists{
                        var weatherViewModel = CityWeatherCellViewModel(list: list)
                        weathersViewModel.append(weatherViewModel)
                    }
                    presenter.viewModel.weathers = weathersViewModel
                    presenter.reloadData()
                }
            }
        }
    }
    
}
