#!/usr/bin/python
from sys import argv
from math import sqrt

inputs = argv
num = int(inputs[1])
print(num)

while num % 2 == 0:
    print(2)
    num /= 2
for i in range(3, int(sqrt(num))+1, 2):
    while num % i == 0:
        print(i)
        num /= i
if num > 2:
    print(num)
