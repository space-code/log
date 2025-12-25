//
// log
// Copyright © 2023 Space Code. All rights reserved.
//

import Log
import XCTest

// MARK: - LogTests

final class LogTests: XCTestCase {
    // MARK: Properties

    private var printerMock: PrinterStrategyMock!

    // MARK: XCTestCase

    override func setUp() {
        super.setUp()
        printerMock = PrinterStrategyMock()
    }

    override func tearDown() {
        printerMock = nil
        super.tearDown()
    }

    // MARK: Tests

    func test_thatLoggerLogsInfoMessage() {
        // given
        let sut = prepareSut()

        // when
        sut.info(message: .message)

        // then
        XCTAssertEqual(printerMock.invokedLogParameters?.message, .message)
        XCTAssertEqual(printerMock.invokedLogParameters?.logLevel, .info)
    }

    func test_thatLoggerLogsDebugMessage() {
        // given
        let sut = prepareSut()

        // when
        sut.debug(message: .message)

        // then
        XCTAssertEqual(printerMock.invokedLogParameters?.message, .message)
        XCTAssertEqual(printerMock.invokedLogParameters?.logLevel, .debug)
    }

    func test_thatLoggerLogsErrorMessage() {
        // given
        let sut = prepareSut()

        // when
        sut.error(message: .message)

        // then
        XCTAssertEqual(printerMock.invokedLogParameters?.message, .message)
        XCTAssertEqual(printerMock.invokedLogParameters?.logLevel, .error)
    }

    func test_thatLoggerLogsFaultMessage() {
        // given
        let sut = prepareSut()

        // when
        sut.fault(message: .message)

        // then
        XCTAssertEqual(printerMock.invokedLogParameters?.message, .message)
        XCTAssertEqual(printerMock.invokedLogParameters?.logLevel, .fault)
    }

    func test_thatLoggerDoesNotLogAnything_whenLogLevelIsOff() {
        // given
        let sut = prepareSut(logLevel: .off)

        // when
        sut.info(message: .message)

        // then
        XCTAssertNil(printerMock.invokedLogParameters?.message)
    }

    func test_thatLoggerDoesNotLogDebugMessage_whenLogLevelIsInfo() {
        // given
        let sut = prepareSut(logLevel: .info)

        // when
        sut.debug(message: .message)

        // then
        XCTAssertNil(printerMock.invokedLogParameters?.message)
    }

    func test_thatLoggerDoesNotLogInfoMessage_whenLogLevelIsError() {
        // given
        let sut = prepareSut(logLevel: .error)

        // when
        sut.info(message: .message)

        // then
        XCTAssertNil(printerMock.invokedLogParameters?.message)
    }

    func test_thatLoggerDoesNotLogErrorMessage_whenLogLevelIsFault() {
        // given
        let sut = prepareSut(logLevel: .fault)

        // when
        sut.error(message: .message)

        // then
        XCTAssertNil(printerMock.invokedLogParameters?.message)
    }

    func test_thatLoggerDoesNotPrintAnything_whenLogLevelValueDidChange() {
        // given
        let sut = prepareSut()

        // when
        sut.updateLogLevel { _ in .info }
        sut.debug(message: .message)
        sut.info(message: .message)

        // then
        XCTAssertEqual(sut.logLevel, .info)
        XCTAssertEqual(printerMock.invokedLogCount, 1)
        XCTAssertEqual(printerMock.invokedLogParameters?.message, .message)
    }

    // MARK: Private

    private func prepareSut(logLevel: LogLevel = .all) -> Logger {
        Logger(
            printers: [printerMock],
            logLevel: logLevel
        )
    }
}

// MARK: - Constants

private extension String {
    static let message = "message"
}
