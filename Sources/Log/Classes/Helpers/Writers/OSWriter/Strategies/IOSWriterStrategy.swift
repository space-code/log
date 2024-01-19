//
// log
// Copyright © 2024 Space Code. All rights reserved.
//

import os

// MARK: - IOSWriterStrategy

/// Protocol defining the contract for a logger strategy that writes logs to the iOS system logs using OSLog.
protocol IOSWriterStrategy {
    /// Writes a log message to the iOS system logs with the specified log type.
    ///
    /// - Parameters:
    ///   - type: The type of the log message (debug, info, error, etc.).
    ///   - message: The message to be logged.
    func log(type: OSLogType, _ message: String)
}

// MARK: - os.Logger + IOSWriterStrategy

@available(macOS 11.0, iOS 14.0, watchOS 7.0, tvOS 14.0, *)
extension os.Logger: IOSWriterStrategy {
    func log(type: OSLogType, _ message: String) {
        log(level: type, "\(message)")
    }
}
