#! /usr/bin/python3 -s

from numpy.random import rand as nprand
#import numpy as np
from matplotlib import pyplot as plt

STANDAR_SIZE=(480, 680)

def random_text(__size=6):
    MIN_ASCII = 65
    MAX_ASCII = 90 
    __base_rand = nprand(__size)
    mod_rand = (__base_rand * (MAX_ASCII - MIN_ASCII)).astype(int)
    mod_rand += MIN_ASCII

    rand_char = list(map(lambda x: chr(x), mod_rand))
        
    for jj in (nprand(int(0.5 * __size)) * (__size - 1)).astype(int):
        rand_char[jj] = str(1 + (nprand(1) * 8).astype(int)[0])
    
    rand_char = "".join(rand_char)
    
    return rand_char

def pepper_in_text(__ratio=0.3):
    TEXT_SIZE = 6
    base_text = random_text(TEXT_SIZE)
    pepper = __ratio * TEXT_SIZE

def random_lines(salty=0.4, amount=100):
    coord_ref = nprand(amount ,4)
    __ratio = int(salty * amount)
    
    id_x = list(set((nprand(__ratio) * amount - 1).astype(int)))
    
    return coord_ref[id_x]

def dots_mask(amount=100, samples=30):
    x = nprand(amount)
    y = nprand(amount)
    colors = nprand(amount)
    area = 3.141592653 * (samples * nprand(amount))**2 

    plt.scatter(x, y, s=area, c=colors, alpha=0.5)

def line_mask(resolution=STANDAR_SIZE, line_set=random_lines()):
    for sub_line in line_set[:]:
        plt.plot(sub_line[:2], sub_line[2:], linewidth=10, markersize=12)

def text_mask(text_value=random_text()):
    letters_in_text = len(text_value)

    rand_vals = nprand(len(text_value), 5)
    
    x_span = 1.0 / letters_in_text
    last_x = 0

    for id_x in range(letters_in_text):
        [ref_x, ref_y, ref_rot, ref_size, prob] = list(rand_vals[id_x, :])
    
        ref_rot *= 360
        ref_rot = int(ref_rot)
        ref_rot = ref_rot % 30

        ref_size *= 10
        ref_size += 30
        ref_size = int(ref_size)

        ref_x = (x_span * ref_x) + last_x
        ref_y = ref_y % 0.4 + 0.2

        if prob > 0.5:
            plt.text(ref_x, ref_y, text_value[id_x], rotation=ref_rot, fontsize=ref_size, color='w')
        else:
            plt.text(ref_x, ref_y, text_value[id_x], rotation=ref_rot, fontsize=ref_size    )
 
        last_x += x_span
    return text_value

def main():
    text = random_text()
    
    fig=plt.figure()
    ax=fig.add_subplot(1,1,1)
    
    plt.axis('off')
        
    dots_mask()
    line_mask()
    text_mask(text)

    extent = ax.get_window_extent().transformed(fig.dpi_scale_trans.inverted())
    plt.savefig('captcha.png', bbox_inches=extent, quality=50, dpi=100)

    print(text, end='')
main()