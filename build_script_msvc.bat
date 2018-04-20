rem build_script

  # Build clang
  - MKDIR %WORK_DIR%\build\NinjaMSVC\llvm
  - CD %WORK_DIR%/build/NinjaMSVC/llvm
  - CALL "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvars64.bat"
  - cmake -G "Ninja" -DCMAKE_C_COMPILER=clang-cl -DCMAKE_CXX_COMPILER=clang-cl -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_CXX_FLAGS="-DLLVM_ENABLE_DUMP" ..\..\..\llvm
  # We do not compile all of them because it takes longer than an hour which is allowed by free appveyor account.
  # Remainder will be compiled in the llvm-builder.
  - ninja lib/clangAnalysis.lib lib/clangAPINotes.lib lib/clangARCMigrate.lib lib/clangAST.lib lib/clangASTMatchers.lib
    lib/clangBasic.lib lib/clangCodeGen.lib lib/clangDriver.lib lib/clangEdit.lib lib/clangFormat.lib
    lib/clangFrontend.lib lib/clangFrontendTool.lib lib/clangIndex.lib lib/clangLex.lib lib/clangParse.lib lib/clangRewrite.lib
    lib/clangRewriteFrontend.lib lib/clangSema.lib lib/clangSerialization.lib lib/clangStaticAnalyzerCheckers.lib
    lib/clangStaticAnalyzerCore.lib lib/clangStaticAnalyzerFrontend.lib lib/clangToolingCore.lib lib/LLVMAArch64AsmParser.lib
    lib/LLVMAArch64AsmPrinter.lib lib/LLVMAArch64CodeGen.lib lib/LLVMAArch64Desc.lib lib/LLVMAArch64Disassembler.lib
    lib/LLVMAArch64Info.lib lib/LLVMAArch64Utils.lib lib/LLVMAnalysis.lib lib/LLVMARMAsmParser.lib lib/LLVMARMAsmPrinter.lib
    lib/LLVMARMCodeGen.lib lib/LLVMARMDesc.lib lib/LLVMARMDisassembler.lib lib/LLVMARMInfo.lib lib/LLVMAsmParser.lib lib/LLVMAsmPrinter.lib
    lib/LLVMBitReader.lib lib/LLVMBitWriter.lib lib/LLVMCodeGen.lib lib/LLVMCore.lib lib/LLVMCoroutines.lib
