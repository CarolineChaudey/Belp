//
//  ServiceListViewController.swift
//  Blep
//
//  Created by Herve on 25/10/2018.
//

import UIKit
import HomeKit

class ServiceListViewController: UIViewController {

    @IBOutlet var serviceTableView: UITableView!
    var selectedAccessory: HMAccessory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedAccessory.name
        self.serviceTableView.delegate = self
        self.serviceTableView.dataSource = self
    }
}

extension ServiceListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characteristicViewController = CharacteristicListViewController()
        characteristicViewController.selectedService = self.selectedAccessory.services[indexPath.row]
        self.navigationController?.pushViewController(characteristicViewController, animated: true)
    }
    
}

extension ServiceListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedAccessory.services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let service = self.selectedAccessory.services[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "\(service.name) -- \(service.serviceType)"
        return cell
    }
}
