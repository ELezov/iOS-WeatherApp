//
//  CityListViewController.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class CityListViewController: ViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    lazy var searchBar:UISearchBar = UISearchBar()
    
    var viewModel = CityListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        initTableView()
        initSearchBar()
        presentationModel = CityListPresentationModel(presenter: self)
        NotificationCenter.default.addObserver(self, selector: #selector(CityListViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CityListViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func initTableView(){
        let nib = UINib(nibName: String(describing: CityListItemCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: CityListItemCell.self))
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.refreshControl = self.refreshControl;
        tableView.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func initSearchBar(){
        searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        self.navigationItem.titleView = searchBar
    }
    
    override func reloadData() {
        super.reloadData()
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardHeight = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            print(tableView.contentInset.left, tableView.contentInset.right,tableView.contentInset.top, tableView.contentInset.bottom)
            tableView.contentInset = UIEdgeInsetsMake(0, 0, keyboardHeight, 0)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.2, animations: {
            // For some reason adding inset in keyboardWillShow is animated by itself but removing is not, that's why we have to use animateWithDuration here
            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        })
    }

}

