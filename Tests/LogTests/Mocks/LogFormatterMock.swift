//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Foundation
import Log

final class LogFormatterMock: ILogFormatter {
    var invokedFormat = false
    var invokedFormatCount = 0
    var invokedFormatParameters: (message: String, logLevel: LogLevel)?
    var invokedFormatParametersList = [(message: String, logLevel: LogLevel)]()
    var stubbedFormatResult: String! = ""

    func format(message: String, with logLevel: LogLevel) -> String {
        invokedFormat = true
        invokedFormatCount += 1
        invokedFormatParameters = (message, logLevel)
        invokedFormatParametersList.append((message, logLevel))
        return stubbedFormatResult
    }
}
