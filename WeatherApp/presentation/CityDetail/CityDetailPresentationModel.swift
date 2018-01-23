//
//  CityDetailPresentationModel.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import UIKit

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
        weatherService?.getWeather(cityName: title) { (weather, error) -> Void in
            if let error = error {
                self.showError(error: error)
            } else {
                if let weather = weather,
                    let lists = weather.list,
                      lists.count > 0 {
                        self.hideError()
                        var weathersViewModel = [CityWeatherCellViewModel]()
                        for list in lists{
                            let weatherViewModel = CityWeatherCellViewModel(list: list)
                            weathersViewModel.append(weatherViewModel)
                        }
                        presenter.viewModel.weathers = weathersViewModel
                } else {
                    self.showError(error: nil)
                }
            }
            presenter.reloadData()
        }
    }
    
    override func showError(error: Error?) {
        super.showError(error: error)
        guard let presenter = self.presenter as? CityDetailViewController else {return}
        var errorView: UIView?
        if error != nil {
            errorView = presenter.errorScreenView
        } else {
            errorView = presenter.zeroScreenView
        }
        if let tableView = presenter.tableView {
            tableView.backgroundView = errorView
            errorView?.frame = tableView.frame
        }
       
    }
    
    
    override func hideError() {
        guard let presenter = self.presenter as? CityDetailViewController else {return}
        if let tableView = presenter.tableView {
            tableView.backgroundView = nil
        }
    }
    
}
