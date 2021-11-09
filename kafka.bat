@echo off
if exist kafka (
  echo kafka already exists
) else (
  echo downloading kafka
  mkdir kafka
  cd kafka

  curl https://dlcdn.apache.org/kafka/3.0.0/kafka_2.12-3.0.0.tgz -o ./kafka.tgh
  tar -xvzf kafka.tgh --strip 1
  echo "kafka downloaded"
  cd ..
)

