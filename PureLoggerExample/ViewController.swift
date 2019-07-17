//
//  ViewController.swift
//  PureLoggerExample
//
//  Created by Serhii Kharauzov on 7/16/19.
//  Copyright © 2019 Lollipop. All rights reserved.
//

import UIKit
import PureLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // testing
        
        let simpleLog = Log()
        simpleLog.log("Single item")
        simpleLog.log(["First item", "Second item"])
        
        let morePowerfulLog = Log()
        morePowerfulLog.shouldPrintSystemInfo = true
        morePowerfulLog.log("Elvis Presley")
        morePowerfulLog.log(["Will", "Smith"])
    }


}

