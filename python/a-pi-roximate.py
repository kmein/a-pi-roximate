#!/usr/bin/env python3
from random import random
from math import sqrt

RADIUS = 20

def distance(point):
    x, y = point
    return sqrt(x**2 + y**2)

def approximation(count):
    def random_points(count):
        for _ in range(count - 1):
            yield random() * RADIUS, random() * RADIUS
    in_circle = len(list((p for p in random_points(count) if distance(p) <= RADIUS)))
    return 4 * (in_circle / float(count))

for count in range(1, 100000):
    print("%6d %f" % (count, approximation(count)))
