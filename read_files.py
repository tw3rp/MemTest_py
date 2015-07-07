#!/usr/bin/env python 
import re,os

path ="../results"
my_library = os.listdir(path)
#print my_library
iops = []
for config in my_library:
	file = os.path.join(path, config)
	text = open(file,"r")
	#print text
	for line in text:
	       # print line
	#        m = re.match(r"rahul\s{2,}:(\d+)",line)
		m = re.match(r"IOPS\s*\W*\s*including\s*idle\s*time\s{2,}:(\d*\.\d+|\d+)",line)
		print m
		if m:
			iops.append(m.group(1))
print iops
