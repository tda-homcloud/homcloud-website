---
title: Install HomCloud on Mac OS X
lang: en
---

# Install on MacOS X

On MacOS X, we recommend [homebrew](https://brew.sh/index_ja.html) 
to install python and some other libraries.

## Install Xcode, Xcode commandline tools, and homebrew

* [Xcode](https://developer.apple.com/jp/xcode/)
* Xcode commandline tools (installed with Xcode)
* [homebrew](https://github.com/Homebrew)

First, you should install Xcode. You can install Xcode from App Store.
If Xcode is 6.1 or later, Xcode commandline tools is also installed at the same time.
If you want to install from terminal, please type as follows:
   
    xcode-select --install

After installing Xcode, type as follows to install homebrew:

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

When you request root password, please type properly.

### 2. Install following packages by homebrew

* cgal
* python3
* cmake
* open-mpi
* pyqt5

You can easily install various software from commandline interface.
You can install these packages as follows:

    brew install cgal python3 cmake open-mpi pyqt5

## 3. Install [Paraview](https://www.paraview.org/)

Choose an appropriate package from [the download page](https://www.paraview.org/download/)
and install it.

## 4. Install the following python packages by pip3

After installing python3, you can use `pip3` command to maintain
the python package system. Please following packages by `pip3`.

* numpy
* scipy
* matplotlib
* scikit-leran
* msgpack-python
* Pillow
* PuLP
* forwardable
* Cython
* ripser
* jupyter

Type as follows to install:

    pip3 install numpy scipy matplotlib scikit-learn msgpack-python Pillow forwardable Cython jupyter
    pip3 install ripser

## 5. Download dipha from <http://github.com/DIPHA/dipha> and install it

Download a zip file from <https://github.com/DIPHA/dipha/archive/dipha-2.1.0.zip>
and install it as follows.

    unzip dipha-dipha-2.1.0.zip
    cd dipha-dipha-2.1.0
    cmake . 
    make

Copy `dipha` executable file to a directory in `PATH` environment variable.

    # EXAMPLE
    cp dipha /usr/local/bin/

You can find `PATH` directories by:

    echo $PATH

## 6. Install HomCloud 

Download latest HomCloud from [Download section](index.en.html#download).

After downloading, open your terminal, and type as follows to go to the download
directory, and install HomCloud by `pip` command.

    cd Downloads/
    pip3 install homcloud-x.y.z.tar.gz

## 7. Configure Paraview

Paraview is installed in the directory whose name is `/Applications/ParaView-VERSION.app`.
For example, if the version is 5.4.0, the name of the application is
`/Applications/ParaView-5.4.0.app`.

You need to tell the name to HomCloud by `HOMCLOUD_PARAVIEW_PROGRAMNAME`
environmental variable. The following line should be added to `~/.bash_profile`:

    export HOMCLOUD_PARAVIEW_PROGRAMNAME=/Applications/ParaView-5.4.0.app

To reflect the setting, you should restart your shell: `exec $SHELL -l`.

## 8. Run HomCloud self-checking program

Finally, you run HomCloud self-checking program to confirm the successful 
HomCloud installation. Please type as follows in the terminal:

    python3 -m homcloud.self_check

Paraview window is opened twice in the program.
When an window is opened firstly, push the "Apply" button and close the window.
When an window is opened secondly, confirm the red and white points in the window
and close the window.

After that, the following message is shown in the terminal.
Probably the part of `/usr/bin/paraview` is different, but that is no problem.

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
