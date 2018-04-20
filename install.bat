rem install

IF "%PLATFORM%" == "mingw64" (
  CALL %APPVEYOR_BUILD_FOLDER%\install_mingw.bat
)

IF "%PLATFORM%" == "cygwin64" (
  CALL %APPVEYOR_BUILD_FOLDER%\install_cygwin.bat
)

IF "%PLATFORM%" == "msvc" (
  CALL %APPVEYOR_BUILD_FOLDER%\install_msvc.bat
)
