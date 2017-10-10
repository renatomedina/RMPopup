//
//  RMAlertCheckboxVC.swift
//
//  Created by Renato Medina on 27/07/17.
//  Copyright © 2017 Renato Medina. All rights reserved.
//

import UIKit

protocol RMAlertCheckboxVCDelegate : class {
    func didSelectOkAction(indexSelected:Int, item:String)
}

class RMAlertCheckboxVC: RMAlertVC {
    
    var items:[String] = []
    
    @IBOutlet weak var tbView: UITableView!
    @IBOutlet weak var alertHeight: NSLayoutConstraint!
    
    var indexSelected = -1
    weak var delegate: RMAlertCheckboxVCDelegate?
    
    override class func create() -> RMAlertCheckboxVC{
        
        let alertStoryboard = UIStoryboard(name: "RMAlert", bundle: nil)
        let alertVC = alertStoryboard.instantiateViewController(withIdentifier: "RMAlertCheckboxVC") as? RMAlertCheckboxVC
        return alertVC ?? RMAlertCheckboxVC()
    }
    
    func config(title: String, message: String, items:[String], okText:String = "OK", animationType: RMAlertAnimationType = .none) -> RMAlertCheckboxVC {
        
        _ = super.config(title: title, message: message, animationType: animationType)
        
        self.items = items
        self.addAction(RMAlertAction(title: okText, type: .normal, handler: {
            if (self.indexSelected >= 0) {
                self.delegate?.didSelectOkAction(indexSelected: self.indexSelected, item: items[self.indexSelected])
            }
        }))
        self.addAction(RMAlertAction(title: "CANCELAR", type: .cancel, handler: nil))
        return self
    }
    
    override func configUI(){
        super.configUI()
        self.adjustHeight()
        
        //SelectFirstIndex
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView(tbView, didSelectRowAt: indexPath)
    }
    
    fileprivate func adjustHeight() {
        let count = items.count >= 5 ? 5 : items.count
        let height = (RMAlertCheckboxCell.height() * CGFloat(count)) + 30
        alertHeight.constant = height
        tbView.isScrollEnabled =  items.count > 5
    }
}

extension RMAlertCheckboxVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RMAlertCheckboxCell.height()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.descelectAllCells(tableView: tableView)
        
        let tableViewCell = tableView.cellForRow(at: indexPath)
        if let menuTitleCell = tableViewCell as? RMAlertCheckboxCell {
            menuTitleCell.toogleSelected()
            indexSelected = indexPath.row
        }
    }
}

extension RMAlertCheckboxVC: UITableViewDataSource {
    
    func descelectAllCells(tableView:UITableView) {
        for visibleCells in tableView.visibleCells {
            if let cell = visibleCells as? RMAlertCheckboxCell {
                cell.setIsSelected(isSelected: false)
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? RMAlertCheckboxCell {
            cell.setIsSelected(isSelected: indexPath.row == indexSelected)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RMAlertCheckboxCell") as! RMAlertCheckboxCell
        let item = self.items[indexPath.row]
        cell.setup(text: item)
//        self.descelectAllCells(tableView: tableView)
//        
//        if indexPath.row == indexSelected {
//            cell.setIsSelected(isSelected: true)
//        }
        
        return cell
    }
}
