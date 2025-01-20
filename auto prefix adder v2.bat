@echo off
setlocal enabledelayedexpansion

REM 检查是否拖拽了文件
if "%~1"=="" (
    echo 请将文件拖拽到 rename.bat 上来进行批量重命名。
    exit /b
)

REM 遍历所有拖拽的文件
for %%F in (%*) do (
    REM 获取文件名和扩展名
    for %%A in ("%%~nxF") do (
        set "fileName=%%~nxA"
    )

    REM 获取当前文件的完整路径，包括驱动器号
    set "fullPath=%%~dpF"

    REM 获取当前文件所在目录名，处理包含特殊字符的路径
    for /f "delims=\" %%I in ("!fullPath!") do set "currentFolder=%%~nxI"

    REM 构建新的文件名
    set "newName=!currentFolder!!fileName!"

    REM 执行重命名操作
    ren "%%~F" "!newName!"
    echo 文件已成功重命名为：!newName!
)