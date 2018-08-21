#!/usr/bin/env python3
# file: IP_harvester.py

'''
This:
> imports modules for filesystem reading, pdf review, csv writing
> Prompt user for inputs
> Pull all listed IP addresses from files list
> Outputs IPs to CSV with attending lines
> sorts by filename
'''

import csv, re, sys, glob, os, mmap
import tkFileDialog
#from PyPDF2 import PdfFileReader

directory = tkFileDialog.askdirectory(initialdir="/",  title='Please select a directory')
print ('okay, checking', directory, 'for IP addresses')

#define IP address
def is_IP():
	re.findall("\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}")
### FIX ME HERE

#setup empty IP and file lists
iplist = []
			
filelist = []
	
#Check files
for file in glob.glob("*.txt"):
	f = open ( file, 'r')
	for line in file:
		if is_IP in line:
			iplist.append(line)
			filelist.append(file)



# Print list results to make sure it's not all gibberish

print iplist
print filelist
			
# Send output to .csv file [should work?]

#Define headers and rows
#headers = ['IP Address', 'File Name']
rows = ('IP Address',iplist,'File Name', filelist)

with open('IP_results.csv','w') as csvfile:
	writer = csv.writer(csvfile)
	writer.writerows(rows)
exit
