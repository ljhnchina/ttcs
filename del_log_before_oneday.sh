/*
清理日志
cron 0 23 * * *
 */
#!/bin/bash
echo “开始清理日志”
find ../log -mtime +1 -name “*.log” -exec rm -rf {} \;
echo “清理日志完成”;