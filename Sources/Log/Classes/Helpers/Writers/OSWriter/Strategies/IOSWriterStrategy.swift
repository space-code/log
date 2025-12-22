//
// log
// Copyright © 2024 Space Code. All rights reserved.
//

import os

// MARK: - IOSWriterStrategy

/// A protocol that abstracts the specific logging mechanism used to write to Apple's system logs.
///
/// This serves as the "Strategy" in a Strategy Pattern, allowing the logger to swap between
/// the modern `os.Logger` API and the legacy `os_log` function depending on platform availability.
protocol IOSWriterStrategy {
    /// Writes a log message to the system logging facility using the underlying strategy.
    ///
    /// - Parameters:
    ///   - type: The `OSLogType` defining the severity of the log (e.g., `.default`, `.error`).
    ///   - message: The string content to be recorded.
    func log(type: OSLogType, _ message: String)
}

// MARK: - os.Logger + IOSWriterStrategy

@available(macOS 11.0, iOS 14.0, watchOS 7.0, tvOS 14.0, *)
extension os.Logger: IOSWriterStrategy {
    /// Bridges the `IOSWriterStrategy` to the modern `os.Logger` API.
    ///
    /// - Parameters:
    ///   - type: The `OSLogType` which maps directly to the logger's `OSLogLogLevel`.
    ///   - message: The message string, passed using a string interpolation wrapper.
    func log(type: OSLogType, _ message: String) {
        // We use string interpolation here because os.Logger expects a OSLogMessage
        // which is created via ExpressibleByStringInterpolation.
        log(level: type, "\(message)")
    }
}
