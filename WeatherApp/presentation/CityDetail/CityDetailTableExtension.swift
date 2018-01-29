//
//  CityDetailTableExtension.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import UIKit


extension CityDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func getHeaderForSection(title: String) -> UIView {
        let frame = CGRect(x: 0, y: 0, width: self.tableView.frame.size.width,height: 30)
        let header = UIView(frame:frame)
        header.backgroundColor = UIColor.FlatColor.Gray.Iron
        let label = UILabel(frame: frame)
        label.textAlignment = NSTextAlignment.center
        label.text = title
        label.textColor = UIColor.black
        header.addSubview(label)
        return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfCities()/self.viewModel.numberOfSections()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityWeatherItemCell.id, for: indexPath) as? CityWeatherItemCell else {
            fatalError("PlaceTableViewXibCell doesn't exist")
        }
        cell.selectionStyle = .none
        let index = indexPath.section*8 + indexPath.row
        if let viewModel = self.viewModel.getWeather(number: index) {
            cell.configure(with: viewModel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let day = section + 1;
        let headerTitle =  "\(day) day"
        return getHeaderForSection(title: headerTitle)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section%2 == 0 {
            return 30
        } else {
            return 0
        }
    }
    

    
    
}
