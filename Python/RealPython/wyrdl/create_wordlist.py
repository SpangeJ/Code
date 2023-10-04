# create_wordlist.py

import pathlib
import sys
from string import ascii_letters

in_path = pathlib.Path(sys.argv[1])
out_path = pathlib.Path(sys.argv[2])