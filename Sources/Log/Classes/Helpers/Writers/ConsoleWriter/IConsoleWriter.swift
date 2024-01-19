//
// log
// Copyright © 2024 Space Code. All rights reserved.
//

import Foundation

/// A protocol for writing messages to the console.
protocol IConsoleWriter {
    /// Prints a message to the console output.
    ///
    /// - Parameter message: The message to be printed as a String.
    func print(_ message: String)
}
