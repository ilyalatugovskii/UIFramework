//
//  TableViewCell.swift
//  UIFramework
//
//  Created by Ilya Latugovskii on 14.05.2020.
//  Copyright © 2020 Ilya Latugovskii. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    func configCell(fromNameCurrency name: String, fromValueCurrency value: Double) {
        titleLabel.text = name
        detailLabel.text = String(value)
    }
    
}

