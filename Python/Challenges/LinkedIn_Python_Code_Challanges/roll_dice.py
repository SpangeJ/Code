#!/usr/bin/python
from random import randint as rd
from sys import argv
from pprint import pprint

inputs = argv
dice = inputs[1]
dice = dice[1:-1]; dice = [float(val) for val in dice.split(',')]
outcomes = int(sum(dice))
Dict = {}
for i in range(len(dice),outcomes+1):
    Dict[str(i)] = 0
num_sim = 1_000_000

def roll(dice):
    sum = 0
    for sides in dice:
        sum += rd(1,sides)
    return sum

for I in range(num_sim):
    outcome = roll(dice)
    Dict[str(outcome)] += 1
Dict = {k: v * 100 / num_sim for k, v in Dict.items()}
pprint(Dict)
print(f"Sum of all fields: {sum(Dict.values()):.1f}%")
