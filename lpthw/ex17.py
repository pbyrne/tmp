from sys import argv
from os.path import exists

script, from_file, to_file = argv

print "Copying from %s to %s" % (from_file, to_file)

indata = open(from_file).read()

print "The imnput file is %d bytes log" % len(indata)

print "Does the output file exist? %r" % exists(to_file)
print "Ready, hit RETURN to continue, CTRL-C to abort"
raw_input()

output = open(to_file, 'w')
output.write(indata)

print "Alright, all done."

output.close()
