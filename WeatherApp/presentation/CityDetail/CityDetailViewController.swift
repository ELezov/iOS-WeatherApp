//
//  CityDetailViewController.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import UIKit

class CityDetailViewController: ViewController {
    
    var viewModel = CityDetailViewModel()

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        self.initActivityIndicator()
        super.viewDidLoad()
        initTableView()
        presentationModel = CityDetailPresentationModel(presenter: self)
    }

    
    func initTableView(){
        let nib = UINib(nibName: String(describing: CityWeatherItemCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: CityWeatherItemCell.self))
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke
        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = refreshControl
    }
    
    func initActivityIndicator(){
        activityIndicator.hidesWhenStopped = true;
        activityIndicator.activityIndicatorViewStyle  = UIActivityIndicatorViewStyle.gray;
        activityIndicator.center = view.center;
    }
    
    override func reloadData() {
        super.reloadData()
        refreshControl.endRefreshing()
        tableView.reloadData()
    }
}
