//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

/// A log formatter that prepends a custom identifier and visual indicators to log messages.
///
/// `PrefixLogFormatter` is used to categorize logs by adding a string tag (e.g., a module name).
/// It also automatically adds high-visibility emojis for critical levels like `.fault` and `.error`
/// to help them stand out in dense log outputs.
public struct PrefixLogFormatter: ILogFormatter {
    // MARK: - Properties

    /// The string identifier (e.g., "Network", "Auth") prepended to every log message.
    private let name: String

    // MARK: - Initialization

    /// Initializes a new formatter with a specific name.
    ///
    /// - Parameter name: The custom prefix string used to identify the source of the log.
    public init(name: String) {
        self.name = name
    }

    // MARK: - ILogFormatter

    /// Prepends the prefix and professional severity-based symbols to the log message.
    ///
    /// The style is optimized for professional environments:
    /// - `.fault`: Uses the stop sign (⛔️) to indicate a critical, unrecoverable failure.
    /// - `.error`: Uses the warning sign (⚠️) to indicate a significant but recoverable issue.
    /// - `.info`: Uses the information circle (ℹ️) for high-level progress tracking.
    /// - `.debug`: Uses a simple diamond (🔹) for development-level details.
    public func format(message: String, with logLevel: LogLevel) -> String {
        let symbol = switch logLevel {
        case .fault:
            "⛔️ [\(name)]"
        case .error:
            "⚠️ [\(name)]"
        case .info:
            "ℹ️ [\(name)]"
        case .debug:
            "🔹 [\(name)]"
        default:
            "[\(name)]"
        }

        return "\(symbol) => \(message)"
    }
}
