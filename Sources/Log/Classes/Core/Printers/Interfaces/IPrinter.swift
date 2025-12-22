//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

/// A protocol defining the base interface for all log output destinations.
///
/// Types conforming to `IPrinter` act as the final "sinks" for log data, responsible
/// for delivering processed log messages to specific targets like the console,
/// a persistent file, or a remote server.
public protocol IPrinter {
    /// Records a log message with a specific severity level.
    ///
    /// This is the primary entry point for a printer to receive data from the `Logger`.
    /// Implementations are responsible for the actual storage or display of the message.
    ///
    /// - Parameters:
    ///   - message: The string content to be recorded. This is typically already
    ///     formatted if the printer uses a strategy-based approach.
    ///   - logLevel: The `LogLevel` flag indicating the severity or importance of the message.
    func log(_ message: String, logLevel: LogLevel)
}
