//
// log
// Copyright © 2024 Space Code. All rights reserved.
//

@testable import Log
import OSLog

final class OSWriterMock: IOSWriter {
    var invokedLog = false
    var invokedLogCount = 0
    var invokedLogParameters: (type: OSLogType, message: String)?
    var invokedLogParametersList = [(type: OSLogType, message: String)]()

    func log(type: OSLogType, _ message: String) {
        invokedLog = true
        invokedLogCount += 1
        invokedLogParameters = (type, message)
        invokedLogParametersList.append((type, message))
    }
}
