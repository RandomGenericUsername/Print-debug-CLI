# print-debug
Enhanced print-debug utility with advanced logging capabilities for large-scale projects.

# Index
1. [Features](#features)
2. [Getting Started](#getting-started)
3. [Enhanced Features](#enhanced-features)
4. [Message Types](#message-types)
5. [Advanced Logging](#advanced-logging)
6. [Performance Timing](#performance-timing)
7. [Context and Debugging](#context-and-debugging)
8. [Usage Examples](#usage-examples)
9. [Environment Variables](#environment-variables)
10. [Legacy Features](#legacy-features)
11. [Customization](#customization)

# Features

## Core Enhanced Features (v2.0.0)
- **Structured Timestamps**: Millisecond-precision timestamps with consistent formatting
- **Module Auto-Detection**: Automatically detects component/module from script path
- **Performance Timing**: Built-in timer functionality for operation profiling
- **Enhanced Message Types**: Supports debug, info, warn, success, error, and critical
- **Component Logging**: Separate log files for different components/modules
- **System Resource Monitoring**: Optional CPU, memory, and disk usage reporting
- **Structured JSON Logging**: Support for complex data structures
- **Advanced Error Reporting**: Error codes with actionable suggestions
- **Call Stack Tracing**: Optional call stack information for debugging
- **Log Level Filtering**: Hierarchical log levels with environment control
- **Multiple Log Destinations**: Log to multiple files simultaneously

## Legacy Features (Maintained)
- **Message Type**: Supports different message types that alter output format and behavior
- **Logging**: Option to log messages to a file
- **Uppercase Conversion**: Option to convert message text to uppercase
- **Double Line Output**: Option to add extra blank line after message
- **Output Redirection**: Allows redirecting output to stderr
- **Environment-Based Customization**: Configurable colors and message formats

# Getting Started

## Basic Usage (Enhanced Output)
Set `ENABLE_DEBUG=true` to print debug messages with enhanced formatting:
```bash
export ENABLE_DEBUG=true
print-debug "This is a debug message"
```
### Output
```
[2025-08-01 14:06:33.296] [DEBUG] [script-name] [PID:47377] This is a debug message
```

## Enhanced Message Types
Specify the message type using `--type` or `-t`:
```bash
print-debug "System ready" -t info
print-debug "Warning: High CPU usage" -t warn
print-debug "Operation completed" -t success
print-debug "Configuration error" -t error
print-debug "Critical system failure" -t critical
```

# Enhanced Features

## 1. Module Auto-Detection
The utility automatically detects modules from script paths:
```bash
# When called from /path/to/wallpaper/script.sh
print-debug "Wallpaper changed" -t info
# Output: [timestamp] [INFO] [wallpaper] [PID:123] Wallpaper changed
```

**Manual Override:**
```bash
print-debug "Custom module" -t info -m "custom_component"
```

## 2. Context Information
Add function and line context:
```bash
print-debug "Processing icons" -t debug -c "process_icons:142"
print-debug "Operation complete" -t info --caller "generate_waybar_icons"
```

## 3. Performance Timing
Track operation durations:
```bash
# Start timer
print-debug "Starting operation" -t info --start-timer "wallpaper_change"

# Show duration without ending
print-debug "Progress update" -t debug --show-duration "wallpaper_change"

# End timer with duration
print-debug "Operation complete" -t success --end-timer "wallpaper_change"
```

## 4. Advanced Error Reporting
Structured error messages with codes and suggestions:
```bash
print-debug "Config file not found" -t error \
    --error-code "CONFIG_001" \
    --suggestion "Check ~/.config/hypr/hyprland.conf exists"
```

## 5. JSON Logging
Log structured data:
```bash
print-debug "Theme applied" -t info \
    --json '{"theme":"default","colors":["#ff0000","#00ff00"]}'
```

## 6. Component Logging
Separate log files per component:
```bash
print-debug "Waybar restarted" -t info -m waybar --component-log
# Creates: /tmp/component-logs/waybar.log
```

## 7. System Resource Monitoring
Monitor system resources:
```bash
print-debug "System status" -t info --show-resources
# Output: [...] System status | RESOURCES: MEM:24.5% CPU:97.0% DISK:1.0%
```

# Message Types
Enhanced message types with structured formatting:

- `debug`: Debug messages (only shown when ENABLE_DEBUG=true)
- `info`: Information messages
- `warn`: Warning messages  
- `success`: Success messages
- `error`: Error messages
- `critical`: Critical system messages

## Log Level Filtering
Set global log level to filter messages:
```bash
export LOG_LEVEL="warn"  # Only show warn, error, critical
print-debug "Debug message" -t debug    # Won't show
print-debug "Warning message" -t warn   # Will show
```

# Advanced Logging

## Multiple Log Destinations
Log to multiple files:
```bash
print-debug "Critical event" -t critical \
    --also-log-to "/var/log/system.log" \
    --also-log-to "/tmp/audit.log"
```

## Component-Specific Logs
Automatic routing to component logs:
```bash
export COMPONENT_LOG_DIR="/custom/log/path"
print-debug "Component message" -t info -m waybar --component-log
```

# Performance Timing

## Timer Operations
```bash
# Start named timer
print-debug "Starting" --start-timer "operation_name"

# Check duration without ending
print-debug "Progress" --show-duration "operation_name"  

# End timer and show total duration
print-debug "Complete" --end-timer "operation_name"
```

# Context and Debugging

## Call Stack Information
```bash
print-debug "Error occurred" -t error --show-stack
```

## Function Context
```bash
print-debug "Processing" -t debug -c "function_name:line_number"
```

# Usage Examples

## Basic Enhanced Usage
```bash
# Simple message with auto-detection
print-debug "Processing started" -t info

# With module specification
print-debug "Theme applied" -t success -m waybar

# With context and timing
print-debug "Starting operation" -t info --start-timer "op1" -c "main:45"
```

## Complex Real-World Example
```bash
# Complete workflow with all features
print-debug "Starting wallpaper change" -t info \
    --start-timer "wallpaper_workflow" \
    -m wallpaper \
    --component-log \
    --json '{"wallpaper":"new-bg.png","source":"user_selection"}'

print-debug "Workflow completed" -t success \
    --end-timer "wallpaper_workflow" \
    --show-resources \
    -m wallpaper
```

## Run Demo
Execute the included usage script to see all features:
```bash
./usage.sh
```

# Environment Variables

## Enhanced Variables (v2.0.0)
| Variable | Description | Default |
|----------|-------------|---------|
| `LOG_LEVEL` | Global log level (debug, info, warn, error, critical) | info |
| `COMPONENT_LOG_DIR` | Directory for component-specific logs | /tmp/component-logs |

## Core Variables
| Variable | Description | Default |
|----------|-------------|---------|
| `LOG` | Main log file path | /tmp/print-debug.log |
| `ENABLE_LOG` | Enable logging (true/false) | false |
| `ENABLE_DEBUG` | Enable debug messages (true/false) | false |

## Color Customization
| Variable | Description | Default |
|----------|-------------|---------|
| `INFO_COLOR_OVERRIDE` | Custom color for info messages | No color |
| `WARN_COLOR_OVERRIDE` | Custom color for warning messages | Yellow |
| `SUCCESS_COLOR_OVERRIDE` | Custom color for success messages | Green |
| `ERROR_COLOR_OVERRIDE` | Custom color for error messages | Red |
| `DEBUG_COLOR_OVERRIDE` | Custom color for debug messages | Blue |
| `CRITICAL_COLOR_OVERRIDE` | Custom color for critical messages | Magenta |

# Legacy Features

All original print-debug features are maintained for backward compatibility:

## Conditional Debug Messaging
```bash
export ENABLE_DEBUG=true
print-debug "Debug message"  # Only shows when ENABLE_DEBUG=true
```

## Basic Logging
```bash
export ENABLE_LOG=true
export LOG="/tmp/my-log.log"
print-debug "Logged message" -t info
```

## Text Formatting
```bash
print-debug "uppercase message" --upper
print-debug "message with extra line" --double-line
print-debug "message to stderr" --redirect-to-stderr
```

# Customization

## Message Format Customization
Customize message formats using environment variables:
```bash
export INFO_FORMAT_OVERRIDE="[INFO] MESSAGE"
export DEBUG_FORMAT_OVERRIDE="DEBUG: MESSAGE"
```

## Color Customization
Override default colors:
```bash
export ERROR_COLOR_OVERRIDE="\e[91m"  # Bright red
export SUCCESS_COLOR_OVERRIDE="\e[92m"  # Bright green
```

# Migration from v1.0

All existing print-debug usage continues to work unchanged. Enhanced features are opt-in:

```bash
# v1.0 usage (still works)
print-debug "Message" -t info

# v2.0 enhanced usage
print-debug "Message" -t info -m component --component-log --show-resources
```

# Help
Use `--help` or `-h` to display comprehensive help with all options:
```bash
print-debug --help
```
