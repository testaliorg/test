@echo off

set services="redisspring" "rally" "cat"
(for %%a in (%services%) do (
   kafka\bin\windows\kafka-topics.bat --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic %%a
))
GOTO:EOF

echo "list kafka topics"
kafka\bin\windows\kafka-topics.bat --list --bootstrap-server localhost:9092