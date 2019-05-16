#! /usr/bin/python3 -s

import numpy as np
from matplotlib import pyplot as plt

STANDAR_SIZE=(480, 680)

def random_text(__size=6):
    MIN_ASCII = 65
    MAX_ASCII = 90 
    __base_rand = np.random.rand(__size)
    mod_rand = np.floor(__base_rand * (MAX_ASCII - MIN_ASCII)).astype(np.int)
    mod_rand += MIN_ASCII

    rand_char = list(map(lambda x: chr(x), mod_rand))
    rand_char = "".join(rand_char)
    
    return rand_char

def pepper_in_text(__ratio=0.3):
    TEXT_SIZE = 6
    base_text = random_text(TEXT_SIZE)
    pepper = __ratio * TEXT_SIZE

def random_lines(salty=0.4, amount=100):
    coord_ref = np.random.rand(amount ,4)
    __ratio = np.int(salty * amount)
    
    id_x = list(set((np.random.rand(__ratio) * amount - 1).astype(int)))
    
    return coord_ref[id_x]

def dots_mask(amount=100, samples=30):
    x = np.random.rand(amount)
    y = np.random.rand(amount)
    colors = np.random.rand(amount)
    area = np.pi * (samples * np.random.rand(amount))**2 

    plt.scatter(x, y, s=area, c=colors, alpha=0.5)

def line_mask(resolution=STANDAR_SIZE, line_set=random_lines()):
    for sub_line in line_set[:]:
        plt.plot(sub_line[:2], sub_line[2:])

def text_mask(text_value=random_text()):
    letters_in_text = len(text_value)

    rand_vals = np.random.rand(len(text_value), 4)
    
    x_span = 1 / rand_vals
    last_x = 0
    for id_x in range(letters_in_text):
        [ref_x, ref_y, ref_rot, ref_size] = list(rand_vals[id_x, :])
    
        ref_rot *= 360
        ref_rot = int(ref_rot)
        
        ref_size *= 10
        ref_size += 30
        ref_size = int(ref_size)

        x_span = x_span * ref_x + last_x

        plt.text(ref_x, ref_y, text_value[id_x], rotation=ref_rot, fontsize=ref_size)
 
        last_x += x_span

dots_mask()
line_mask()
text_mask()

plt.show()

#for _ in range(10):
#    random_text()

