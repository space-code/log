//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

/// A log formatter that prepends a chronological timestamp to log messages.
///
/// `TimestampLogFormatter` is essential for tracing the sequence of events during
/// application execution. It allows you to define a custom date format to match
/// your specific debugging or analytics requirements.
open class TimestampLogFormatter: ILogFormatter {
    // MARK: - Properties

    /// The internal date formatter used to convert the current system time into a string.
    ///
    /// This property is lazily initialized to optimize performance and ensure the
    /// formatter is only created when the first log message is processed.
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter
    }()

    /// The string pattern defining the appearance of the timestamp (e.g., "yyyy-MM-dd HH:mm:ss").
    private let dateFormat: String

    // MARK: - Initialization

    /// Initializes a new `TimestampLogFormatter` with the specified date format.
    ///
    /// - Parameter dateFormat: A string representing the desired date and time pattern.
    public init(dateFormat: String = "HH:mm:ss") {
        self.dateFormat = dateFormat
    }

    // MARK: - ILogFormatter

    /// Prepends a timestamp based on the current system time to the log message.
    ///
    /// - Parameters:
    ///   - message: The raw or previously formatted log message.
    ///   - logLevel: The severity level (ignored by this specific formatter).
    /// - Returns: A string combining the timestamp and the message, separated by a space.
    public func format(message: String, with _: LogLevel) -> String {
        let timestamp = dateFormatter.string(from: Date())
        return [timestamp, message].joined(separator: " ")
    }
}
