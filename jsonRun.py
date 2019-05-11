#!/usr/bin/python

import json
import sys

if (len(sys.argv) < 2 or  len(sys.argv )> 2):
  print "Usage:  ./jsonConv.py filename "
  sys.exit(0)

with open(sys.argv[1]) as json_file:  
  data = json.load(json_file)
  #print(json.dumps(data, indent = 4, sort_keys=True))
  for ev in data["traceEvents"]:
    if "dur" in ev:
      for ev_key in ev:
        print ev_key, ev[ev_key]
  #for it in data:
    #for att,v in it.iteritems():
    #print it , data[it]
    #print it 
