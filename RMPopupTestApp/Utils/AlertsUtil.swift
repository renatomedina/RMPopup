//
//  AlertUtil.swift
//  RMPopupTestApp
//
//  Created by Renato Medina on 09/10/2017.
//  Copyright © 2017 Renato Medina. All rights reserved.
//

import UIKit

class AlertsUtil: NSObject {
    static let shared = AlertsUtil()
    
    func show(title:String="", message:String, action:RMAlertAction = RMAlertAction(title: "OK", type: .normal, handler: nil)) {
        
        let alert = RMAlertVC.create().config(title: title, message: message)
        alert.addAction(action)
        
        let appDelegate  = UIApplication.shared.delegate
        let viewController = appDelegate?.window??.rootViewController
        alert.show(into: viewController!)
    }
    
    func show(title:String, subtitle:String, message:String, action:RMAlertAction = RMAlertAction(title: "OK", type: .normal,handler: nil), cancelAction:RMAlertAction?) {
        
        let alert = RMSubtitleAlertVC.create().config(title: title, subtitle: subtitle, message: message)
        alert.addAction(action)
        if let cancelAction = cancelAction {
            alert.addAction(cancelAction)
        }
        
        let appDelegate  = UIApplication.shared.delegate
        let viewController = appDelegate?.window??.rootViewController
        alert.show(into: viewController!)
        
    }

    func showCheckboxAlert(title:String, message:String = "", okText:String = "OK", items:[String]) -> RMAlertCheckboxVC?  {
        let alert = RMAlertCheckboxVC.create().config(title: title, message: message, items: items, okText: okText)
        let appDelegate  = UIApplication.shared.delegate
        if let viewController = appDelegate?.window??.rootViewController {
            alert.show(into: viewController)
        }
        
        return alert
    }
    
}

