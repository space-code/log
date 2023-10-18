//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

/// A protocol that defines the behavior for logging messages.
public protocol IPrinter {
    /// Logs a message with a specified log level.
    ///
    /// - Parameters:
    ///   - message: The message to log.
    ///   - logLevel: The log level indicating the importance of the log message.
    func log(_ message: String, logLevel: LogLevel)
}
