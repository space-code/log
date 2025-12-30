![A lightweight logging framework written in Swift](./Resources/log.png)

<h1 align="center" style="margin-top: 0px;">log</h1>

<p align="center">
<a href="https://github.com/space-code/log/blob/main/LICENSE"><img alt="License" src="https://img.shields.io/github/license/space-code/log?style=flat"></a>
<a href="https://swiftpackageindex.com/space-code/log"><img alt="Swift Compatibility" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fspace-code%2Flog%2Fbadge%3Ftype%3Dswift-versions"/></a> 
<a href="https://swiftpackageindex.com/space-code/log"><img alt="Platform Compatibility" src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fspace-code%2Flog%2Fbadge%3Ftype%3Dplatforms"/></a> 
<a href="https://github.com/space-code/log"><img alt="CI" src="https://github.com/space-code/Log/actions/workflows/ci.yml/badge.svg?branch=main"></a>
<a href="https://github.com/apple/swift-package-manager" alt="log on Swift Package Manager" title="log on Swift Package Manager"><img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" /></a>
<a href="https://codecov.io/gh/space-code/log"><img alt="CodeCov" src="https://codecov.io/gh/space-code/log/graph/badge.svg?token=h5C53DgBKN"></a>
<a href="https://github.com/space-code/log"><img alt="GitHub release; latest by date" src="https://img.shields.io/github/v/release/space-code/log"></a>
<a href="https://github.com/space-code/log"><img alt="GitHub commit activity" src="https://img.shields.io/github/commit-activity/m/space-code/log"></a>
</p>

## Description
Log is a lightweight, flexible Swift logging framework that provides elegant and customizable logging capabilities for iOS, macOS, tvOS, watchOS, and visionOS applications. With support for multiple output destinations and custom formatting, Log makes debugging and monitoring your apps easier than ever.

## Features

