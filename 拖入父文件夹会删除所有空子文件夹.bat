@echo off
setlocal

REM 检查是否传递了文件夹路径作为参数
IF "%~1"=="" (
    echo 请将要处理的文件夹拖拽到该批处理文件上。
    pause
    exit /b
)

REM 获取拖拽的文件夹路径
set "folder=%~1"

REM 切换到目标文件夹
pushd "%folder%" || (
    echo 文件夹路径无效。
    pause
    exit /b
)

REM 递归删除空文件夹
for /f "delims=" %%d in ('dir /ad /s /b ^| sort /r') do rd "%%d" 2>nul

REM 返回原始目录
popd

echo 删除完成。