@REM
@REM build
@REM

@REM
@REM €”õ
@REM

@SET BUILD_NAME=%~n0
@SET BUILD_BODY_CMD=%~dp0subcmd\build.cmd

@REM
@REM –{‘Ìˆ—ŒÄ‚Ño‚µ
@REM

@CALL "%BUILD_BODY_CMD%" %~n0
