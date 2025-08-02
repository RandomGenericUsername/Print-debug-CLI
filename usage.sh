#!/bin/bash

# Enhanced print-debug v2.0.0 Usage Examples
# This script demonstrates all the new advanced features

SCRIPT_DIR="$(dirname "$0")"
PRINT_DEBUG="$SCRIPT_DIR/print-debug"

# Setup environment
export ENABLE_DEBUG="true"
export ENABLE_LOG="true"
export LOG="/tmp/print-debug-demo.log"
mkdir -p "/tmp/logs" "/tmp/component-logs"

echo "=========================================="
echo "Enhanced print-debug v2.0.0 Demo"
echo "=========================================="
echo

###################### Basic Message Types (Enhanced with Timestamps) ######################
echo "1. BASIC MESSAGE TYPES (Now with timestamps and module detection)"
echo "-------------------------------------------------------------------"

$PRINT_DEBUG "This is an info message" -t "info"
$PRINT_DEBUG "This is a warning message" -t "warn"  
$PRINT_DEBUG "This is a success message" -t "success"
$PRINT_DEBUG "This is an error message" -t "error"
$PRINT_DEBUG "This is a debug message" -t "debug"
$PRINT_DEBUG "This is a critical message" -t "critical"

echo
###################### Module and Context Information ######################
echo "2. MODULE AND CONTEXT INFORMATION"
echo "-----------------------------------"

$PRINT_DEBUG "Auto-detected module from script path" -t "info"
$PRINT_DEBUG "Manual module specification" -t "info" -m "wallpaper"
$PRINT_DEBUG "Function context information" -t "debug" -m "waybar" -c "process_icons:142"
$PRINT_DEBUG "Caller function information" -t "info" --caller "generate_waybar_icons"
$PRINT_DEBUG "Combined context and caller" -t "debug" -m "rofi" -c "show_themes:89" --caller "main_selector"

echo
###################### Performance Timer System ######################
echo "3. PERFORMANCE TIMER SYSTEM"
echo "-----------------------------"

$PRINT_DEBUG "Starting wallpaper change operation" -t "info" --start-timer "wallpaper_change" -m "wallpaper"
sleep 1
$PRINT_DEBUG "Intermediate progress check" -t "debug" --show-duration "wallpaper_change" -m "wallpaper"
sleep 1
$PRINT_DEBUG "Wallpaper change completed" -t "success" --end-timer "wallpaper_change" -m "wallpaper"

echo
###################### Advanced Error Reporting ######################
echo "4. ADVANCED ERROR REPORTING"
echo "-----------------------------"

$PRINT_DEBUG "Configuration file not found" -t "error" \
    --error-code "CONFIG_001" \
    --suggestion "Check ~/.config/hypr/hyprland.conf exists" \
    -m "hyprland"

$PRINT_DEBUG "Invalid wallpaper format" -t "error" \
    --error-code "WALLPAPER_002" \
    --suggestion "Convert to PNG or JPEG format using: magick convert input.webp output.png" \
    -m "wallpaper"

echo
###################### Structured JSON Logging ######################
echo "5. STRUCTURED JSON LOGGING"
echo "----------------------------"

$PRINT_DEBUG "Theme configuration applied" -t "info" \
    --json '{"theme":"hyprland-default","colors":["#ff0000","#00ff00","#0000ff"],"path":"/config/waybar/themes/default"}' \
    -m "waybar"

$PRINT_DEBUG "System status report" -t "info" \
    --json '{"cpu_usage":45.2,"memory_usage":67.8,"disk_usage":23.1,"active_processes":156}' \
    -m "system"

echo
###################### Component-Specific Logging ######################
echo "6. COMPONENT-SPECIFIC LOGGING"
echo "-------------------------------"

$PRINT_DEBUG "Waybar theme applied" -t "info" -m "waybar" --component-log
$PRINT_DEBUG "Wallpaper changed successfully" -t "success" -m "wallpaper" --component-log
$PRINT_DEBUG "Rofi selection made" -t "debug" -m "rofi" --component-log

echo "Component logs created:"
ls -la /tmp/component-logs/ 2>/dev/null || echo "No component logs directory found"

echo
###################### System Resource Monitoring ######################
echo "7. SYSTEM RESOURCE MONITORING"
echo "-------------------------------"

$PRINT_DEBUG "System health check" -t "info" --show-resources -m "system"
$PRINT_DEBUG "High resource operation starting" -t "warn" --show-resources -m "system"

echo
###################### Multiple Log Destinations ######################
echo "8. MULTIPLE LOG DESTINATIONS"
echo "------------------------------"

$PRINT_DEBUG "Critical system event" -t "critical" \
    --also-log-to "/tmp/critical-events.log" \
    --also-log-to "/tmp/audit.log" \
    -m "system"

echo "Additional logs created:"
ls -la /tmp/critical-events.log /tmp/audit.log 2>/dev/null || echo "Additional log files not found"

echo
###################### Log Level Filtering ######################
echo "9. LOG LEVEL FILTERING"
echo "-----------------------"

echo "Setting LOG_LEVEL=warn (only warn, error, critical will show):"
export LOG_LEVEL="warn"

$PRINT_DEBUG "This debug message won't show" -t "debug" -m "test"
$PRINT_DEBUG "This info message won't show" -t "info" -m "test"  
$PRINT_DEBUG "This warning message will show" -t "warn" -m "test"
$PRINT_DEBUG "This error message will show" -t "error" -m "test"

# Reset log level
export LOG_LEVEL="debug"

echo
###################### Legacy Features Still Work ######################
echo "10. LEGACY FEATURES (Still Supported)"
echo "---------------------------------------"

$PRINT_DEBUG "uppercase message" -t "info" --upper
$PRINT_DEBUG "message with double line" -t "success" --double-line
$PRINT_DEBUG "message to stderr" -t "warn" --redirect-to-stderr

echo
###################### Complex Real-World Example ######################
echo "11. COMPLEX REAL-WORLD EXAMPLE"
echo "--------------------------------"

# Simulate a complex dotfiles operation
$PRINT_DEBUG "Starting complete wallpaper change workflow" -t "info" \
    --start-timer "complete_workflow" \
    -m "wallpaper" \
    --component-log

$PRINT_DEBUG "Validating wallpaper file" -t "debug" \
    -m "wallpaper" \
    -c "validate_wallpaper:45" \
    --caller "change_wallpaper"

$PRINT_DEBUG "Generating color palette with pywal" -t "info" \
    -m "wallpaper" \
    -c "generate_pywal_colors:89" \
    --show-resources

$PRINT_DEBUG "Updating waybar theme" -t "info" \
    --json '{"old_theme":"default","new_theme":"dynamic","colors_updated":true}' \
    -m "waybar" \
    --component-log

$PRINT_DEBUG "Restarting waybar service" -t "success" \
    -m "waybar" \
    --show-resources

$PRINT_DEBUG "Complete workflow finished" -t "success" \
    --end-timer "complete_workflow" \
    -m "wallpaper"

echo
echo "=========================================="
echo "Demo completed! Check the following logs:"
echo "- Main log: $LOG"
echo "- Component logs: /tmp/component-logs/"
echo "- Additional logs: /tmp/critical-events.log, /tmp/audit.log"
echo "=========================================="