✨ **Multiple Output Destinations** - Console, system log (os_log), and custom printers  
🎨 **Customizable Formatting** - Prefix, timestamp, and custom formatters  
📊 **Log Levels** - Fine-grained control over message severity  
🔧 **Extensible** - Easy to create custom printers and formatters  
📱 **Cross-Platform** - Works on iOS, macOS, tvOS, watchOS, and visionOS  
⚡ **Lightweight** - Minimal footprint with zero dependencies  
🎯 **Type-Safe** - Leverages Swift's type system for compile-time safety

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Usage](#usage)
  - [Creating a Logger](#creating-a-logger)
  - [Log Levels](#log-levels)
  - [Printers](#printers)
  - [Message Formatting](#message-formatting)
  - [Custom Formatters](#custom-formatters)
- [Common Use Cases](#common-use-cases)
- [Communication](#communication)
- [Contributing](#contributing)
  - [Development Setup](#development-setup)
- [Author](#author)
- [License](#license)

## Requirements

| Platform  | Minimum Version |
|-----------|----------------|
| iOS       | 13.0+          |
| macOS     | 10.15+         |
| tvOS      | 13.0+          |
| watchOS   | 7.0+           |
| visionOS  | 1.0+           |
| Xcode     | 15.3+          |
| Swift     | 5.10+           |

## Installation

### Swift Package Manager

Add the following dependency to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/space-code/log.git", from: "1.2.0")
]
```

Or add it through Xcode:

1. File > Add Package Dependencies
2. Enter package URL: `https://github.com/space-code/log.git`
3. Select version requirements

## Quick Start

```swift
import Log

// Create printers
let consolePrinter = ConsolePrinter()
let osPrinter = OSPrinter()

// Create logger
let log = Logger(
    printers: [consolePrinter, osPrinter],
    logLevel: .all
)

// Start logging
log.info(message: "Application started")
log.debug(message: "Debug information")
log.error(message: "Something went wrong")
```

## Usage

### Creating a Logger

Log provides two main printer implementations out of the box:

```swift
import Log

// Console printer for Xcode console output
let consolePrinter = ConsolePrinter()

// OS printer for system console (Console.app)
let osPrinter = OSPrinter()

// Create logger with multiple printers
let log = Logger(
    printers: [consolePrinter, osPrinter],
    logLevel: .all
)
```

### Log Levels

Log supports various severity levels for organizing your messages:

```swift
import Log

let log = Logger(printers: [ConsolePrinter()], logLevel: .all)

// Different log levels
log.debug(message: "Debug information")
log.info(message: "General informational messages")
log.error(message: "Error messages")
log.fault(message: "Critical fault messages")
```

**Available Log Levels:**
- `.debug` - Debug information
- `.info` - General informational messages
- `.error` - Error messages
- `.fault` - Critical system faults
- `.all` - Log all messages

**Filtering by Level:**
```swift
// Only log errors
let log = Logger(
    printers: [ConsolePrinter()],
    logLevel: .errors
)

log.debug(message: "This won't be printed")
log.error(message: "This will be printed")
```

### Printers

Printers determine where your log messages are output:

**ConsolePrinter** - Outputs to Xcode console:
```swift
let consolePrinter = ConsolePrinter(
    formatters: [
        PrefixLogFormatter(name: "MyApp"),
        TimestampLogFormatter(dateFormat: "HH:mm:ss")
    ]
)
```

**OSPrinter** - Outputs to system log (viewable in Console.app):
```swift
let osPrinter = OSPrinter(
    formatters: [
        PrefixLogFormatter(name: "MyApp")
    ]
)
```

**Using Multiple Printers:**
```swift
// Log to both Xcode console and system log
let log = Logger(
    printers: [
        ConsolePrinter(formatters: [TimestampLogFormatter()]),
        OSPrinter(formatters: [PrefixLogFormatter(name: "MyApp")])
    ],
    logLevel: .all
)
```

### Message Formatting

Formatters transform your log messages before they're printed. Log includes two built-in formatters:

| Formatter | Description |
|-----------|-------------|
| **PrefixLogFormatter** | Adds a specified prefix to messages |
| **TimestampLogFormatter** | Adds a timestamp based on date format |

**Using Formatters:**
```swift
import Log

// Prefix formatter
let prefixFormatter = PrefixLogFormatter(name: "NetworkLayer")
let printer = ConsolePrinter(formatters: [prefixFormatter])

let log = Logger(printers: [printer], logLevel: .all)
log.info(message: "Request started")
// Output: ℹ️ [NetworkLayer] => Request started

// Timestamp formatter
let timestampFormatter = TimestampLogFormatter(dateFormat: "yyyy-MM-dd HH:mm:ss")
let printer2 = ConsolePrinter(formatters: [timestampFormatter])

let log2 = Logger(printers: [printer2], logLevel: .all)
log2.info(message: "User logged in")
// Output: ℹ️ 2025-12-22 15:56:42 User logged in

// Combining formatters
let combinedPrinter = ConsolePrinter(formatters: [
    TimestampLogFormatter(dateFormat: "HH:mm:ss"),
    PrefixLogFormatter(name: "API")
])

let log3 = Logger(printers: [combinedPrinter], logLevel: .all)
log3.error(message: "Connection failed")
// Output: ⚠️ [API] => 15:56:42 Connection failed
```

### Custom Formatters

Create custom formatters by conforming to the `ILogFormatter` protocol:

```swift
import Log

struct EnvironmentFormatter: ILogFormatter {
    let environment: String
    
    func format(message: String, with logLevel: LogLevel) -> String {
        return "[\(environment.uppercased())] \(message)"
    }
}

// Usage
let formatter = EnvironmentFormatter(environment: "production")
let printer = ConsolePrinter(formatters: [formatter])
let log = Logger(printers: [printer], logLevel: .all)

log.info(message: "Server started")
// Output: [PRODUCTION] Server started
```

**Advanced Custom Formatter:**
```swift
struct ContextualFormatter: ILogFormatter {
    let includeThread: Bool
    let includeFile: Bool
    
    func format(message: String, with logLevel: LogLevel) -> String {
        var components: [String] = []
        
        if includeThread {
            components.append("[Thread: \(Thread.current.threadName)]")
        }
        
        if includeFile {
            components.append("[File: \(#file)]")
        }
        
        components.append(message)
        return components.joined(separator: " ")
    }
}
```

**Custom Printer:**
```swift
import Log

final class FilePrinter: IPrinter {
    let formatters: [ILogFormatter]
    let fileURL: URL
            
    init(formatters: [ILogFormatter] = [], fileURL: URL) {
        self.formatters = formatters
        self.fileURL = fileURL
    }

    func log(_ message: String, logLevel: Log.LogLevel) {
        var formattedMessage = message
                
        for formatter in formatters {
            formattedMessage = formatter.format(
                message: formattedMessage,
                with: logLevel
            )
        }
                
        if let data = (formattedMessage + "\n").data(using: .utf8) {
            // Write to file
        }
    }
}
```

## Common Use Cases

### Application Logging

```swift
import Log

class AppDelegate: UIResponder, UIApplicationDelegate {
    private let log = Logger(
        printers: [
            ConsolePrinter(formatters: [
                TimestampLogFormatter(dateFormat: "HH:mm:ss.SSS"),
                PrefixLogFormatter(name: "MyApp")
            ]),
            OSPrinter(formatters: [
                PrefixLogFormatter(name: "MyApp")
            ])
        ],
        logLevel: .all
    )
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        log.info(message: "Application launched")
        setupApplication()
        return true
    }
    
    private func setupApplication() {
        log.debug(message: "Configuring application")
        // Configuration code
        log.info(message: "Application configured successfully")
    }
}
```

### Network Layer Logging

```swift
import Log

class NetworkManager {
    private let log = Logger(
        printers: [
            ConsolePrinter(formatters: [
                TimestampLogFormatter(),
                PrefixLogFormatter(name: "Network")
            ])
        ],
        logLevel: .debug
    )
    
    func fetchData(from url: URL) async throws -> Data {
        log.debug(message: "Requesting: \(url.absoluteString)")
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let httpResponse = response as? HTTPURLResponse {
                log.info(message: "Response: \(httpResponse.statusCode)")
            }
            
            return data
        } catch {
            log.error(message: "Request failed: \(error.localizedDescription)")
            throw error
        }
    }
}
```

### Database Operations

```swift
import Log

class DatabaseManager {
    private let log = Logger(
        printers: [
            ConsolePrinter(formatters: [
                PrefixLogFormatter(name: "Database")
            ])
        ],
        logLevel: .all
    )
    
    func saveRecord(_ record: Record) throws {
        log.debug(message: "Attempting to save record: \(record.id)")
        
        do {
            try database.insert(record)
            log.info(message: "Record saved successfully: \(record.id)")
        } catch {
            log.error(message: "Failed to save record: \(error)")
            throw error
        }
    }
    
    func deleteRecord(id: String) throws {
        log.info(message: "Deleting record: \(id)")
        try database.delete(id)
        log.info(message: "Record deleted: \(id)")
    }
}
```

### Debug vs Production Logging

```swift
import Log

class LoggerFactory {
    static func createLogger() -> Logger {
        #if DEBUG
        return Logger(
            printers: [
                ConsolePrinter(formatters: [
                    TimestampLogFormatter(dateFormat: "HH:mm:ss.SSS"),
                    PrefixLogFormatter(name: "Debug")
                ])
            ],
            logLevel: .all
        )
        #else
        return Logger(
            printers: [
                OSPrinter(formatters: [
                    PrefixLogFormatter(name: "Production")
                ])
            ],
            logLevel: .error  // Only log errors in production
        )
        #endif
    }
}

// Usage
let log = LoggerFactory.createLogger()
```

## Communication

- 🐛 **Found a bug?** [Open an issue](https://github.com/space-code/log/issues/new)
- 💡 **Have a feature request?** [Open an issue](https://github.com/space-code/log/issues/new)
- ❓ **Questions?** [Start a discussion](https://github.com/space-code/log/discussions)
- 🤝 **Want to contribute?** Submit a pull request

## Contributing

We love contributions! Please feel free to help out with this project. If you see something that could be made better or want a new feature, open up an issue or send a Pull Request.

### Development Setup

Bootstrap the development environment:

```bash
make bootstrap
```

For detailed contribution guidelines, see [CONTRIBUTING.md](https://github.com/space-code/log/blob/main/CONTRIBUTING.md).

## Author

**Nikita Vasilev**
- Email: nv3212@gmail.com
- GitHub: [@ns-vasilev](https://github.com/ns-vasilev)

## License

Log is released under the MIT license. See [LICENSE](https://github.com/space-code/log/blob/main/LICENSE) for details.

---

<div align="center">

**[⬆ back to top](#log)**

Made with ❤️ by [space-code](https://github.com/space-code)

</div>