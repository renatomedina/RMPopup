//
//  RMAlertCheckboxCellTableViewCell.swift
//  CieloApp
//
//  Created by Renato Medina on 28/07/17.
//  Copyright © 2017 Renato Medina. All rights reserved.
//

import UIKit

class RMAlertCheckboxCell: UITableViewCell  {

    @IBOutlet weak var btnCheckbox: UIButton!
    @IBOutlet weak var lblText: UILabel!
    
    var selectedState = false
    
    static func height() -> CGFloat {
        return 40
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func toogleSelected() {
        self.setIsSelected(isSelected: !self.selectedState)
    }

    func setIsSelected(isSelected:Bool) {
        self.selectedState = isSelected
        btnCheckbox.isSelected = self.selectedState
    }
}

extension RMAlertCheckboxCell {
    func setup(text:String) {
        lblText.text = text
    }
}
