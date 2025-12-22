//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import OSLog

/// A protocol defining the interface for objects that write log messages to Apple's Unified Logging System.
///
/// Types conforming to `IOSWriter` provide a standardized way to route log strings into `OSLog`,
/// allowing for consistent categorization and severity filtering across the application.
public protocol IOSWriter {
    /// Writes a log message to the system logging facility with a specific severity level.
    ///
    /// Implementations of this method should map the provided message and type
    /// to the underlying system logging APIs (like `os_log` or `Logger`).
    ///
    /// - Parameters:
    ///   - type: The `OSLogType` representing the severity level of the message
    ///     (e.g., `.info`, `.debug`, `.error`, or `.fault`).
    ///   - message: The formatted string content to be recorded in the log.
    func log(type: OSLogType, _ message: String)
}
