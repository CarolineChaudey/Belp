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
    var brightness: HMCharacteristic?


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
            testDisplay.text = "no device"
            return
        }
        let translator = Translator()
        do {
            let code = try translator.translate(text: msg)
            testDisplay.text = morseAsString(morseCode: code)
            // sendMorseToLamp(code: code)
            brightness!.writeValue(100, completionHandler: { (err) in
                print(err)
            })
        } catch {
            return
        }
    }

    func sendMorseToLamp(code: [MorseSymbol]) {
        testDisplay.text = "sendMorseToLamp"
        // in a different thread to not block the UI
        /* DispatchQueue.main.async {
            code.forEach { symbol in
                light(symbol: symbol) ? self.lightOn() : self.lightOff()
                let toWait = duration(symbol: symbol)
                sleep(UInt32(toWait))
            }
        } */
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
    func refreshDevice() {
        if device != nil {
            let services = device?.services
            let characts = services![1].characteristics
            characts.forEach { charac in
                if charac.characteristicType == HMCharacteristicTypeBrightness {
                    brightness = charac
                }
            }
        }
    }
    
    func setLightValue(val: Int) {
        testDisplay.text = "setLightValue \(val)"
        if device != nil {
            if (brightness == nil) {
                testDisplay.text = "brightness is nil"
            }
            brightness?.writeValue(val, completionHandler: { (err) in
                print(err)
            })
        }
    }
    
    func lightOn() {
        setLightValue(val: 80)
    }
    
    func lightOff() {
        setLightValue(val: 0)
    }

}

extension MainViewController : HMHomeManagerDelegate {
    
}
