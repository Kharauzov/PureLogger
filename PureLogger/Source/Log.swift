//
//  Log.swift
//  PureLogger
//
//  Created by Mikhail Panfilov on 7/15/19.
//  Copyright © 2019 PureLogger. All rights reserved.
//

import Foundation

/// Maybe the best logger in the world :P
public class Log {
    
    public var isURLEnabled = true
    
    public init(isURLEnabled: Bool = true) {
        self.isURLEnabled = isURLEnabled
    }
    
    /// To be able to print anything shortly
    @discardableResult
    public convenience init(_ items: Any) {
        self.init()
        log(items)
    }
    
    // MARK: Log
    
    /// Simple log, like print
    public func log(_ item: Any) {
        print(item)
    }
    
    // MARK: Error
    
    public func error(_ item: Any) {
        print(item)
    }
    
    // MARK: URL
    
    public func url(_ item: Any) {
        guard isURLEnabled else { return }
        print(item)
    }
}

extension Log {
    func print(_ item: Any, separator: String = " ", terminator: String = "\n") {
        #if DEBUG || STAGING
        if let items = item as? [Any] {
            items.forEach {
                Swift.print($0, separator: separator, terminator: terminator)
            }
        } else {
            Swift.print(item)
        }
        #endif
    }
}
