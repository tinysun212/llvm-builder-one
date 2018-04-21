rem after_build

rem Make cache to continue in llvm-builder
 find . -name *.obj -o -name *.a -o -name *.inc -o -name *.tmp > tar_file.list
 tar zcvf swift_llvm_cache.tar.gz -T tar_file.list include bin/clang-tblgen.exe bin/llvm-tblgen.exe .ninja_deps .ninja_log
 mv swift_llvm_cache.tar.gz %APPVEYOR_BUILD_FOLDER%
