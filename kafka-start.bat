@echo off
cd kafka

echo "------------start-kafka-zookeeper---------------"
start bin\windows\zookeeper-server-start.bat config\zookeeper.properties

echo "wait for zookeeper"
sleep 45

echo "------------start-kafka-server---------------""
start bin\windows\kafka-server-start.bat config\server.properties
cd ..
