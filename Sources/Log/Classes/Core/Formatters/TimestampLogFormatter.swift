//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

/// A log formatter that adds a timestamp to log messages.
open class TimestampLogFormatter: ILogFormatter {
    // MARK: Properties

    /// The date formatter.
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter
    }()

    /// The date format string.
    private let dateFormat: String

    // MARK: Initialization

    /// Creates a new `PrefixFormatter` instance with the specified data formmater.
    ///
    /// - Parameter dateFormat: The date format string.
    public init(dateFormat: String) {
        self.dateFormat = dateFormat
    }

    // MARK: ILogFormatter

    public func format(message: String, with _: LogLevel) -> String {
        let timestamp = dateFormatter.string(from: Date())
        return [timestamp, message].joined(separator: " ")
    }
}
