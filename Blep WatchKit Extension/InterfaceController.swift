//
//  InterfaceController.swift
//  Blep WatchKit Extension
//
//  Created by Caroline Chaudey on 01/12/2018.
//  Copyright © 2018 esgi. All rights reserved.
//

import WatchKit
import WatchConnectivity
import Foundation
import UIKit

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
    }
    

    @IBOutlet var myLabel: WKInterfaceLabel!
    @IBAction func dotButton() {
    }
    @IBAction func dashButton() {
    }
    @IBAction func sendButton() {
        if WCSession.default.isReachable {
            let messageDict = ["message": "hello iPhone!"]
            
            WCSession.default.sendMessage(messageDict, replyHandler: { (replyDict) -> Void in
                print(replyDict)
            }, errorHandler: { (error) -> Void in
                print(error)
            })
        }
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
