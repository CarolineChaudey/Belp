//
//  AccessoryListViewController.swift
//  MyHomeApp
//
//  Created by TantePata on 15/11/2018.
//  Copyright © 2018 Digipolitan. All rights reserved.
//

import UIKit
import HomeKit

class AccessoryListViewController: UIViewController {
    
    @IBOutlet var accessoryTableView: UITableView!
    var selectedHome: HMHome!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.selectedHome.name
        self.accessoryTableView.delegate = self
        self.accessoryTableView.dataSource = self
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(searchNewAccessories))
    }
    
    @objc func searchNewAccessories() {
        let browserController = AccessoryBrowserViewController()
        browserController.selectedHome = self.selectedHome
        self.navigationController?.pushViewController(browserController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.accessoryTableView.reloadData()
    }
}

extension AccessoryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let serviceListController = ServiceListViewController()
        serviceListController.selectedAccessory = self.selectedHome.accessories[indexPath.row]
        self.navigationController?.pushViewController(serviceListController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let acc = self.selectedHome.accessories[indexPath.row]
            self.selectedHome.removeAccessory(acc) { (err) in
                if err == nil {
                    self.accessoryTableView.reloadData()
                }
            }
        }
    }
    
}

extension AccessoryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedHome.accessories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = self.selectedHome.accessories[indexPath.row].name
        return cell
    }
}
