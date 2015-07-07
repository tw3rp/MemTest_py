#!/usr/bin/python -tt

import os
import sys
import commands

def project_simulation(planes,die,blocks):
        file_n="pl_"+str(planes)+"die_"+str(die)+"bl_"+str(blocks)
	cmd="./NANDFlashSim  --devini sample_dev.ini --envini"
        cmd= cmd + " sample_env.ini " + "--plane " +str(planes)        
	cmd= cmd + " --die " + str(die) + " --blocks " + str(blocks)
	print "Running Command:" + cmd
	(status, output) =commands.getstatusoutput(cmd)
	if status:
		print "ERROR"
		print sys.stderr
		sys.exit(1)
	else:
		file = '../results_block/'+ file_n +'.txt'
		f= open(file,"wb")
		f.write(output)
		f.close()
def parameters():
	planes = [2]
	die = [2]
	blocks = [1024,2048,4096]
	for nu_dies in die:
		for nu_planes in planes:
			for nu_blocks in blocks:
				project_simulation(nu_planes,nu_dies,nu_blocks)

def main():
	print "starting nandflash simulation"
	parameters();
	print"completed"

if __name__ == '__main__':
	main()
	


