#!/bin/python3
import sys, random
from functools import reduce

n = int(sys.argv[1]) * 10000

numbers = [ random.randrange(0, 100000) for i in range(n) ]

print('%.2f' % (reduce(lambda x, y: x + y, numbers) / n))
