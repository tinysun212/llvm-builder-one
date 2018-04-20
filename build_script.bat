rem build_script

IF "%PLATFORM%" == "mingw64" (
  CALL %APPVEYOR_BUILD_FOLDER%\build_script_mingw.bat
)

IF "%PLATFORM%" == "cygwin64" (
  CALL %APPVEYOR_BUILD_FOLDER%\build_script_cygwin.bat
)

IF "%PLATFORM%" == "msvc" (
  CALL %APPVEYOR_BUILD_FOLDER%\build_script_msvc.bat
)
