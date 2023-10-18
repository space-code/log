//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

/// A protocol that defines the behavior of a logging printer strategy
public protocol IPrinterStrategy {
    /// An array of log formatters to customize log message output.
    var formatters: [ILogFormatter] { get }

    /// Logs a message with a specified log level.
    ///
    /// - Parameters:
    ///   - message: A `String` value that contains the message to dispatch.
    ///   - logLevel: A `LogLevel` value that contains the logging level.
    func log(_ message: String, logLevel: LogLevel)
}
