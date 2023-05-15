::convert pdf to png
::requires poppler
::v1: 2022-05-22
::get it here https://github.com/oschwartz10612/poppler-windows/releases/

::usage:
::   pngify <filename>

@echo off

if %1 == [] goto :eof

set file=%1
set file2=%file:pdf=png%

pdftoppm -png %file% %file2%

:eof