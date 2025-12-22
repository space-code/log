//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

// MARK: - ConsoleWriter

/// A concrete implementation of the `IConsoleWriter` protocol that outputs messages to the standard console.
///
/// This class provides a simple wrapper around the `Swift.print(_:separator:terminator:)` function,
/// typically used for local debugging or when specialized system logging is not required.
final class ConsoleWriter: IConsoleWriter {
    // MARK: - Initialization

    /// Creates a new instance of `ConsoleWriter`.
    init() {}

    // MARK: - IConsoleWriter

    /// Writes the specified message to the standard output.
    ///
    /// - Parameter message: The string content to be displayed in the console.
    func print(_ message: String) {
        Swift.print(message)
    }
}
