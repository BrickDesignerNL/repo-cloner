@ECHO Off

set startDirectory = %cd%
set startDrive = %startDirectory:~0,3%


SET BasePath=%startDrive%[Artificial Intelligence]\
if not exist "%BasePath%" md "%BasePath%"
SET /p UserInputRepository="What repo would you like to clone? "

FOR /F "tokens=1,2,3,4,5 delims=/" %%i in ("%UserInputRepository%") do (
  set domain=%%j
  if "%%j"=="modelscope.cn" (
    set repositoryPublisher=%%l
    set repositoryName=%%m
  ) else (
    set repositoryPublisher=%%k
    set repositoryName=%%l
  )d
)


cd %BasePath%

set str1="%domain%"
if not x%str1:github=%==x%str1% ( set folder=github )
if not x%str1:huggingface=%==x%str1% ( set folder=huggingface )
if not x%str1:modelscope=%==x%str1% ( set folder=modelscope.cn )

if not exist %folder%\ md %folder%

if not x%str1:github=%==x%str1% ( cd %folder% )
if not x%str1:huggingface=%==x%str1% ( cd %folder% )
if not x%str1:modelscope=%==x%str1% (
  cd %folder%
  if not exist models\ (
    mkdir models
  )
  cd models
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
