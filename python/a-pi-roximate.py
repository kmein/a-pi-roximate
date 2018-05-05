#!/usr/bin/env python3
from random import random

def approximation(count):
    def random_points(count):
        for _ in range(count - 1):
            yield complex(random(), random())
    in_circle = len(list((p for p in random_points(count) if abs(p) <= 1)))
    return 4 * (in_circle / float(count))

for count in range(1, 100000):
    print("%6d %f" % (count, approximation(count)))
