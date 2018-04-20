rem after_build

IF "%PLATFORM%" == "mingw64" (
  CALL %APPVEYOR_BUILD_FOLDER%\after_build_mingw.bat
)

IF "%PLATFORM%" == "cygwin64" (
  CALL %APPVEYOR_BUILD_FOLDER%\after_build_cygwin.bat
)

IF "%PLATFORM%" == "msvc" (
  CALL %APPVEYOR_BUILD_FOLDER%\after_build_msvc.bat
)
