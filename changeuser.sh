#!/bin/bash

echo Starting as `whoami`

sudo -u $1 -i 'echo and now I am `/usr/bin/whoami`'

echo Finally, I am `whoami`
