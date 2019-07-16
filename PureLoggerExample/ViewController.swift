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
        
        let log = Log()
        log.log("Single item")
        log.log(["First item", "Second item"])
    }


}

