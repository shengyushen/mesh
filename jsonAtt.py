#!/usr/bin/python

import json
import sys

if (len(sys.argv) < 2 or  len(sys.argv )> 2):
  print "Usage:  ./jsonConv.py filename "
  sys.exit(0)

jf=open(sys.argv[1])
data = json.load(jf)
for ev in data["traceEvents"]:
  if "dur" in ev:
    for ev_key in ev:
      print ev_key, ev[ev_key]
