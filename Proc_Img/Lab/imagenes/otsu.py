#! /usr/bin/python3 -s

import numpy as np
import imageio

import os

#print(os.listdir("./"))

current_img = imageio.imread("./test.png")

print(current_img.size)
