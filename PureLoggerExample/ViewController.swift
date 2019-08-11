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
        log.shouldPrintSystemInfoFor = []
        log.debug("Testing debug log")
        log.info("Testing info log")
        log.warning("Testing warning log")
        log.error("Testing eror log")
        
        log.error(["First item", "Second item"])
        
        /*
        let customizedLog = Log()
        customizedLog.shouldPrintDateFor = [.error]
        customizedLog.shouldPrintLevelFor = [.error]
        customizedLog.levelEmojis = [.info: "💻"]
        customizedLog.debug("Testing customized debug log")
        customizedLog.info("Here is custom emoji for info")
        customizedLog.warning("Testing customized warning log")
        customizedLog.error("Testing customized eror log")
         */
        
        Log.shared.shouldPrintEmojiFor = []
        Log.shared.shouldPrintSystemInfoFor = []
        Log.shared.debug("First print from singleton")
        Log.shared.shouldPrintEmojiFor = Log.Level.allCases
        Log.shared.shouldPrintSystemInfoFor = Log.Level.allCases
        Log.shared.debug("Second print from singleton")
    }
}

