//
//  RMAlertSubtitleVIewController.swift
//  CieloApp
//
//  Created by Renato Medina on 27/07/17.
//  Copyright © 2017 Renato Medina. All rights reserved.
//

import UIKit

class RMSubtitleAlertVC: RMAlertVC {
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    private var subtitle: String = ""
    
    override class func create() -> RMSubtitleAlertVC{
        
        let alertStoryboard = UIStoryboard(name: "RMAlert", bundle: nil)
        let alertVC = alertStoryboard.instantiateViewController(withIdentifier: "RMSubtitleAlertVC") as? RMSubtitleAlertVC
        return alertVC ?? RMSubtitleAlertVC()
    }
    
    func config(title: String, subtitle: String, message: String, animationType: RMAlertAnimationType = .none) -> RMSubtitleAlertVC {
        
        _ = super.config(title: title, message: message, animationType: animationType)
        self.subtitle = subtitle
        return self
    }
    
    override func configUI(){
        super.configUI()
        self.subtitleLabel.text = subtitle
    }
}
