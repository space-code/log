//
// log
// Copyright © 2024 Space Code. All rights reserved.
//

import Foundation

// MARK: - ConsoleWriter

/// A class that conforms to the IConsoleWriter protocol and writes messages to the console output.
final class ConsoleWriter: IConsoleWriter {
    // MARK: Initialization

    /// Initializes a new ConsoleWriter instance.
    init() {}

    // MARK: IConsoleWriter

    func print(_ message: String) {
        Swift.print(message)
    }
}
