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
    var hometest : HMHome?
    var device : HMAccessory?
    @IBOutlet var deviceDisplay: UILabel!
    @IBOutlet var morseDisplay: UILabel!
    @IBOutlet var message: UITextField!
    var brightness: HMCharacteristic?
    
    @IBOutlet var testDisplay: UILabel!
    
    @IBAction func configureHome(_ sender: UIButton){
        let selectHomeVC = SelectHomeViewController()
        selectHomeVC.mainView = self
        self.navigationController?.pushViewController(selectHomeVC, animated: true)
    }
    
    @IBAction func convertMessage(_ sender: Any) {
        guard let msg = message.text else {
            return
        }
        if (device == nil) {
            deviceDisplay.text = "no device"
            morseDisplay.text = "no device"
            return
        }
        let translator = Translator()
        do {
            let code = try translator.translate(text: msg)
            morseDisplay.text = morseAsString(morseCode: code)
            sendMorseToLamp(code: code)
            //changeBrightness(val:55)
        } catch {
            return
        }
    }

    func sendMorseToLamp(code: [MorseSymbol]) {
        //morseDisplay.text = "sendMorseToLamp"
        // in a different thread to not block the UI
        DispatchQueue.main.async {
            self.lightOn()
            code.forEach { symbol in
                light(symbol: symbol) ? self.lightOn() : self.lightOff()
                let toWait = duration(symbol: symbol)
                sleep(UInt32(toWait))
            }
            self.lightOff()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let homeManager = HMHomeManager()
        homeManager.delegate = self
        self.homeManager = homeManager
    }
    
    func changeBrightness(val: Int=30) {
        hometest?.accessories.forEach{ acce in
            if acce.uniqueIdentifier == device?.uniqueIdentifier {
                deviceDisplay.text = acce.name
                let services = acce.services
                let characts = services[1].characteristics
                characts.forEach { charac in
                    if charac.characteristicType == HMCharacteristicTypeBrightness {
                        charac.writeValue(val, completionHandler: { (err) in
                            print(err)
                        })
                    }
                }
            }
        }
    }
    
    func lightOn() {
        changeBrightness(val: 80)
    }
    
    func lightOff() {
        changeBrightness(val: 0)
    }

}

extension MainViewController : HMHomeManagerDelegate {
    
}
