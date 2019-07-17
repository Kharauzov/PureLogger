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
    
    ///
    public var isURLEnabled = true
    /// If value is `true`, logger prints extra info like file name, line number, etc.
    ///
    /// Default value is `false`.
    public var shouldPrintSystemInfo = false
    /// Determines format of printing time for each of the logs.
    ///
    /// Default value is `yyyy-MM-dd HH:mm:ss`
    public var dateFormat = "yyyy-MM-dd HH:mm:ss" {
        didSet {
            dateFormatter.dateFormat = dateFormat
        }
    }
    /// Provide description
    public var separator: String = " "
    /// Provide description
    public var terminator: String = "\n"
    
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
    public func log(_ item: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        print(item, filename: filename, line: line, column: column, funcName: funcName)
    }
    
    public func error(_ item: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        print(item, filename: filename, line: line, column: column, funcName: funcName)
    }
    
    public func url(_ item: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        print(item, filename: filename, line: line, column: column, funcName: funcName)
    }
    
    // MARK: Private methods
    
    private func getDateDescription() -> String {
        return dateFormatter.string(from: Date())
    }

    private func getSourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.last ?? ""
    }
    
    private func getFormattedItem(_ item: Any, filename: String, line: Int, column: Int, funcName: String) -> String {
        var stringToPrint = "\(getDateDescription())"
        if shouldPrintSystemInfo {
            stringToPrint.append(" [\(getSourceFileName(filePath: filename))]:\(line) \(funcName) ->")
        }
        stringToPrint.append(" \(item)")
        return stringToPrint
    }
}

extension Log {
    func print(_ item: Any, filename: String, line: Int, column: Int, funcName: String) {
        #if DEBUG || STAGING
        if let items = item as? [Any] {
            items.forEach {
                Swift.print(getFormattedItem($0, filename: filename, line: line, column: column, funcName: funcName), separator: separator, terminator: terminator)
            }
        } else {
            Swift.print(getFormattedItem(item, filename: filename, line: line, column: column, funcName: funcName))
        }
        #endif
    }
}
