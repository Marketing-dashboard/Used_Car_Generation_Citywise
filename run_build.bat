@echo off
cd /d "%~dp0"
echo Running build.py ...
echo.
python build.py
if errorlevel 1 (
    echo.
    echo "python" command failed - trying "python3" instead ...
    python3 build.py
)
echo.
echo ============================================
echo If you saw an error above, read it, fix it,
echo then double-click this file again.
echo ============================================
pause
