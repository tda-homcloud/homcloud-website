---
title: Install HomCloud on M1 Mac
lang: en
---

# Installation on Apple Silicon (M1) Mac

Since the architecture of the M1 Mac is new, a variety of scientific and technical software is still in the process of being supported.
Standard Python scientific software such as NumPy, scipy, matplotlib, and so on are still halfway supported.
Paraview, which is used for visualization in HomCloud, is not supported as of 2021/08.
Therefore, we do not recommend using HomCloud on M1 Macs, but please do the following if you still want to use it.

## 1. Install Conda with miniforge

The conda-forge package has relatively good support for M1 Macs, so use that.
I don't recommend Conda because it has problems, but there is no other option at the moment, so we will use it.
Go to <https://github.com/conda-forge/miniforge> and install it. As described in the linked website, type the following 
in a terminal to install Conda.

    curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh
    bash Miniforge3-$(uname)-$(uname -m).sh

### Conda

Conda has a lot of troublesome problems when used with Homebrew. For this reason, 
in many cases, you may want to minimize the use of Conda. In this case, you may want to do the following.

During installation, you will get the following question.

    Do you wish the installer to initialize Miniforge3
    by running conda init?
    
You will answer `no`. Then

    You have chosen to not have conda modify your shell scripts at all.
    To activate conda's base environment in your current shell session:
    
    eval "$(/Users/YOUR_ID/miniforge3/bin/conda shell.YOUR_SHELL_NAME hook)" 
        :

As you can see there, you can activate Conda only when using Conda. Type as follows 
to enable Conda for that session only (replace `YOUR_ID` and `YOUR_SHELL_NAME` with the appropriate ones. Probably `YOUR_SHELL_NAME` is `zsh`).

    eval "$(/Users/YOUR_ID/miniforge3/bin/conda shell.YOUR_SHELL_NAME hook)" 
    

## 2. Create the Conda environment

Create an environment for HomCloud, and name it homcloud. In a terminal, do the following.

    conda create -n homcloud python=3.9

## Enter the homcloud environment and install HomCloud.

In a terminal, do the following.

    conda activate homcloud
    conda install -c conda-forge -c https://homcloud.dev/conda-channel/ homcloud

The above commands complete the installation.

## Running the self-check program

Run the self-check program as follows.

    python -m homcloud.self_check --no-dipha --no-paraview

You should see the following message.

    HomCloud version: 3.4.1
    Python version: 3.9.6 | packaged by conda-forge | (default, Jul 11 2021, 03:35:11) [Clang 11.1.0 ].
    Alpha Shape 3 ... ok
    Alpha Shape 3 with weights ... ok
    Periodic Alpha Shape 3 with weights ... ok ... ok
    Alpha Shape 2 ... ... ok
    Grayscale 2D bitmap ... ... ok
    Binary 2D bitmap ... ... ok
    Binary 2D periodic bitmap ... ... ok
    Rips filtration ... ... ok
    Plotting PD ... ok
    Optimal Volume ... ok

If it doesn't work, please ask someone who knows more about it.

## 5. About the tutorial

As I mentioned above, Paraview does not work. Let's do a tutorial on using Plotly for visualization.
