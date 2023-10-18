//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation
import OSLog

/// A protocol for writing log messages to the Apple OSLog system.
public protocol IOSWriter {
    /// Writes a log message to the specified OSLog.
    ///
    /// - Parameters:
    ///   - message: A StaticString containing the log message format.
    ///   - log: An OSLog object representing the log subsystem and category.
    ///   - type: An OSLogType indicating the log message type.
    ///   - args: A variadic list of CVarArg values to fill in the message format.
    func log(_ message: StaticString, log: OSLog, type: OSLogType, _ args: CVarArg...)
}
