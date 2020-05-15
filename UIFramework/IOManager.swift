//
//  IOManager.swift
//  UIFramework
//
//  Created by Ilya Latugovskii on 13.05.2020.
//  Copyright © 2020 Ilya Latugovskii. All rights reserved.
//

import Foundation
import UIKit

private enum ButtonState: String {
    case edit = "Edit"
    case done = "Done"
    var opposite: ButtonState {
        switch self {
        case .edit:
            return .done
        case .done:
            return .edit
        }
    }
}

public class IOManager {
    
    public static var shared = IOManager()
    private var stateButton: ButtonState = .edit
    private var tableView: UITableView?
    private init() {}
    
    // MARK:- User Interaction
    
    public func getReadyCurrencyViewController<T: UITableViewDelegate & UITableViewDataSource & UIViewController>(fromRootVC vc: T, fromMainScreen frame: CGRect) -> UINavigationController {
        vc.view.frame = frame
        vc.view.backgroundColor = .white
        
        tableView = getTableView(mainFrame: frame)
        vc.view.addSubview(tableView!)
        tableView!.delegate = vc
        tableView!.dataSource = vc

        let navVC = UINavigationController(rootViewController: vc)
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: stateButton.rawValue, style: .plain, target: self, action: #selector(clickEditButton(sender: )))
        
        return navVC
    }
    
    public func getTableViewCell(curName: String, curOfficialRate: Double) -> UITableViewCell {
        guard let tableView = tableView else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell") as! CurrencyTableViewCell
        cell.configCell(fromNameCurrency: curName, fromValueCurrency: curOfficialRate)
        return cell
    }
    
    public func reloadTableView() {
        tableView?.reloadData()
    }
    
    //MARK: - Supporting private methods
    
    @objc private func clickEditButton(sender: UIBarButtonItem) {
        guard let tableView = tableView else { return }
        tableView.isEditing = !tableView.isEditing
        stateButton = stateButton.opposite
        sender.title = stateButton.rawValue
    }
    
    private func getTableView(mainFrame: CGRect) -> UITableView {
        let mainView = CurrencyTableView(frame: mainFrame)
        return mainView.tableView
    }
    
}
