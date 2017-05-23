#!/bin/bash  
# Asks for input directory where the PDFs to be merged are stored, asks for merged file name, outputs to folder
# Requires imagemagick, runs in a staging folder for now

shopt -s nullglob nocaseglob
convert *.{png,jpg,jpeg} -quality 99 "output.pdf"
exit
