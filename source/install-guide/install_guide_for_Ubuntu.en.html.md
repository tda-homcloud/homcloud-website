---
title: Install HomCloud on Ubuntu or Debian
lang: en
---

# Install HomClond on Ubuntu or Debian

## 1. Install the following packages by `apt`

Type the following to install Debian packages:

    sudo apt-get install libcgal-dev libpython3-dev python3-matplotlib python3-numpy python3-scipy python3-pip python3-msgpack python3-pulp python3-sklearn paraview python3-paraview jupyter

## 2. Install additional Python packages by pip

Type as follows to install Python packages by pip:

    pip3 install --user wheel Cython "pyvista[all,trame]" pyqt6 pyvistaqt
    pip3 install --user ripser

## 3. Install latest HomCloud

Type as follows:

    pip3 install --user homcloud

If you want to avoid installing HomCloud globally, please use venv or something.

### If you want to older version

If you want to install an older version, such as 3.6.0, type as follows instead:

    pip3 install --user homcloud==3.6.0

## 4. Run HomCloud's self-checking program

To confirm the successful installation of HomCloud, type as follows in the terminal:

    python3 -m homcloud.self_check --pyvista

After starting, a window with the following image will be opened. Please close the window.

![PyVista's window](/images/screenshot-selfcheck-pyvista.png){: width="600px" }

The installation succeeds if the following message is shown in the terminal.

    HomCloud version: 4.4.0
    Python version: 3.10.12 (main, Nov 20 2023, 15:14:05) [GCC 11.4.0]
    CGAL version: 5.6 (1050601000)
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

## 5. (Optional) Download dipha from <http://github.com/DIPHA/dipha> and install it

You optionally install dipha for Rips-Vietoris data and more than 4-dim voxel data.

1. Install openmpi and cmake to build Dipha: `sudo apt-get install openmpi-bin libopenmpi-dev cmake`
2. Download `dipha-2.1.0.zip` from <https://github.com/DIPHA/dipha/archive/dipha-2.1.0.zip>.
3. Extract the downloaded zip file
4. Go to the created directory
5. Type `cmake .`, and create Makefile
6. Type `make` to build dipha
7. Copy the dipha executable file to the directory in `PATH` environmental variable.
8. Run self-check program: `python3 -m homcloud.self_check --dipha`
