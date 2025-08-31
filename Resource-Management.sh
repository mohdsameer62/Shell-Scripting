#!/bin/bash

# A short script to report system resource usage.

# --- Configuration ---
# Set the filesystems to report on (e.g., "/", "/home").
FILESYSTEMS_TO_MONITOR=("/")

# --- Report Generation ---

# Get CPU and Memory usage percentages.
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}' | cut -d. -f1)
MEM_USAGE=$(free -m | awk 'NR==2{printf "%.0f", $3*100/$2}')

# Display the report.
echo "--- System Resource Report [$(hostname)] ---"
echo ""
echo "📊 CPU Usage    : ${CPU_USAGE}%"
echo "🧠 Memory Usage : ${MEM_USAGE}%"
echo ""
echo "💾 Filesystem Usage:"
df -h "${FILESYSTEMS_TO_MONITOR[@]}"
echo ""
echo "--- Top 5 Processes (by CPU) ---"
ps aux --sort=-%cpu | head -n 10
echo ""
echo "--- Top 5 Processes (by Memory) ---"
ps aux --sort=-%mem | head -n 10