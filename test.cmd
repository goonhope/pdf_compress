@echo off
title PDF compress by ghostscript:
echo pdf compress by ghostscript:
::-dColorImageResolution=100 == -r100 dQUIET == q

for %%i in (*.pdf) do (
gswin64c -sDEVICE=pdfwrite -dCompatibilityLevel=1.7 -dDownsampleColorImages=true -r72 -dNOPAUSE  -q  -dBATCH -dEmbedAllFonts=false -dDownsampleColorImages=true -dDownsampleGrayImages=true -dDownsampleMonoImages=true  -dCompressFonts=true -sOutputFile=%%~dpni_gs.pdf  %%~fi
)


echo pdf compress by magick-mode-zip:
for /f %%i in ('dir /b *.pdf ^|find "_" /v ') do magick convert -compress zip %%~fi %%~dpni_magcik_zip.pdf


echo pdf compress by magick-mode-jpeg:
for /f %%i in ('dir /b *.pdf ^|find "_" /v ')do magick convert -compress jpeg %%~fi %%~dpni_magcik_jpeg.pdf


echo pdf info
for %%i in (*.pdf) do echo %%i=============== >> pdf.log & cpdf -info %%i >>pdf.log

