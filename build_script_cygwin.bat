rem build_script

rem Build clang
rem We do not compile all of them because it takes longer than an hour which is allowed by free appveyor account.
rem Remainder will be compiled in the llvm-builder.
 MKDIR %WORK_DIR%\build\Ninja-ReleaseAssert\llvm-cygwin-x86_64
 CD %WORK_DIR%/build/Ninja-ReleaseAssert/llvm-cygwin-x86_64
 SET WORK_DIR_IN_CYGWIN=/cygdrive/c/projects
 cmake -G Ninja -DCMAKE_C_COMPILER:PATH=/usr/bin/clang -DCMAKE_CXX_COMPILER:PATH=/usr/bin/clang++ -DLLVM_VERSION_MAJOR:STRING=4 ^
    -DLLVM_VERSION_MINOR:STRING=0 -DLLVM_VERSION_PATCH:STRING=0 -DCLANG_VERSION_MAJOR:STRING=4 -DCLANG_VERSION_MINOR:STRING=0   ^
    -DCLANG_VERSION_PATCH:STRING=0 -DCMAKE_MAKE_PROGRAM=/usr/bin/ninja -DLLVM_ENABLE_ASSERTIONS=TRUE                            ^
    '-DLLVM_TARGETS_TO_BUILD=X86;ARM;AArch64;PowerPC;SystemZ' -DCMAKE_LIBTOOL:PATH=/usr/bin/libtool                             ^
    '-DCMAKE_C_FLAGS=  -Wno-unknown-warning-option -Werror=unguarded-availability-new -fno-stack-protector'                     ^
    '-DCMAKE_CXX_FLAGS=  -Wno-unknown-warning-option -Werror=unguarded-availability-new -fno-stack-protector'                   ^
    '-DCMAKE_C_FLAGS_RELWITHDEBINFO=-O2 -DNDEBUG' '-DCMAKE_CXX_FLAGS_RELWITHDEBINFO=-O2 -DNDEBUG' -DCMAKE_BUILD_TYPE:STRING=Release   ^
    -DLLVM_TOOL_SWIFT_BUILD:BOOL=NO -DLLVM_INCLUDE_DOCS:BOOL=TRUE -DLLVM_ENABLE_LTO:STRING= -DLLVM_TOOL_COMPILER_RT_BUILD:BOOL=TRUE   ^
    -DLLVM_BUILD_EXTERNAL_COMPILER_RT:BOOL=TRUE -DLLVM_LIT_ARGS=-sv -DCMAKE_INSTALL_PREFIX:PATH=/usr/ -DINTERNAL_INSTALL_PREFIX=local ^
    %WORK_DIR_IN_CYGWIN%/llvm
 ninja lib/libclangAnalysis.a lib/libclangAPINotes.a lib/libclangARCMigrate.a lib/libclangAST.a lib/libclangASTMatchers.a lib/libclangBasic.a ^
    lib/libclangCodeGen.a lib/libclangDriver.a lib/libclangEdit.a lib/libclangFormat.a                                                        ^
    lib/libclangFrontend.a lib/libclangFrontendTool.a lib/libclangIndex.a lib/libclangLex.a lib/libclangParse.a lib/libclangRewrite.a         ^
    lib/libclangRewriteFrontend.a lib/libclangSema.a lib/libclangSerialization.a lib/libclangStaticAnalyzerCheckers.a                         ^
    lib/libclangStaticAnalyzerCore.a lib/libclangStaticAnalyzerFrontend.a lib/libclangToolingCore.a lib/libLLVMAArch64AsmParser.a             ^
    lib/libLLVMAArch64AsmPrinter.a lib/libLLVMAArch64CodeGen.a lib/libLLVMAArch64Desc.a lib/libLLVMAArch64Disassembler.a                      ^
    lib/libLLVMAArch64Info.a lib/libLLVMAArch64Utils.a lib/libLLVMAnalysis.a lib/libLLVMARMAsmParser.a lib/libLLVMARMAsmPrinter.a             ^
    lib/libLLVMARMCodeGen.a lib/libLLVMARMDesc.a lib/libLLVMARMDisassembler.a lib/libLLVMARMInfo.a lib/libLLVMAsmParser.a lib/libLLVMAsmPrinter.a ^
    lib/libLLVMBitReader.a lib/libLLVMBitWriter.a lib/libLLVMCodeGen.a lib/libLLVMCore.a lib/libLLVMCoroutines.a
