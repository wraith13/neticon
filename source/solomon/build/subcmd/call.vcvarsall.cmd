@IF /I "" NEQ "%VCVARSALL_PATH%" IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files\Microsoft Visual Studio 14.0\VC\vcvarsall.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=%~dp0..\..\..\..\..\vcvarsall-for-vc2013-ctp\vcvarsall.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files\Microsoft Visual Studio 12.0\VC\vcvarsall.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files\Microsoft Visual Studio 11.0\VC\vcvarsall.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\vcvarsall.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files\Microsoft Visual Studio 10.0\VC\vcvarsall.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files\Microsoft Visual Studio 9.0\VC\vcvarsall.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files (x86)\Microsoft Visual Studio 9.0\VC\vcvarsall.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files\Microsoft Visual Studio 8\VC\bin\vcvars32.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files (x86)\Microsoft Visual Studio 8\VC\bin\vcvars32.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files\Microsoft Visual Studio .NET 2003\Vc7\bin\vcvars32.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files (x86)\Microsoft Visual Studio .NET 2003\Vc7\bin\vcvars32.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files\Microsoft Visual Studio .NET\Vc7\bin\vcvars32.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files (x86)\Microsoft Visual Studio .NET\Vc7\bin\vcvars32.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files\Microsoft Visual Studio\VC98\bin\vcvars32.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@SET VCVARSALL_PATH=C:\Program Files (x86)\Microsoft Visual Studio\VC98\bin\vcvars32.bat
@IF EXIST "%VCVARSALL_PATH%" CALL "%VCVARSALL_PATH%" %*&GOTO :EOF

@COLOR 0C
@ECHO ERROR: not found vcvarsall.bat
