#!/usr/bin/python

import json
import sys

if (len(sys.argv) < 2 or  len(sys.argv )> 2):
  print "Usage:  ./jsonConv.py filename "
  sys.exit(0)

with open(sys.argv[1]) as json_file:  
  data = json.load(json_file)
  print(json.dumps(data, indent = 4, sort_keys=True))
