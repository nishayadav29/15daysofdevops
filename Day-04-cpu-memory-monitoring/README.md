# Day 04 – CPU & Memory Monitoring

## Objective
Monitor system CPU and memory usage using a Bash script and raise alerts when usage crosses safe thresholds.

## Tools Used
- Linux
- Bash
- top
- free

## How It Works
- Fetches CPU usage from `top`
- Fetches memory usage from `free`
- Compares usage against thresholds
- Displays warnings if limits are exceeded

## How to Run
```bash
chmod +x monitor.sh
./monitor.sh
