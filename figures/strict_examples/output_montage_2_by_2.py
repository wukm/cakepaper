# coding: utf-8

import numpy as np
from skimage.io import imread
from skimage.util import montage
import matplotlib.pyplot as plt
import os

d = dict()
I = dict()

for filename in os.listdir():
    if not (filename.endswith('png') and filename.startswith('T-')):
        continue # skip montages and this file

    base = filename.split('_', 1)[0]
    try:
        d[base].append(filename)
    except KeyError:
        d[base] = [filename,]

for l in d.values():
    l.sort()

for k,v in d.items():
    I[k] = np.stack([imread(img) for img in v])

for k,v in I.items():
    plt.imsave(f'montage-{k}.png', montage(v, multichannel=True))

