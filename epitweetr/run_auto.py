# defined four R sciprts which have a function of executing each loop 

import subprocess
import os
from subprocess import Popen, PIPE
import glob

''' make the path automaitcally
path = os.system("S:/Forschungsdaten/Zig/ZiG1/run_epit")
path = os.replace(a for a in file, location) 
'''
file = ['main_loop', 'detect_loop', 'search_loop', 'fs_loop']
#subprocess.run()
#shell=True: string- open another terminal, takes more time / shell=False: list - keep one terminal 
for a in file: # better way?
    print(a)
    subprocess.Popen('my_path/run_epit/%s.R' % a, shell=True)
    #process = subprocess.Popen('Rscript my_path/run_epit/%s.R' % a, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE) #stdout: save output into the variable(process)/ stderr: save error into process
    #rc = process.wait()
    #out, err = process.communicate()
    #print(f'output is: {out}')
    #print(f'error is: {err}')
