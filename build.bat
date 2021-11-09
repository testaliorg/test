@echo off
set services="redisspring" "rally" "cat"

(for %%a in (%services%) do (
   call:buildService %%a
))
GOTO:EOF


:buildService
echo "building service" %~1%

IF %~1% == redisspring (
    call:buildCommon redisspring
)

IF %~1% == rally (
echo add build for rally
@REM call:buildCommon rally
)
TIMEOUT 10
GOTO:EOF


:buildCommon
echo.
echo. ----building repos --- %~1%
cd %~1%
powershell -Command "(gc src/main/resources/application.properties) -replace 'server.port=8080', 'server.port=8081' | Out-File -encoding ASCII src/main/resources/application.properties"
powershell -Command "mvn clean install -DskipTests -U"
powershell -Command "(gc src/main/resources/application.properties) -replace 'server.port=8081', 'server.port=8080' | Out-File -encoding ASCII src/main/resources/application.properties"
cd..
echo.
GOTO:EOF