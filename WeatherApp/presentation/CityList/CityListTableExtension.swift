//
//  CitiListTableDelegate.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import UIKit

extension CityListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchBar.endEditing(true)
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: Constants.Storyboard.main, bundle: nil)
        guard let vc = mainStoryBoard.instantiateViewController(withIdentifier: CityDetailViewController.id) as? CityDetailViewController else {return}
        vc.title = self.viewModel.getCity(number: indexPath.row)?.city
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension CityListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.viewModel.numberOfCities() == 0) {
            let view = self.errorScreenView
            self.tableView.backgroundView = view
            view?.frame = self.tableView.frame
            
        }
        return self.viewModel.numberOfCities()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityListItemCell.id, for: indexPath) as? CityListItemCell else {
            fatalError("PlaceTableViewXibCell doesn't exist")
        }
        cell.selectionStyle = .none
        if let city = self.viewModel.getCity(number: indexPath.row) {
            cell.configure(with: CityCellViewModel(cityName: city.city, countryName: city.country, fullName: city.nameString))
        }
        return cell
    }
    
}
