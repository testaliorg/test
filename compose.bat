@echo off
set services="redisspring" "rally" "cat"

(for %%a in (%services%) do (
   docker --version
   TIMEOUT 10
))
GOTO:EOF