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
    ///   - type: An OSLogType indicating the log message type.
    ///   - message: A variadic list of String values to fill in the message format.
    func log(type: OSLogType, _ message: String)
}
