//
//  ViewController.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 18/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var presentationModel: PresentationModel?
    
    lazy var errorScreenView: ErrorScreenView? = {
        let view: ErrorScreenView = UIView.fromNib()
        view.configure(
            title: "Упс! Что-то пошло не так",
            message: "Пожалуйста, попробуйте еще раз.",
            image: #imageLiteral(resourceName: "imgSmthWrong"))
        return view
    }()
    
    lazy var zeroScreenView: ErrorScreenView? = {
        let view: ErrorScreenView = UIView.fromNib()
        view.configure(
            title: "Ничего не найдено",
            message: "Информация по данному объекту не найдена",
            image: #imageLiteral(resourceName: "imgNotFound"))
        return view
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func reloadData(){
        
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        // function for override
        presentationModel?.reloadData()
    }

}

