//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation

// MARK: - ConsoleWriter

/// A class that conforms to the IConsoleWriter protocol and writes messages to the console output.
public final class ConsoleWriter: IConsoleWriter {
    // MARK: Initialization

    /// Initializes a new ConsoleWriter instance.
    public init() {}

    // MARK: IConsoleWriter

    public func print(_ message: String) {
        Swift.print(message)
    }
}
