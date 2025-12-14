@ECHO Off

set startDirectory = %cd%
set startDrive = %startDirectory:~0,3%


SET BasePath=%startDrive%[Artificial Intelligence]\
SET /p UserInputRepository="What repo would you like to clone? "

FOR /F "tokens=1,2,3,4,5 delims=/" %%i in ("%UserInputRepository%") do (
  set domain=%%j
  if "%%j"=="modelscope.cn" (
    set repositoryPublisher=%%l
    set repositoryName=%%m
  ) else (
    set repositoryPublisher=%%k
    set repositoryName=%%l
  )
)


cd %BasePath%

set str1="%domain%"
if not x%str1:github=%==x%str1% ( cd github )
if not x%str1:huggingface=%==x%str1% ( cd huggingface )
if not x%str1:modelscope=%==x%str1% (
  cd modelscope.cn
REM  if not exist models\ (
REM    mkdir models
REM  )
REM  cd models
)

if not exist %repositoryPublisher%\ (
  mkdir %repositoryPublisher%
) 
cd %repositoryPublisher%

echo =======================================================================
echo Start cloning https://%domain%/%repositoryPublisher%/%repositoryName%
echo =======================================================================

git clone https://%domain%/%repositoryPublisher%/%repositoryName%

echo =======================================================================
echo done
echo =======================================================================
cd ..
cd ..
