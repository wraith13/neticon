@REM
@REM リリースパッケージの作成
@REM

@REM
@REM 環境変数の初期化
@REM

@SET NETICON_RELEASE_DIR=%~dp0release
@SET NETICON_BUILD=release x86 unicode
@SET SOLOMON_7ZIP_EXE=C:\Program Files\7-Zip\7z.exe

@SET SOLOMON_CONFIG_DIR=%~dp0source\solomon\conf
@SET SOLOMON_CONFIG_CMD=%SOLOMON_CONFIG_DIR%\config.cmd
@SET SOLOMON_CONFIG_LOCALHOST_CMD=%SOLOMON_CONFIG_DIR%\config.%COMPUTERNAME%.cmd
@SET SOLOMON_CONFIG_LOCALHOST_USER_CMD=%SOLOMON_CONFIG_DIR%\config.%COMPUTERNAME%.%USERNAME%.cmd

@REM
@REM SOLOMON共通設定ファイルの読み込み
@REM

@REM solomon\conf\config.cmd の読み込み
@IF NOT EXIST "%SOLOMON_CONFIG_CMD%" COLOR 0C&ECHO CONFIG-ERROR: 設定ファイル "%SOLOMON_CONFIG_CMD%" が存在しません。&GOTO :EOF
@CALL "%SOLOMON_CONFIG_CMD%"

@REM solomon\conf\config.%COMPUTERNAME%.cmd がある場合はそちらも読み込む
@IF EXIST "%SOLOMON_CONFIG_LOCALHOST_CMD%" CALL "%SOLOMON_CONFIG_LOCALHOST_CMD%"

@REM solomon\conf\config.%COMPUTERNAME%.%USERNAME%.cmd がある場合はそちらも読み込む
@IF EXIST "%SOLOMON_CONFIG_LOCALHOST_USER_CMD%" CALL "%SOLOMON_CONFIG_LOCALHOST_USER_CMD%"


@REM
@REM 7zip の存在確認
@REM

:ZIP_TOOL_CHECK
@IF NOT EXIST "%SOLOMON_7ZIP_EXE%" COLOR 0C&ECHO %SOLOMON_MESSAGE_PREFIX%CONFIG-ERROR: "%SOLOMON_7ZIP_EXE%"が見つかりません。7zipがインストールされていないとZIPファイル作成機能は利用できません。設定を確認してください。&GOTO :EOF
:ZIP_TOOL_CHECK_END


@REM
@REM 出力先ディレクトリの作成
@REM

@IF NOT EXIST "%NETICON_RELEASE_DIR%" MKDIR "%NETICON_RELEASE_DIR%"


@REM
@REM 出力先パスの作成
@REM

@CALL "%~dp0snapshot\result\%NETICON_BUILD%\VERSION.cmd"
@SET NETICON_RELEASE_ZIP=%NETICON_RELEASE_DIR%\neticon-%VERSION_MAJOR%.%VERSION_MINOR%.%VERSION_BUILD%.zip


@REM
@REM パッケージ作成
@REM

@CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%NETICON_RELEASE_ZIP%" "%~dp0snapshot\result\%NETICON_BUILD%\neticon.exe" >NUL
@CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%NETICON_RELEASE_ZIP%" "%~dp0LICENSE_1_0.txt" >NUL
@REM CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%NETICON_RELEASE_ZIP%" "%~dp0readme.txt" >NUL
@REM CALL "%SOLOMON_7ZIP_EXE%" a -tzip "%NETICON_RELEASE_ZIP%" "%~dp0history.txt" >NUL

@ECHO リリース用パッケージ %NETICON_RELEASE_ZIP% を作成しました。
@ECHO 含まれるべきファイルが含まれていることと含まれるべきでないファイルが含まれていないことをディレクトリ差分比較ツールでチェックしてください。
@ECHO history.txt を編集し忘れている場合は正しく編集した上でこのコマンドを再度実行してリリース用パッケージを作成し直してください。
