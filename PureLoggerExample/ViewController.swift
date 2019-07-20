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
        Log("Simple log")
        
        let log = Log()
        log.debug("Testing debug log")
        log.info("Testing info log")
        log.warning("Testing warning log")
        log.error("Testing eror log")
//        log.error(["First item", "Second item"])
        
        let customizedLog = Log()
        customizedLog.shouldPrintDateFor = [.error]
        customizedLog.shouldPrintLevelFor = [.error]
        customizedLog.debug("Testing customized debug log")
        customizedLog.info("Testing customized info log")
        customizedLog.warning("Testing customized warning log")
        customizedLog.error("Testing customized eror log")
    }
}

