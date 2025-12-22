//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation
import OSLog

// MARK: - OSWriter

/// An implementation of `IOSWriter` that directs log messages to the system logging facility (Apple's Unified Logging System).
///
/// This class acts as a wrapper that automatically chooses the most appropriate logging API
/// based on the operating system version, ensuring backward compatibility with older Apple platforms.
final class OSWriter: IOSWriter {
    // MARK: - Properties

    /// The identifier for the subsystem that is performing the logging, typically a reverse DNS string (e.g., "com.app.network").
    private let subsystem: String

    /// The category within the subsystem used to further distinguish logs (e.g., "UI" or "Database").
    private let category: String

    /// An internal property used to generate an `OSLog` configuration for both legacy and modern logging APIs.
    private var osLog: OSLog { OSLog(subsystem: subsystem, category: category) }

    /// A strategy-based writer that selects between the modern `os.Logger` (iOS 14+)
    /// or a legacy `os_log` wrapper for older systems.
    private lazy var writerStrategy: IOSWriterStrategy = if #available(macOS 11.0, iOS 14.0, watchOS 7.0, tvOS 14.0, *) {
        os.Logger(osLog)
    } else {
        LegacyOSLogger(osLog: osLog)
    }

    // MARK: - Initialization

    /// Initializes a new `OSWriter` with a specific subsystem and category.
    ///
    /// - Parameters:
    ///   - subsystem: The name of the subsystem to categorize messages.
    ///   - category: The name of the category to categorize messages.
    init(subsystem: String, category: String) {
        self.subsystem = subsystem
        self.category = category
    }

    // MARK: - IOSWriter

    /// Writes a log message to the system log using the active version-specific strategy.
    ///
    /// - Parameters:
    ///   - type: The severity level of the log (e.g., `.debug`, `.error`, `.fault`).
    ///   - message: The string content to be logged.
    func log(type: OSLogType, _ message: String) {
        writerStrategy.log(type: type, message)
    }
}

// MARK: OSWriter.LegacyOSLogger

private extension OSWriter {
    /// A fallback logging implementation for platforms that do not support the modern `os.Logger` API.
    struct LegacyOSLogger: IOSWriterStrategy {
        // MARK: Private

        /// The underlying `OSLog` object used for legacy logging.
        private let osLog: OSLog

        // MARK: Initialization

        /// Initializes the legacy logger with a configured `OSLog` instance.
        init(osLog: OSLog) {
            self.osLog = osLog
        }

        // MARK: IOSWriterStrategy

        /// Forwards the log message to the C-based `os_log` function.
        ///
        /// - Parameters:
        ///   - type: The log level.
        ///   - message: The string to be recorded in the log.
        func log(type: OSLogType, _ message: String) {
            os_log("%s", log: osLog, type: type, message)
        }
    }
}
