rem after_build

 7z a -so -ttar -r dummy *.obj *.lib *.inc *.tmp *.res *.manifest include bin/clang-tblgen.exe bin/llvm-tblgen.exe .ninja_deps .ninja_log | 7z a -si -tgzip -bd -bso0 swift_llvm_cache.tar.gz
 DIR
 MOVE swift_llvm_cache.tar.gz %APPVEYOR_BUILD_FOLDER%
 DIR %APPVEYOR_BUILD_FOLDER%
