//
//  BackgoundHandler.swift
//  ProtocolExtensions
//
//  Created by Nelida Velazquez on 4/13/16.
//  Copyright © 2016 tolkiana. All rights reserved.
//

import UIKit

protocol BackgroundHandler: class {
    var observers: [NSObjectProtocol] { get set}
    
    func registerBackgroundNotifications()
    func removeBackgroundNotifications()
    
    func appMovedToBackground(notification: NSNotification)
    func appMovedToForeground(notification: NSNotification)
}

extension BackgroundHandler where Self: UIViewController {
    
    func registerBackgroundNotifications() {
        
        let foregroundObserver = NSNotificationCenter.defaultCenter().addObserverForName(
            UIApplicationDidBecomeActiveNotification,
            object: nil,
            queue: nil) { [unowned self] notification in
                self.appMovedToForeground(notification)
        }
        let backgroundObserver = NSNotificationCenter.defaultCenter().addObserverForName(
            UIApplicationWillResignActiveNotification,
            object: nil,
            queue: nil) { [unowned self] notification in
                self.appMovedToBackground(notification)
        }
        
        self.observers.append(foregroundObserver)
        self.observers.append(backgroundObserver)
    }

    func removeBackgroundNotifications() {
        for observer in self.observers {
            NSNotificationCenter.defaultCenter().removeObserver(observer)
        }
        self.observers.removeAll()
    }
    
    func appMovedToBackground(notification: NSNotification) {
        print("Do something generic")
    }
    
    func appMovedToForeground(notification: NSNotification) {
        print("Do something generic here too")
    }
}
