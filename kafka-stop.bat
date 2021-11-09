cd kafka

echo "------------stop-zookeeper-server---------------"
bin\windows\zookeeper-server-stop.bat config\zookeeper.properties


echo "------------stop-kafka-server---------------""
bin\windows\kafka-server-stop.bat config\server.properties
cd ..
