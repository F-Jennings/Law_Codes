#!/bin/bash  
# Asks for input directory where the PDFs to be merged are stored, asks for merged file name, outputs to folder
# Requires ghostscript

echo First select the input directory
dirs=(*/)

read -p "$(
        f=0
        for dirname in "${dirs[@]}" ; do
                echo "$((++f)): $dirname"
        done

        echo -ne 'Please select a directory > '
)" selection

selected_dir="${dirs[$((selection-1))]}"

echo "You selected '$selected_dir'"

echo Now enter the merged file name
read merged

read -p "Okay go? Press any key" -n1 -s #Give user time to cancel if they messed up

gs -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -sOutputFile=[$emrged].pdf [$selected_dir]/*.pdf
