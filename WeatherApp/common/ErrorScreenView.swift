//
//  WalletsZeroScreenView.swift
//  Plazius
//
//  Created by Sergey Germanovich on 01.11.16.
//  Copyright © 2016 RedMadRobot. All rights reserved.
//

import UIKit


class ErrorScreenView: UIView {
    
    // MARK: - Typealias
    
    typealias ZeroButtonActionBlock = (() -> Void)
    
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    
    
    
    // MARK: - Properties
    
    var actionButtonBlock: ZeroButtonActionBlock?
    
    
    
    // MARK: - Initializers
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure(title: "", message: "")
    }
    
    
    
    // MARK: - Public methods
    
    func configure(title: String?,
                   message: String?,
                   image: UIImage? = nil,
                   buttonTitle: String? = nil,
                   buttonActionBlock: ZeroButtonActionBlock? = nil) {
        
        actionButton.isHidden = buttonActionBlock == nil
        actionButton.isEnabled = buttonActionBlock != nil
        actionButtonBlock = buttonActionBlock
        
        titleLabel.text = title
        titleLabel.textColor = UIColor.gray
        
        messageLabel.text = message
        messageLabel.textColor = UIColor.gray
        
        actionButton.setTitle(buttonTitle ?? "Обновить", for: .normal)
        
        if let image = image {
            imageView.image = image
            setNeedsLayout()
        }
    }
    
    
    
    // MARK: - IBAction
    
    @IBAction func actionButtonTapped(_ sender: Any) {
        
//        actionButton.isEnabled = false // TODO: придумать как обнвить состояние кнопки, после завершения запроса
        actionButtonBlock?()
    }
    
}
