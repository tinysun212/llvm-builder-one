rem install

rem Set Environment
 'echo End intall at: & time /t'
 SET PATH_ORIGINAL=%PATH%
 SET "PATH_MINGW64=c:\msys64\mingw64\bin;c:\msys64\usr\bin"
 SET PATH=%PATH_MINGW64%;%PATH_ORIGINAL%
 SET WORK_DIR=c:\projects
 SET GIT_TAG_OR_BRANCH=swift-4.1.3+mingw.20181009
 SET TAG_OR_BRANCH_IN_FOLDER=swift-4.1.3-mingw.20181009  
 CD %WORK_DIR%

rem Install packages
 pacman -S --noconfirm mingw-w64-x86_64-cmake
 pacman -S --noconfirm mingw-w64-x86_64-ninja
 pacman -S --noconfirm mingw-w64-x86_64-clang
 pacman -S --noconfirm mingw-w64-x86_64-winpthreads
 pacman -S --noconfirm mingw-w64-x86_64-pkg-config
 pacman -S --noconfirm mingw-w64-x86_64-dlfcn
 pacman -S --noconfirm python
 pacman -S --noconfirm mingw-w64-x86_64-python2

rem Download source
 CD %WORK_DIR%

rem llvm source
 wget -q -O llvm_src.tar.gz https://github.com/tinysun212/swift-llvm/archive/%GIT_TAG_OR_BRANCH%.tar.gz
 tar zxf llvm_src.tar.gz
 MOVE swift-llvm-%TAG_OR_BRANCH_IN_FOLDER% llvm

rem clang source
 wget -q -O clang_src.tar.gz https://github.com/tinysun212/swift-clang/archive/%GIT_TAG_OR_BRANCH%.tar.gz
rem The Windows native symbolic link system cann't create a symbolic link to non-exist target.
rem 7z solved this problem by creating empty file.
 7z x clang_src.tar.gz -so | 7z x -si -ttar -bd -bso0
 MOVE pax_global_header clang_commit_id
 MOVE swift-clang-%TAG_OR_BRANCH_IN_FOLDER% clang

rem link clang into llvm
 CD %WORK_DIR%/llvm/tools
 MKLINK /d clang ..\..\clang
