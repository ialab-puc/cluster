#!/bin/python3

import os

files = os.listdir('./results');

sum = 0

for result in filter(lambda x: x.endswith('out'), files):
    with open('./results/' + result, 'r') as f:
        sum += float(f.readline())

print(sum / len(files))


