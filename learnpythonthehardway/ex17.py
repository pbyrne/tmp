from sys import argv
from os.path import exists

script, from_file, to_file = argv

indata = open(from_file).read()
outfile = open(to_file, 'w')
outfile.write(indata)
outfile.close()
