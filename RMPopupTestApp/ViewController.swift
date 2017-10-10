//
//  ViewController.swift
//  RMPopupTestApp
//
//  Created by Renato Medina on 09/10/2017.
//  Copyright © 2017 Renato Medina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK: Actions
extension ViewController {
    @IBAction func checkboxAlertAction(_ sender: UIButton?) {
    
        let alert = AlertsUtil.shared.showCheckboxAlert(title: "Checkbox title", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tristique faucibus eros a porttitor.", okText: "OK", items:  ["Item 1", "Item 2"])
        alert?.delegate = self
    }
    
    @IBAction func defaultAlertAction(_ sender: UIButton?) {
        AlertsUtil.shared.show(title: "Title", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tristique faucibus eros a porttitor.", action: RMAlertAction(title: "OK", type: .normal, handler: {
            print("This is default Alert!")
        }))
    }
    
    @IBAction func subtitleAlertAction(_ sender: UIButton?) {
        AlertsUtil.shared.show(title: "Title", subtitle: "This is a subtitle", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tristique faucibus eros a porttitor.", cancelAction: RMAlertAction(title: "CANCELAR", type: .cancel, handler: {
            print("Click in subtitle cancel button")
        }))
    }
}

extension ViewController : RMAlertCheckboxVCDelegate {
    func didSelectOkAction(indexSelected:Int, item:String) {
        print("This is checkbox action with index: \(indexSelected) and title: \(item)")
    }
}
