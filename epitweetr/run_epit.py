#from importlib.metadata import files
import subprocess
import os
from subprocess import Popen
from dotenv import load_dotenv
from pathlib import Path 
import glob


load_dotenv()
path = Path(os.getenv("DATA_PATH"))

file = ['main_loop', 'detect_loop', 'search_loop', 'fs_loop']

for a in file: 
    print(f'{a} is starting')
    subprocess.Popen(f'Rscript {path}/functions/%s.R' % a, shell=True)
