#!/bin/sh

INDIR=../main/python/tutorial
PYINDIR=$INDIR/python-interface
BASHDIR=`pwd`/source/tutorial
PYDIR=`pwd`/source/py-tutorial

cd `dirname $0`

for ipynb in $INDIR/bash/*/*.ipynb; do
    jupyter nbconvert $ipynb --output=$BASHDIR/`basename $ipynb .ipynb`
done

for ipynb in $PYINDIR/*/*.ipynb; do
    jupyter nbconvert $ipynb --output=$PYDIR/`basename $ipynb .ipynb`
done
