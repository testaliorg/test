@echo off
set services="redisspring" "rally" "cat"

(for %%a in (%services%) do (
   call:syncWithGit %%a
))
GOTO:EOF


:syncWithGit
echo "syncing with git" %~1%
IF %~1% == redisspring (
call:clone redisspring https://github.com/Shahajad/redisspring.git
call:updateGit redisspring master
)

IF %~1% == rally (
call:clone rally https://github.com/Shahajad/rally.git
call:updateGit rally main
)
GOTO:EOF


:updateGit
echo.
echo. ----updating repos ---
echo.  %~1  %~2.
cd %~1
echo stashing changes %~2
git stash
echo fetching  %~2
git fetch origin %~2
echo checking out %~2
git checkout %~2%
echo pulling %~2
git pull origin %~2%
cd ..
echo.
GOTO:EOF


:clone
echo.
echo. ----cloning repos ---
if exist %~1%\ (
  echo repo %~1% already exist
) else (
  git clone %~2
)
echo.  %~1  %~2.
echo.
GOTO:EOF