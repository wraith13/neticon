@REM
@REM build
@REM


@REM
@REM 準備
@REM

@CALL VERSION.cmd
@SET NETICON_MACRO=
@SET VC_CL_ARG=-D_USING_V110_SDK71_
@IF /I "" NEQ "%~1" CALL "%~dp0%1.cmd"
@IF /I "" NEQ "%~2" CALL "%~dp0%2.cmd"
@IF /I "" NEQ "%~3" CALL "%~dp0%3.cmd"
@IF /I "" NEQ "%~4" CALL "%~dp0%4.cmd"
@SET CALL_VCVARSALL_CMD=%~dp0call.vcvarsall.cmd


@REM
@REM BUILD.h の作成
@REM

@ECHO // このファイルは solomon\build\subcmd\build.cmd で自動生成されたものです。 >BUILD.h
@ECHO #define BUILD %* >>BUILD.h


@REM
@REM VERSION.h の作成
@REM

@ECHO // このファイルは VERSION.cmd の内容を元に solomon\build\subcmd\build.cmd で自動生成されたものです。 >VERSION.h
@ECHO #define VERSION_MAJOR %VERSION_MAJOR% >>VERSION.h
@ECHO #define VERSION_MINOR %VERSION_MINOR% >>VERSION.h
@ECHO #define VERSION_BUILD %VERSION_BUILD% >>VERSION.h


@REM
@REM 本体処理呼び出し
@REM

@CALL "%~dp0vc.build.cmd"
