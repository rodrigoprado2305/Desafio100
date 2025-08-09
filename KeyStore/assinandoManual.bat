@echo off
setlocal

set JAVA_BIN="C:\Program Files\Eclipse Adoptium\jdk-17.0.9.9-hotspot\bin"
set KEYSTORE="D:\github\Rod\Desafio100\KeyStore\ChaveDesafio100.keystore"
set AAB="D:\github\Rod\Desafio100\Android64\Release\Desafio100\bin\Desafio100.aab"
set ALIAS=desafio100key
set STOREPASS=Rod191072*
set KEYPASS=Rod191072*

%JAVA_BIN%\jarsigner.exe -verbose -sigalg SHA256withRSA -digestalg SHA-256 ^
 -keystore %KEYSTORE% -storepass %STOREPASS% -keypass %KEYPASS% ^
 %AAB% %ALIAS%

echo.
echo ✅ AAB assinado com sucesso!
pause
