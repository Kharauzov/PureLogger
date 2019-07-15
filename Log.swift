//
//  Log.swift
//  PureLogger
//
//  Created by Mikhail Panfilov on 7/15/19.
//  Copyright © 2019 PureLogger. All rights reserved.
//

import Foundation

class Log {
    
    var isURLEnabled = true
    
    init(isURLEnabled: Bool = true) {
        self.isURLEnabled = isURLEnabled
    }
    
    /// To be able to print anything shortly
    @discardableResult
    convenience init(_ items: Any) {
        self.init()
        log(items)
    }
    
    // MARK: Log
    
    /// Simple log, like print
    func log(_ items: Any) {
        print(items)
    }
    
    func log(_ items: Any...) {
        print(items)
    }
    
    // MARK: Error
    
    func error(_ items: Any) {
        print(items)
    }
    
    func error(_ items: Any...) {
        print(items)
    }
    
    // MARK: URL
    
    func url(_ items: Any) {
        guard isURLEnabled else { return }
        print(items)
    }
    
    func url(_ items: Any...) {
        guard isURLEnabled else { return }
        print(items)
    }
}

extension Log {
    func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        #if DEBUG
        items.forEach {
            Swift.print($0, separator: separator, terminator: terminator)
        }
        #endif
    }
}
