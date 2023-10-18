![Log: A lightweight logging framework written in Swift](https://raw.githubusercontent.com/space-code/log/dev/Resources/log.png)

<h1 align="center" style="margin-top: 0px;">log</h1>

<p align="center">
<a href="https://github.com/space-code/log/blob/main/LICENSE"><img alt="License" src="https://img.shields.io/github/license/space-code/log?style=flat"></a> 
<a href="https://developer.apple.com/swift"><img alt="5.7" src="https://img.shields.io/badge/language-Swift5.7-orange.svg"/></a>
<a href="https://github.com/space-code/log"><img alt="CI" src="https://github.com/space-code/Log/actions/workflows/ci.yml/badge.svg?branch=main"></a>
<a href="https://github.com/apple/swift-package-manager" alt="log on Swift Package Manager" title="log on Swift Package Manager"><img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" /></a>
</p>

## Description
`Log` is a lightweight logging framework written in Swift.

- [Usage](#usage)
- [Requirements](#requirements)
- [Installation](#installation)
- [Communication](#communication)
- [Contributing](#contributing)
- [Author](#author)
- [License](#license)

## Usage

### Create a logger instance

First, you need to create an instance of `IPrinter` that prints messages to a specific output, such as XCode's console or the `Console` app.
The `log` package provides predefined printers for printing messages in the XCode console (`ConsolePrinter`) and the system console (`OSPrinter`). You can also create your own printer. To do this, your object must conform to `IPrinterStrategy` and implement the necessary methods.

```swift
import Log

let osPrinter = OSPrinter()
let consolePrinter = ConsolePrinter()
```

Second, create a `Logger` instance and pass these printers as initialization parameters while defining a log level. The log level determines the level of log messages to print. If the log level is set to a specific level, all messages with different log levels will be ignored. To print all messages, use `.all`.

```swift
let log = Logger(
    printers: [osPrinter, consolePrinter],
    logLevel: .all
)
log.error(message: "test message")
```

### Formatting a message

Each instance of `IPrinter` has an array of formatters that are responsible for formatting input messages. The `log` package provides predefined prefix and timestamp formatters. To use these, you need to pass them to an initializer of a printer.

```swift
let osPrinter = OSPrinter(formatters: [PrefixFormatter(name: "your prefix here")])
...
log.fault(message: "message") // "🚨🚨🚨 [your prefix here] => message"
```

Here is a list of predefined formatters:

| **Formatters**             | **Description**                                                                     |
|----------------------------|-------------------------------------------------------------------------------------|
| **PrefixLogFormatter**     | Add a specified prefix to a printed message                                         |
| **TimestampLogFormatter**  | Add a timestamp before a printed message based on a date format                     |

### Custom formatters

If you want to create a custom message formatter, your object must conform to the `ILogFormatter` protocol and implement the necessary methods.

```swift
struct MyCustomMessageFormatter: ILogFormatter {
    func format(message: String, with logLevel: LogLevel) -> String {
        // your implementation here
    }
}
```

## Requirements
- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 7.0+ / visionOS 1.0+
- Xcode 14.0
- Swift 5.7

## Installation
### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but `log` does support its use on supported platforms.

Once you have your Swift package set up, adding `log` as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/space-code/log.git", .upToNextMajor(from: "1.0.0"))
]
```

## Communication
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Contributing
Bootstrapping development environment

```
make bootstrap
```

Please feel free to help out with this project! If you see something that could be made better or want a new feature, open up an issue or send a Pull Request!

## Author
Nikita Vasilev, nv3212@gmail.com

## License
log is available under the MIT license. See the LICENSE file for more info.
