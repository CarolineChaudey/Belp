//
//  ExtensionDelegate.swift
//  Blep WatchKit Extension
//
//  Created by Caroline Chaudey on 01/12/2018.
//  Copyright © 2018 esgi. All rights reserved.
//

import WatchKit
import WatchConnectivity

class ExtensionDelegate: NSObject, WKExtensionDelegate, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        
    }
    
    func applicationDidFinishLaunching() {
        // Perform any final initialization of your application.
    }

    func applicationDidBecomeActive() {
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }


}
