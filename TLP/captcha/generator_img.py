#! /usr/bin/python3 -s

import numpy as np
#from matplotlib import pyplot as plt

def random_text(__size=5):
    MIN_ASCII = 65
    MAX_ASCII = 90 
    __base_rand = np.random.rand(__size)
    mod_rand = np.floor(__base_rand * (MAX_ASCII - MIN_ASCII)).astype(np.int)
    mod_rand += MIN_ASCII

    rand_char = list(map(lambda x: chr(x), mod_rand))
    rand_char = "".join(rand_char)
    
    print(rand_char)

def pepper_in_text(__ratio=0.3):
    TEXT_SIZE = 6
    base_text = random_text(TEXT_SIZE)
    pepper = __ratio * TEXT_SIZE


for _ in range(10):
    random_text()

