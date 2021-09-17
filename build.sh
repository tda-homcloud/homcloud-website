#!/bin/bash
bundle exec middleman build

rm -r conda-channel
mkdir conda-channel
cp -r conda-files/linux-64 conda-channel
cp -r conda-files/win-64 conda-channel
cp -r conda-files/osx-64 conda-channel
if [ -d $HOME/miniforge3 ]; then
    CONDA_DIR=$HOME/miniforge3
elif [ -d $HOME/miniconda3 ]; then
    CONDA_DIR=$HOME/minicodna3
fi

eval "$($CONDA_DIR/bin/conda shell.bash hook)"

conda index conda-channel
