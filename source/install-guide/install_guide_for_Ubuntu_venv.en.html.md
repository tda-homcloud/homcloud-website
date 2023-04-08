---
title: Install HomCloud into venv envrinment on Ubuntu or Debian 
lang: en
---

# Install HomCloud into venv envrinment on Ubuntu or Debian

On this page, we install HomCloud using `venv`, which can create lightweight virtual environments for Python.
You can easily use different versions of HomCloud using `venv`.

## 1. Install the following deb packages using apt

* libcgal-dev
* libpython3-dev

Type as follows:

    sudo apt-get install libcgal-dev libpython3-dev

## 2. Create a new virtual environment

First, you should make a working directory. In this example, let's name the directory `homcloud`:

    mkdir homcloud
    cd homcloud

You can create a new virtual environment in the working directory:

    python3 -m venv venv

Then, a directory whose name is `venv` is created. The files in the virtual environment are stored in this directory.

## 3. Enter the virtual environment

Type as follows to enter the virtual environment:

    source ./venv/bin/activate
    
This operation is required every time you invoke a new shell.

## 4. Install Python packages using pip

Type as follows to install Cython, NumPy, wheel, pyqt6, PyVista, and PyVistaQt:

    pip install Cython numpy wheel jupyter pyqt6 "pyvista[all,trame]" pyvistaqt

## 5. Install latest HomCloud

Type as follows to install HomCloud:

    pip install homcloud

### If you want to install an older version

If you want to install an older version, such as 3.6.0, type the following instead:

    pip install homcloud==3.6.0

## 6. Run HomCloud's self-check program

Finally, to check whether the installation process was successful, run the self-check program as follows in the terminal:

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

The installation is now complete! Enjoy with HomCloud!


## 7. (Optional) Install [Dipha](http://github.com/DIPHA/dipha)

You can skip this part.
See [install_guide_for_Ubuntu.html](install_guide_for_Ubuntu.html).

