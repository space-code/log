//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Log
import OSLog

final class OSWriterMock: IOSWriter {
    var invokedLog = false
    var invokedLogCount = 0
    var invokedLogParameters: (message: StaticString, log: OSLog, type: OSLogType, args: CVarArg)?
    var invokedLogParametersList = [(message: StaticString, log: OSLog, type: OSLogType, args: CVarArg)]()

    func log(_ message: StaticString, log: OSLog, type: OSLogType, _ args: CVarArg...) {
        invokedLog = true
        invokedLogCount += 1
        invokedLogParameters = (message, log, type, args)
        invokedLogParametersList.append((message, log, type, args))
    }
}
