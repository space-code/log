//
// log
// Copyright © 2024 Space Code. All rights reserved.
//

import Foundation
@testable import Log

final class ConsoleWriterMock: IConsoleWriter {
    var invokedPrint = false
    var invokedPrintCount = 0
    var invokedPrintParameters: (message: String, Void)?
    var invokedPrintParametersList = [(message: String, Void)]()

    func print(_ message: String) {
        invokedPrint = true
        invokedPrintCount += 1
        invokedPrintParameters = (message, ())
        invokedPrintParametersList.append((message, ()))
    }
}
