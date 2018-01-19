//
//  UIView+LoadFromNib.swift
//  WeatherApp
//
//  Created by KODE-i7-1 on 19/01/2018.
//  Copyright © 2018 KODE-i7-1. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    
    ///  Метод для загрузки view из nib файла.
    ///
    ///  - returns: загруженная view с провешенными properties
    class func loadFromNib() -> Self? {
        
        let selfClass: AnyClass = self as AnyClass
        var className: String? = NSStringFromClass(selfClass)
        let bundle = Bundle(for: selfClass)
        
        if (bundle.path(forResource: className, ofType: "nib") == nil) {
            className = (className! as NSString).pathExtension
            if (bundle.path(forResource: className, ofType: "nib") == nil) {
                return nil
            }
        }
        
        
        return view(bundle, className: className!)
    }
    
    private class func view<T>(_ bundle: Bundle, className: String) -> T? {
        
        let nibContents = bundle.loadNibNamed(className, owner: nil, options: nil)
        
        var view: UIView?
        
        for obj in nibContents! {
            if (obj as AnyObject).isKind(of: self) {
                view = obj as? UIView
                break
            }
        }
        
        return view as? T
    }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
