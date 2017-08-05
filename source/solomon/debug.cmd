@CALL "%~dp0build.cmd" "debug x86 ansi" %*
@PUSHD "%~dp0..\..\snapshot\result\debug x86 ansi"
"%~dp0..\..\snapshot\result\debug x86 ansi\neticon.exe"
@POPD
