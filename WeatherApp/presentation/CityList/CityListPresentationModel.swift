//
//  CityListPresentationModel.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import UIKit

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
        cityService?.getCityList(query: queryString){ [weak self] (cities, error) -> Void in
            guard let strongSelf = self else { return }
            guard let presenter = strongSelf.presenter as? CityListViewController else {return}
            if error != nil {
                strongSelf.showError()
            }
            
            if let cityList = cities {
                strongSelf.hideError()
                presenter.viewModel.cityList = cityList
                presenter.reloadData()
            } else {
                presenter.reloadData()
                strongSelf.showError()
            }
        }
    }
    
    
    override func showError(){
        guard let presenter = self.presenter as? CityListViewController else {return}
        let view: ErrorScreenView = UIView.fromNib()
        view.configure(
                title: "Упс! Что-то пошло не так",
                message: "Пожалуйста, попробуйте еще раз.",
                image: #imageLiteral(resourceName: "imgSmthWrong"))
        if let tableView = presenter.tableView {
            tableView.backgroundView = view
            view.frame = tableView.frame
        }
    }
    
    override func hideError() {
        guard let presenter = self.presenter as? CityListViewController else {return}
        if let tableView = presenter.tableView {
            tableView.backgroundView = nil
        }
    }
    
}
