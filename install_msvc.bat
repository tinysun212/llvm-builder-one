rem install

rem Set Environment Variables
 SET PATH_ORIGINAL=%PATH%
 SET WORK_DIR=c:\projects
 CD %WORK_DIR%
  
rem Install packages
 choco install -y ninja
 choco install -y wget
  
rem Download source
 CD %WORK_DIR%
rem llvm source
 wget -q -O llvm_src.tar.gz https://github.com/tinysun212/swift-llvm/archive/swift-windows-4.0-branch.tar.gz
rem Extract gz and then extract tar in silent mode(-bd -bso0)
 7z x llvm_src.tar.gz -so | 7z x -si -ttar -bd -bso0
 MOVE pax_global_header llvm_commit_id
 MOVE swift-llvm-swift-windows-4.0-branch llvm
rem clang source
 wget -q -O clang_src.tar.gz https://github.com/tinysun212/swift-clang/archive/swift-windows-4.0-branch.tar.gz
 7z x clang_src.tar.gz -so | 7z x -si -ttar -bd -bso0
 MOVE pax_global_header clang_commit_id
 MOVE swift-clang-swift-windows-4.0-branch clang
rem link clang into llvm
 CD %WORK_DIR%/llvm/tools
 MKLINK /D clang ..\..\clang
 
