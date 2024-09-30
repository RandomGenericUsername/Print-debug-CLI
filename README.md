# print-debug
The `print-debug` script prints and logs messages with customizable colors, formats, and settings.

# Index
1. [Features](#features)
2. [Getting Started](#getting-started)
3. [Message type](#message-type)
4. [Loggingg messages](#logging-messages)
5. [Usage](#usage)
6. [Customization](#customization)

# Features
- **Message Type**: Supports different message types that alter a message's output format and behavior.
- **Logging**: Option to log messages to a file. 
- **Uppercase Conversion**: Option to convert the message text to uppercase.
- **Double Line Output**: Option to add an extra blank line after the message.
- **Output redirection**: Allows redirecting outpu to stederr.
- **Environment-Based Customization**: Environment variables can be set to configure color codes and message formats.

# Getting started 

## Print debug message
Set `ENABLE_DEBUG=true` to print debug messages.
```bash
export ENABLE_DEBUG=true
print-debug "This is a debug message"
```
### Output
<pre><code class="language-html"><span style="color:blue">DEBUG: [This is a debug message]</span>
</code></pre>

## Print non-debug message
Specify the message type by passing the `--type` or `-t` option:
```bash
print-debug "This is a info message" -t info
```
### Output
```bash
INFO: [This is an info message]
```

# Message Type
Specify the message type using `--type` or `-t` to control the format and color:
- `info`: Information messages
- `warn`: Warning messages
- `success`: Success messages
- `error`: Error messages
- `debug`: Debug messages

## Conditional Debug Messaging
`debug` type messages are print only if `ENABLE_DEBUG=true` is set. Other types are printed regardless.

# Logging Messages
## Enable logging
You can enable logging so that the message is written to a log file by either of the following two ways:
- Exporting the env var `ENABLE_LOG=true`.
- Passing the `--log` or `-l` options.

## Log file path
The log file is by default `/tmp/print-debug.log` and can be changed by:
- Exporting the env var `LOG=/some/path/to/log`.
- Passing the `--log-dir` or `-ld` option.

If `$LOG` variable is exported and `--log-dir` option is also used, the value passed in the option overrides the exported variable.

## Logging debug print
Logging follows the message type behavior. Non `debug` messages are logged regardless of `ENABLE_DEBUG`. `debug` messages are only logged if `ENABLE_DEBUG=true` is set.


# Usage

## Print debug
Print debug messages. Requires [enabling debug](#conditional-debug-messaging)  

```bash
export ENABLE_DEBUG=true
print-debug "This is a debug message"
```

**Output**
<pre><code class="language-html"><span style="color:blue">DEBUG: [This is a debug message]</span>
</code></pre>


## Print info
```bash
print-debug "This is an info message" --type info
```
**Output**
<pre><code class="language-html"><span>INFO: [This is an info message]</span>
</code></pre>

## Print warning
```bash
print-debug "This is a warning message" --type warn
```
**Output**
<pre><code class="language-html"><span style="color:orange">WARNING: [This is a warning message]</span>
</code></pre>

## Print success message
```bash
print-debug "This is a success message" --type success
```
**Output**
<pre><code class="language-html"><span style="color:green">Success: [This is a success message]</span>
</code></pre>

## Print error message
```bash
print-debug "This is an error message" --type error
```
**Output**
<pre><code class="language-html"><span style="color:red">ERROR: [This is an error message]</span>
</code></pre>

## Log messages to a file
Enable logging and specify a custom log file location.
```bash
print-debug "This is a logged message" --log --log-dir /tmp/custom-path.log
```

## Uppercase conversion
Convert the message to uppercase:
```bash
print-debug "This will be uppercase" 
```
**Output**
```bash
DEBUG: [THIS WILL BE UPPERCASE]
```


# Customization

## Customizing Message Colors
You can override the default colors for each message type by setting the following environment variables.

| Environment Variable      | Default Value         | Description                    |
|---------------------------|-----------------------|--------------------------------|
| `INFO_COLOR_OVERRIDE`      | `\e[0m` (No color)    | Default color for info messages|
| `WARN_COLOR_OVERRIDE`      | `\e[33m` (Yellow)     | Default color for warning messages|
| `SUCCESS_COLOR_OVERRIDE`   | `\e[32m` (Green)      | Default color for success messages|
| `ERROR_COLOR_OVERRIDE`     | `\e[31m` (Red)        | Default color for error messages|
| `DEBUG_COLOR_OVERRIDE`     | `\e[34m` (Blue)       | Default color for debug messages|


## Customizing Message Formats
You can customize the format of messages by setting the following environment variables. Use `MESSAGE` as a placeholder for the actual message content.

|  Environment Variable       | Default Format              | Description                     |
|-----------------------------|-----------------------------|---------------------------------|
| `INFO_FORMAT_OVERRIDE`      | `INFO: [MESSAGE]`           | Default format for info messages|
| `WARN_FORMAT_OVERRIDE`      | `WARNING: [MESSAGE]`        | Default format for warning messages|
| `SUCCESS_FORMAT_OVERRIDE`   | `Success: [MESSAGE]`        | Default format for success messages|
| `ERROR_FORMAT_OVERRIDE`     | `ERROR: [MESSAGE]`          | Default format for error messages|
| `DEBUG_FORMAT_OVERRIDE`     | `DEBUG: [MESSAGE]`          | Default format for debug messages|


# Environment Variables Summary
| Variable                   | Description                                            |
|----------------------------|--------------------------------------------------------|
| `LOG`                      | The path to the log file                               |
| `ENABLE_LOG`               | Enables logging when set to `true`                     |
| `ENABLE_DEBUG`             | Enables debug messages when set to `true`              |
| `INFO_COLOR_OVERRIDE`      | Custom color for `info` messages                         |
| `WARN_COLOR_OVERRIDE`      | Custom color for `warning` messages                      |
| `SUCCESS_COLOR_OVERRIDE`   | Custom color for `success` messages                      |
| `ERROR_COLOR_OVERRIDE`     | Custom color for `error` messages                        |
| `DEBUG_COLOR_OVERRIDE`     | Custom color for `debug` messages                        |
| `INFO_FORMAT_OVERRIDE`     | Custom format for `info` messages                        |
| `WARN_FORMAT_OVERRIDE`     | Custom format for `warning` messages                     |
| `SUCCESS_FORMAT_OVERRIDE`  | Custom format for `success` messages                     |
| `ERROR_FORMAT_OVERRIDE`    | Custom format for `error` messages                       |
| `DEBUG_FORMAT_OVERRIDE`    | Custom format for `debug` messages                       |

# Display Help
Use `--help` or `-h` to display the help message, which includes all available options and environment variables.