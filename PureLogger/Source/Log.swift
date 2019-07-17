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
    
    // MARK: Public properties
    
    public var isURLEnabled = true
    public var dateFormat = "yyyy-MM-dd HH:mm:ss" {
        didSet {
            dateFormatter.dateFormat = dateFormat
        }
    }
    
    // MARK: Private properties
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    // MARK: Public methods
    
    public init(isURLEnabled: Bool = true) {
        self.isURLEnabled = isURLEnabled
    }
    
    /// To be able to print anything shortly
    @discardableResult
    public convenience init(_ items: Any) {
        self.init()
        log(items)
    }
    
    /// Simple log, like print
    public func log(_ item: Any) {
        print(item)
    }
    
    public func error(_ item: Any) {
        print(item)
    }
    
    public func url(_ item: Any) {
        guard isURLEnabled else { return }
        print(item)
    }
    
    // MARK: Private methods
    
    private func getDateDescription() -> String {
        return dateFormatter.string(from: Date())
    }
    
    private func getFormattedItem(_ item: Any) -> String {
        return "\(getDateDescription()) \(item)"
    }
}

extension Log {
    func print(_ item: Any, separator: String = " ", terminator: String = "\n") {
        #if DEBUG || STAGING
        if let items = item as? [Any] {
            items.forEach {
                Swift.print(getFormattedItem($0), separator: separator, terminator: terminator)
            }
        } else {
            Swift.print(getFormattedItem(item))
        }
        #endif
    }
}
