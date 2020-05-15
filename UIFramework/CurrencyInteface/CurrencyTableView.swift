//
//  CurrencyTableView.swift
//  UIFramework
//
//  Created by Ilya Latugovskii on 13.05.2020.
//  Copyright © 2020 Ilya Latugovskii. All rights reserved.
//

import UIKit

class CurrencyTableView: UIView {
    
    @IBOutlet private weak var currencyTableView: UITableView!
    
    public var tableView: UITableView {
        return currencyTableView
    }
    
    private let nibName = "CurrencyTableView"
    private var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    private func setUpView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibName, bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil).first as! UITableView
        contentView.frame = bounds
        
        currencyTableView.register(UINib(nibName: "CurrencyTableViewCell", bundle: Bundle(for: type(of: self))), forCellReuseIdentifier: "CurrencyTableViewCell")
        addSubview(contentView)
    }

}
