//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation
import OSLog

// MARK: - OSPrinter

/// A log printer that directs messages to Apple's Unified Logging System (OSLog).
///
/// `OSPrinter` integrates with the system-level logging facility, allowing logs to be
/// viewed in the macOS Console app. It supports categorization via subsystems and categories,
/// making it ideal for production debugging and performance analysis.
public final class OSPrinter {
    // MARK: - Properties

    /// A collection of formatters used to transform the log message before it is sent to the system.
    ///
    /// Use these to add prefixes, metadata, or to clean strings before they are persisted
    /// by the operating system.
    public let formatters: [ILogFormatter]

    /// The underlying writer that handles version-specific OS logging APIs.
    private let osWriter: IOSWriter

    // MARK: - Initialization

    /// Creates a new `OSPrinter` instance configured with a specific subsystem and category.
    ///
    /// - Parameters:
    ///   - subsystem: A string used to identify a specific app or large functional module (e.g., "com.app.network").
    ///   - category: A string used to further distinguish logs within a subsystem (e.g., "Database").
    ///   - formatters: An array of log formatters for customizing the final string output.
    public init(
        subsystem: String = Bundle.main.bundleIdentifier ?? "com.app.logger",
        category: String = "General",
        formatters: [ILogFormatter] = []
    ) {
        self.formatters = formatters
        osWriter = OSWriter(
            subsystem: subsystem,
            category: category
        )
    }

    /// Creates a new `OSPrinter` instance using a pre-configured OS writer.
    ///
    /// This initializer is primarily intended for dependency injection during testing
    /// or for advanced configurations where a specific `IOSWriter` implementation is required.
    ///
    /// - Parameters:
    ///   - formatters: An array of log formatters for customizing log messages.
    ///   - osWriter: An object conforming to `IOSWriter` that performs the actual system calls.
    init(
        formatters: [ILogFormatter] = [],
        osWriter: IOSWriter = OSWriter(
            subsystem: Bundle.main.bundleIdentifier ?? "com.app.logger",
            category: "General"
        )
    ) {
        self.formatters = formatters
        self.osWriter = osWriter
    }
}

// MARK: IStyleLogStrategy

extension OSPrinter: IStyleLogStrategy {
    /// Formats and dispatches a log message to the OSLog system.
    ///
    /// The method first processes the message through the formatter chain, maps the
    /// internal `LogLevel` to a native `OSLogType`, and then triggers the system log.
    ///
    /// - Parameters:
    ///   - message: The raw string content to be logged.
    ///   - logLevel: The severity level used to determine the system log priority.
    public func log(_ message: String, logLevel: LogLevel) {
        let message = formatMessage(message, logLevel: logLevel)
        let type = sysLogPriority(logLevel)
        osWriter.log(type: type, message)
    }
}

// MARK: - Private Mapping

extension OSPrinter {
    /// Maps the internal `LogLevel` flags to the native Apple `OSLogType` severities.
    ///
    /// - Parameter logLevel: The custom log level used within the application.
    /// - Returns: The corresponding `OSLogType` that the system uses for filtering and persistence.
    private func sysLogPriority(_ logLevel: LogLevel) -> OSLogType {
        switch logLevel {
        case .debug:
            .debug
        case .info:
            .info
        case .fault:
            .fault
        case .error:
            .error
        default:
            .default
        }
    }
}
