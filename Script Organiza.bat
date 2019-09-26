@echo off

set /p nomepasta2=Digite o nome da pasta:
if not exist "nomepasta2" (
mkdir "C:\Users\Servidor\Desktop\enviar\envia_cliente\%nomepasta2%")

set nomepasta="%date:/=_%"

if not exist "%date:/=_%" (
mkdir "C:\Users\Servidor\Desktop\enviar\padrao\01_Desenvolvimento\01_Originais\%nomepasta%"

xcopy /E C:\Users\Servidor\Desktop\enviar\arquivos\*.* C:\Users\Servidor\Desktop\enviar\padrao\01_Desenvolvimento\01_Originais\%nomepasta%

rmdir /S /Q C:\Users\Servidor\Desktop\enviar\arquivos
mkdir "C:\Users\Servidor\Desktop\enviar\arquivos")

xcopy /E C:\Users\Servidor\Desktop\enviar\padrao\*.* C:\Users\Servidor\Desktop\enviar\envia_cliente\%nomepasta2%

attrib +h "C:\Users\Servidor\Desktop\enviar\padrao\01_Desenvolvimento\01_Originais\00_Imagens_Originais"   
for /D %%i IN (C:\Users\Servidor\Desktop\enviar\padrao\01_Desenvolvimento\01_Originais\*) DO RD /s /q "%%i"   
attrib -h "C:\Users\Servidor\Desktop\enviar\padrao\01_Desenvolvimento\01_Originais\00_Imagens_Originais"   


:start
ECHO.
ECHO 1. CLIENTE1
ECHO 2. CLIENTE2
ECHO 3. CLIENTE3


set /p choice=Digite o numero do cliente.
rem if not '%choice%'=='' set choice=%choice:~0;1% (don`t use this command, because it takes only first digit in the case you type more digits. After that for example choice 23455666 is choice 2 and you get "bye"
if '%choice%'=='' ECHO "%choice%" is not valid please try again
if '%choice%'=='1' goto cliente1
if '%choice%'=='2' goto cliente2
if '%choice%'=='3' goto cliente3


ECHO.
goto start

:cliente1
ECHO ENVIANDO ARQUIVOS PARA A PASTA CLIENTE1
xcopy /E C:\Users\Servidor\Desktop\enviar\envia_cliente\*.* \\prepress2\prepress3\SERVIDOR_ARTE\02_BL\CLIENTE1
rmdir /S /Q C:\Users\Servidor\Desktop\enviar\envia_cliente
mkdir "C:\Users\Servidor\Desktop\enviar\envia_cliente"
goto end

:cliente2
ECHO ENVIANDO ARQUIVOS PARA A PASTA CLIENTE2
xcopy /E C:\Users\Servidor\Desktop\enviar\envia_cliente\*.* \\prepress2\prepress3\SERVIDOR_ARTE\01_BE\CLIENTE2
rmdir /S /Q C:\Users\Servidor\Desktop\enviar\envia_cliente
mkdir "C:\Users\Servidor\Desktop\enviar\envia_cliente"
goto end

:cliente3
ECHO ENVIANDO ARQUIVOS PARA A PASTA CLIENTE3
xcopy /E C:\Users\Servidor\Desktop\enviar\envia_cliente\*.* \\prepress2\prepress3\SERVIDOR_ARTE\02_BL\CLIENTE3
rmdir /S /Q C:\Users\Servidor\Desktop\enviar\envia_cliente
mkdir "C:\Users\Servidor\Desktop\enviar\envia_cliente"
goto end



:end
pause
exit





)