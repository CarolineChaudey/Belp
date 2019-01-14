
//
//  CharacteristicListViewController.swift
//  MyHomeApp
//
//  Created by TantePata on 15/11/2018.
//  Copyright © 2018 Digipolitan. All rights reserved.
//

import UIKit
import HomeKit

class CharacteristicListViewController: UIViewController {

    @IBOutlet var characteristicTableView: UITableView!
    var selectedService: HMService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.selectedService.name
        self.characteristicTableView.delegate = self
        self.characteristicTableView.dataSource = self
    }
}

extension CharacteristicListViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characteristic = self.selectedService.characteristics[indexPath.row]
        if var value = characteristic.value as? Int {
            value = value == 0 ? 1 : 0
            characteristic.writeValue(value) { (err) in
                self.characteristicTableView.reloadData()
            }
        }
    }
}

extension CharacteristicListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.selectedService.characteristics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let characteristic = self.selectedService.characteristics[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
    
        if characteristic.characteristicType == HMCharacteristicTypeName {
            cell.textLabel?.text = "Name \(characteristic.value)"
        }
        if characteristic.characteristicType == HMCharacteristicTypePowerState {
            cell.textLabel?.text = "Power state \(characteristic.value)"
        }
        if characteristic.characteristicType == HMCharacteristicTypeOutletInUse {
            cell.textLabel?.text = "In use \(characteristic.value)"
        }
        
        return cell
    }
}
