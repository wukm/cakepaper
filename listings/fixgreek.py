# -*- coding: utf-8 -*-
#!/usr/bin/env python3

import os

files = os.listdir()
for pyfile in files:
    if not pyfile.endswith('.py'):
        continue
    if pyfile == 'fixgreek.py':
        continue
    with open(pyfile) as f:
        listing = f.readlines()
    print('opened', pyfile)
    newlisting = listing.copy()
    fixes = (r"$\alpha $",
             r"$\beta  $",
             r"$\gamma $",
             r"$\sigma $",
             r"$\kappa $",
             r"$\lambda$")
    for greek, latex in zip(("α", "β", "γ", "σ", "κ", "λ"), fixes):
        for n, line in enumerate(listing):
            if greek in line: 
                print(greek, 'in', pyfile)
                print(line)
                print('new line is')
                newline = newlisting[n].replace(greek, latex)
                print(newline)
                newlisting[n] = newline

    with open(pyfile, 'w') as f:
        f.writelines(newlisting)
