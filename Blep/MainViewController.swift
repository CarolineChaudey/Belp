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
    @IBOutlet weak var testDisplay: UILabel!
    @IBOutlet weak var message: UITextField!


    @IBAction func configureHome(_ sender: UIButton){
        let selectHomeVC = SelectHomeViewController()
        selectHomeVC.mainView = self
        self.navigationController?.pushViewController(selectHomeVC, animated: true)
    }
    
    @IBAction func convertMessage(_ sender: Any) {
        guard let msg = message.text else {
            return
        }
        let translator = Translator()
        do {
            let code = try translator.translate(text: msg)
            testDisplay.text = morseAsString(morseCode: code)
        } catch {
            return
        }
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
            let services = device?.services
            let characts = services![1].characteristics
            characts.forEach { charac in
                if charac.characteristicType == HMCharacteristicTypeBrightness {
                    testDisplay.text = "brightness"
                    // brightness to 80%
                    charac.writeValue(80, completionHandler: { (err) in
                        print(err)
                    })
                }
            }
        }
    }

}

extension MainViewController : HMHomeManagerDelegate {
    
}
