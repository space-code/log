//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Log

final class PrinterStrategyMock: IPrinterStrategy {
    var invokedFormattersGetter = false
    var invokedFormattersGetterCount = 0
    var stubbedFormatters: [ILogFormatter]! = []

    var formatters: [ILogFormatter] {
        invokedFormattersGetter = true
        invokedFormattersGetterCount += 1
        return stubbedFormatters
    }

    var invokedLog = false
    var invokedLogCount = 0
    var invokedLogParameters: (message: String, logLevel: LogLevel)?
    var invokedLogParametersList = [(message: String, logLevel: LogLevel)]()

    func log(_ message: String, logLevel: LogLevel) {
        invokedLog = true
        invokedLogCount += 1
        invokedLogParameters = (message, logLevel)
        invokedLogParametersList.append((message, logLevel))
    }
}
