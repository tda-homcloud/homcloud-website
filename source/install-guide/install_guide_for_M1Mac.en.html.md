---
title: Install HomCloud on M1 Mac
lang: en
---

# Installation on Apple Silicon (M1) Mac

Since the architecture of the M1 Mac is new, a variety of scientific and technical software is still being supported.
Standard Python scientific software such as NumPy, scipy, matplotlib, and others are still halfway supported.

## 1. Install Conda with miniforge

The conda-forge package has relatively good support for M1 Macs, so use that.
I don't recommend Conda because it has problems, but there is no other option now, so that we will use it.
Go to <https://github.com/conda-forge/miniforge> and install it. As described in the linked website, type the following 
in a terminal to install Conda.

    curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
    bash Mambaforge-$(uname)-$(uname -m).sh

### Conda

Conda has a lot of troublesome problems when used with Homebrew. For this reason, 
in many cases, you may want to minimize the use of Conda. In this case, you may want to do the following.

During installation, you will get the following question.

    Do you wish the installer to initialize Mambaforge
    by running conda init? [yes|no]
    
You will answer `no`. Then

    You have chosen to not have conda modify your shell scripts at all.
    To activate conda's base environment in your current shell session:
    
    eval "$(/Users/YOUR_ID/miniforge3/bin/conda shell.YOUR_SHELL_NAME hook)" 
        :

As you can see there, you can activate Conda only when using Conda. Type as follows 
to enable Conda for that session only (replace `YOUR_ID` and `YOUR_SHELL_NAME` with the appropriate ones. Probably `YOUR_SHELL_NAME` is `zsh`).

    eval "$(/Users/YOUR_ID/mambaforge/bin/conda shell.YOUR_SHELL_NAME hook)" 

## 2. Create a new Conda environment

Create a virtual environment for HomCloud, and name it `homcloud`. In a terminal, do the following.

    conda create -n homcloud python=3.9

## 3. Enter the homcloud environment and install HomCloud.

In a terminal, type the following.

    conda activate homcloud
    conda install -c conda-forge -c https://homcloud.dev/conda-channel/ pyvista panel trame homcloud

The above commands complete the installation.

## 4. Run the self-check program

Run the self-check program as follows.

    python -m homcloud.self_check --pyvista

After starting, a window with the following image will be opened. Please close the window.

![PyVista's window](/images/screenshot-selfcheck-pyvista.png){: width="600px" }

The installation succeeds if the following message is shown in the terminal.

    HomCloud version: 4.0.0
    Python version: 3.10.6 (main, Mar 10 2023, 10:55:28) [GCC 11.3.0]
    Alpha Shape 3 ... ok
    Alpha Shape 3 with weights ... ok
    Periodic Alpha Shape 3 with weights ... ok
    Alpha Shape 2 ... ok
    Grayscale 2D bitmap ... ok
    Binary 2D bitmap ... ok
    Binary 2D periodic bitmap ... ok
    Rips filtration ... ok
    Plotting PD ... ok
    Optimal Volume ... ok
    PyVista 3D drawing (close the pop-up window)... ok

The installation is now complete!
