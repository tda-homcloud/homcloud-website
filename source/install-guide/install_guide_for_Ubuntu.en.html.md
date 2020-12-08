---
title: Install HomCloud on Ubuntu or Debian
lang: en
---

# Install HomClond on Ubuntu or Debian

## 1. Install the following packages by `apt`

* libcgal-dev
* libpython3-dev
* python3-matplotlib
* python3-numpy
* python3-scipy
* python3-pip
* python3-pyqt5
* python3-msgpack
* python3-pulp
* python3-sklearn
* opnempi-bin
* libopenmpi-dev
* cmake
* paraview
* jupyter

Please type as follows to install these packages:

    sudo apt-get install libcgal-dev libpython3-dev python3-matplotlib python3-numpy python3-scipy python3-pip python3-pyqt5 python3-msgpack python3-pulp python3-sklearn openmpi-bin libopenmpi-dev cmake paraview jupyter

You should also install `python3-paraview` on recent Ubuntu (20.04 or later).

    sudo apt-get install python3-paraview


## 2. Install python packages by pip

Type as follows to install imageio, Cython, forwardable, and ripser:

    pip3 install --user forwardable imageio Cython
    pip3 install --user ripser

Alternatively, you can use `pip` module to install:

    python3.6 -m pip install --user forwardable imageio Cython
    python3.6 -m pip install --user ripser

## 3. Install latest HomCloud

Type as follows:

    pip3 install --user --no-deps homcloud

If you do not want to install HomCloud globally, please use venv or something.

### If you want to older version

If you want to install older version such as 2.9.0, type as follows instead:

    pip3 install --user --no-deps homcloud==2.9.0

## 4. Run HomCloud self-checking program

To confirm the successful installation of HomCloud, 
type as follows in the terminal:

    python3 -m homcloud.self_check --no-dipha

Paraview window is opened twice in the program.
When an window is opened firstly, push the "Apply" button and close the window.
When an window is opened secondly, confirm the red and white points in the window
and close the window.

After that, the following message is shown in the terminal.

    Alpha Shape 3 ... ok
    Alpha Shape 3 with weights ... ok
    Alpha Shape 2 ... ok
    Grayscale 2D bitmap ... ok
    Binary 2D bitmap ... ok
    Binary 2D periodic bitmap ... ok
    Rips filtration ... ok
    Plotting PD ... ok
    Paraview path: /usr/bin/paraview
    Paraview fake invoke ... ok
    Paraview real invoke (VTK voxel) => Click "Apply" button and close opened window ... ok
    Paraview real invoke (python pointcloud) => Close opened window ... ok

Now you finish HomCloud installation process. Enjoy with HomCloud!


## 5. (Optional) Download dipha from <http://github.com/DIPHA/dipha> and install it

You optinally install dipha for Rips-Vietoris data and more than 4-dim voxel data.

1. Download `dipha-2.1.0.zip` from <https://github.com/DIPHA/dipha/archive/dipha-2.1.0.zip>.
2. Extract the downloaded zip file
3. Go to the created directory
4. Type `cmake .`, and create Makefile
5. Type `make` to build dipha
6. Copy the dipha executable file to the directory in `PATH` environmental variable.


    python3 -m homcloud.self_check --no-dipha
