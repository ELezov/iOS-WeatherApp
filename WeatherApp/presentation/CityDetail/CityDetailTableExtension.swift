//
//  CityDetailTableExtension.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import UIKit


extension CityDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCities()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityWeatherItemCell.id, for: indexPath) as? CityWeatherItemCell else {
            fatalError("PlaceTableViewXibCell doesn't exist")
        }
        cell.selectionStyle = .none
        if let viewModel = self.viewModel.getWeather(number: indexPath.row) {
            cell.configure(with: viewModel)
        }
        return cell
    }
    
}
