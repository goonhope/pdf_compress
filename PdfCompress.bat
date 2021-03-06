@echo off
title PDF compress by ghostscript:

echo pdf compress by ghostscript:
for %%i in (*.pdf) do (
gswin64c -sDEVICE=pdfwrite -dCompatibilityLevel=1.7 -dDownsampleColorImages=true -r72 -dNOPAUSE  -q  -dBATCH -dEmbedAllFonts=false  -sOutputFile=%%~dpni_gs.pdf  %%~fi
)
pause

echo pdf compress by magick-mode-zip:
for %%i in (*.pdf) do magick convert -compress zip %%~fi %%~dpni_magcik_zip.pdf
pause

echo pdf compress by magick-mode-jpeg:
for %%i in (*.pdf) do magick convert -compress jpeg %%~fi %%~dpni_magcik_jpeg.pdf
pause
