//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

/// Specifies the format to be used in the log message
public protocol ILogFormatter {
    /// Concatenates the specified attributes and generates the final log message
    ///
    /// - Parameters:
    ///   - message: A `String` value that contains the message.
    ///   - logLevel: A `LogLevel` value that contains the logging level.
    func format(message: String, with logLevel: LogLevel) -> String
}
