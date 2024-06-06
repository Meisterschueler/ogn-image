#!/bin/bash -e

apt update

### migration ###
# first, wait for internet connection (became irrelevant)
# get the correct time (became irrelevant)
# write the date in the version file (will be done in phase2 step8)
# next, install required packages (only make 'apt update', install packages in the related step)