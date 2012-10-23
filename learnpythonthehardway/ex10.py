tabby_cat = "\tI'm tabbed in."
persian_cat = "I'm split\non a line."
backslash_cat = "I'm \\ a \\ cat"

fat_cat = '''
I'll do a list:
\t* Cat food
\t* Fishies
\t*Catnip\n\t*Grass
'''

print "print"
print tabby_cat
print persian_cat
print backslash_cat
print fat_cat

print "print %r"
print "%r" % tabby_cat
print "%r" % persian_cat
print "%r" % backslash_cat
print "%r" % fat_cat


print "print %s"
print "%s" % tabby_cat
print "%s" % persian_cat
print "%s" % backslash_cat
print "%s" % fat_cat
