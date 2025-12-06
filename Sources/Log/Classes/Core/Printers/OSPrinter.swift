//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation
import OSLog

// MARK: - OSPrinter

/// A class for logging messages using the OSLog system.
public final class OSPrinter {
    // MARK: Properties

    /// An array of log formatters used to customize log message output.
    public let formatters: [ILogFormatter]

    /// An os writer.
    private let osWriter: IOSWriter

    // MARK: Initialization

    /// Creates a new `OSPrinter` instance.
    ///
    /// - Parameters:
    ///   - subsystem: An optional subsystem for categorizing log messages.
    ///   - category: An optional category for categorizing log messages.
    ///   - formatters: An array of log formatters for customizing log messages.
    public init(
        subsystem: String,
        category: String,
        formatters: [ILogFormatter]
    ) {
        self.formatters = formatters
        osWriter = OSWriter(
            subsystem: subsystem,
            category: category
        )
    }

    /// Creates a new `OSPrinter` instance.
    ///
    /// - Parameters:
    ///   - formatters: An array of log formatters for customizing log messages.
    ///   - osWriter: An os writer.
    init(formatters: [ILogFormatter], osWriter: IOSWriter) {
        self.formatters = formatters
        self.osWriter = osWriter
    }
}

// MARK: IStyleLogStrategy

extension OSPrinter: IStyleLogStrategy {
    public func log(_ message: String, logLevel: LogLevel) {
        let message = formatMessage(message, logLevel: logLevel)
        let type = sysLogPriority(logLevel)
        osWriter.log(type: type, message)
    }
}

// MARK: - Extension

extension OSPrinter {
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
