//
//  ViewController.swift
//  ProtocolExtensions
//
//  Created by Nelida Velazquez on 4/13/16.
//  Copyright © 2016 tolkiana. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BackgroundHandler {

    var observers: [NSObjectProtocol] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerBackgroundNotifications()
    }
    
    deinit {
        self.removeBackgroundNotifications()
    }
}

 