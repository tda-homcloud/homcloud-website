#!/bin/bash
bundle exec middleman build

rm -r conda-channel
mkdir conda-channel
cp -r conda-files/linux-64 conda-channel
cp -r conda-files/win-64 conda-channel
eval "$(/home/ohai/miniconda3/bin/conda shell.bash hook)"
conda index conda-channel
