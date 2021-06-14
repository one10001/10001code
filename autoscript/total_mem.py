#!/usr/bin/python
import os
  
# Getting all memory using os.popen()
total_memory, used_memory, free_memory = map(
    int, os.popen('free -t -m').readlines()[-1].split()[1:])
  
# Memory usage
print(round((used_memory/total_memory) * 100, 2))