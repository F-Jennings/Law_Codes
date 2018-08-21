#/bin/bash
#Use case is for comparing the MD5 hashes of two different directories. If directories are 100% identical (timestamps, metadata, and all) it will return the same value for both.
#If they have even minor differences, the values will be different. This can be used for fine-parsing a deduplication task.
#prompt to select directory 1
Dir1=""

Dir1=$(zenity --file-selection \
	--title "Select First Directory" \
	--directory --confirm-overwrite)

echo "you set Directory 1 to $Dir1"

#prompt to select directory 2
Dir2=""

Dir2=$(zenity --file-selection \
	--title "Select Second Directory" \
	--directory --confirm-overwrite)

echo "you set Directory 2 to $Dir2"

#Hash files in Dir1 & Dir2
md5deep -re "$Dir1" > dir1sums
md5deep -re "$Dir2" > dir2sums

#Compare!
diff dir1sums dir2sums > diff_output.txt
md5deep -X dir1sums -r "$Dir2"

#rm dir1sums
#rm dir2sums

exit
