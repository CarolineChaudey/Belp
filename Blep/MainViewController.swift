//
//  MainViewController.swift
//  Blep
//
//  Created by Caroline Chaudey on 01/12/2018.
//  Copyright © 2018 esgi. All rights reserved.
//

import UIKit
import HomeKit

class MainViewController: UIViewController {

    var homeManager : HMHomeManager?
    var device : HMAccessory?
    @IBOutlet weak var deviceDisplay: UILabel!
    
    @IBAction func configureHome(_ sender: UIButton){
        let selectHomeVC = SelectHomeViewController()
        selectHomeVC.mainView = self
        self.navigationController?.pushViewController(selectHomeVC, animated: true)
    }
    
    @IBAction func vibrate(_ sender: UIButton) {
        //WKInterfaceDevice.currentDevice().playHaptic(.Click)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let homeManager = HMHomeManager()
        homeManager.delegate = self
        self.homeManager = homeManager
    }
    
    // just to verify
    func refreshDeviceDisplay() {
        if device != nil {
            deviceDisplay.text = device?.category.categoryType
        }
    }

}

extension MainViewController : HMHomeManagerDelegate {
    
}
