
#!/bin/bash  
# Asks for input directory where the PDFs to be merged are stored, asks for merged file name, outputs to folder
# Requires imagemagick, runs in a staging folder for now

shopt -s nullglob nocaseglob
convert "$1"/*.{png,jpg,jpeg} "output.pdf"
exit
