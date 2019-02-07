# README

This package contains many software for the computation of
persistence homology.

# REQUIRE
One of the following computing environment is required.

* Ubuntu (newer than 16.04 lts)
* Debian (jessie or newer)
* Mac OS X with homebrew

Under any system, python 3.3 or newer versions are requred.

# INSTALL

## Install on Linux(debina/ubuntu)

1. Install the following pacakges with apt-get
   * libcgal-dev
   * libpython3-dev
   * python3-matplotlib
   * python3-numpy
   * python3-scipy
   * python3-pip
   * python3-pyqt5
   * python3-msgpack
   * python3-pulp
   * openmpi-bin
   * libopenmpi-dev
   * cmake
   * paraview
   * cython3

2. Download dipha from http://github.com/DIPHA/dipha and install it.
   1. Download latest dipha from "Download ZIP" button.
   2. Unzip it
   3. Change directory to the created directory
   4. Type `cmake .` to create a makefile
   5. Type `make` to build
   6. Copy the executable file of `dipha` to a directory in $PATH environment variable.

3. Type `pip3 install --user scikit-learn ripser`

4. Dowload the following files from the download website:

    * `homcloud-x.y.z.tar.gz`

    After donwloading, go to the "Download" directory and type:

        pip3 install --user --no-deps homcloud-x.y.z.tar.gz

    x,y, and z should be replaced to the latest version number.

## Install on OS X with homebrew

1. Install homebrew, Xcode, and Xcode commandline tools
   * Xcode commandline tools may be installed by installing Xcode.

2. Install the following packages from homebrew
   * cgal
   * python3
   * cmake
   * open-mpi
   * pyqt5
   * paraview (from homebrew-cask: `brew cask install paraview`)
     (or install paraview using the official installer)

3. Install the following packages from pip3
   * numpy
   * scipy
   * matplotlib
   * scikit-learn
   * msgpack-python
   * Pillow
   * pulp
   * cython
   * ripser

4. Download dipha from http://github.com/DIPHA/dipha and install it.
   * Same as linux's way

5. Dowload the following files from the download website:

    * `homcloud-x.y.z.tar.gz`

    After donwloading, go to the "Download" directory and type:

        pip3 install homcloud-x.y.z.tar.gz

    x,y, and z should be replaced to the latest version number.

6. Set `HOMCLOUD_PARAVIEW_PROGRAMNAME` environment variable to the application name
   of paraview.
   
   When you install paraview, an application folder for paraview is generated
   in the `/Applications` directory. In the directory, an directory whose name
   is `ParaView-5.4.0.app` will appear. In that case, please write the following
   line in `.profile` or a setting file of your shell.

        export HOMCLOUD_PARAVIEW_PROGRAMNAME=ParaView-5.4.0.app

<!--
## Install on Debian stretch
1. Install the following pacakges with apt-get
   * libcgal-dev
   * python3-matplotlib
   * python3-numpy
   * python3-scipy
   * python3-pip
   * python3-pyqt5
   * python3-msgpack
   * python3-joblib
   * python3-sklearn
   * python3-pulp
   * mpi-default-bin
   * paraview

    You can install them as follows:

        sudo apt-get install libcgal-dev python3-matplotlib python3-numpy python3-scipy python3-pip python3-pyqt5 python3-msgpack python3-joblib python3-sklearn mpi-default-bin paraview

2. Download The following files from download site

   * `dipha_2.1.0-1_amd64.deb`
   * `python3-homcloud-base_x.y.z_amd64.deb`
   * `python3-homcloud-advanced_z.y.z_amd64.deb`

3. Install the above downloaded packages using dpkg as follows:

        sudo dpkg -i dipha_2.1.0-1_amd64.deb python3-homcloud-base_x.y.z_amd64.deb python3-homcloud-advanced_x.y.z_amd64.deb
    
        # Alternatively, you can install the above packages as follows
        # if you download the above package files in the same direcotry.
        sudo dpkg -i *.deb

-->

## Install with anaconda on linux

I do not recommend anacond on linux, but you can use anaconda
if you want to install homcloud on the machine that you don't have root.
In this instruction, GUI components are not installed and you don't use them
since probably GUI is not available on such a machine.

1. If the OS is old such as CentOS 6, Please
   request to the administrator of the machine to install c++11 ready
   c++ compiler

2. Download dipha from http://github.com/DIPHA/dipha and install it:

    1. Download latest dipha from "Download ZIP" button.
    2. Unzip it
    3. Change directory to the created directory
    4. Type `cmake .` to create a makefile
    5. Type `make` to build
    6. Copy the executable file of `dipha` to a directory in $PATH environment variable.

3. Install anaconda (https:www.anaconda.com)
4. Generate anaconda environment

    conda create -n py37-homcloud python=3.7
    
5. Go into the anaconda environment

    conda activate py37-homcloud

6. Install the following packages using `conda` command.
   * gcc
   * msgpack-python (`conda install -c cluster msgpack-python`)
   * cgal (`conda install -c conda-forge cgal=4.9`)

7. Dowload the following files from the download website:

    * `homcloud-x.y.z.tar.gz`
    
    After donwloading, go to the "Download" directory and type:

        pip install homcloud-x.y.z.tar.gz

    x,y, and z should be replaced to the latest version number.

8. Put a file .config/matplotlib/matplotlibrc with the following content:

       backend: agg

Notes:

* Step 8 is required to suppress GUI on matplotlib
* Step 2 should be done out of the anaconda environment since
  you probably want to use MPI with dipha but gcc installed by conda
  does not work with MPI.

## General Information
This package requires the following

* [dipha](http://github.com/DIPHA/dipha)
* [cgal](http://www.cgal.org/)
* python3, numpy, scipy, matplotlib, pyqt5, msgpack, paraview, pillow

## Notes

* If you don't want to install the software globally, please use virtualenv or venv.

# USAGE EXAMPLES

Please download `homcloud-examples.zip` and try them.

# Command aliases

Now all commands are invoked using "pythom3 -m". Instead, you can use
commands starting from "homcloud-".
For example, you can use "homcloud-pc2diphacomplex" instead of
"python3 -m homcloud.pc2diphacomplex".
This command aliases are useful if you use command completion.

# Upgrading homcloud
If you want to upgrade homcloud to the latest version,
First uninstalling older versions is recommended.
The way to uninstall is:

    pip3 uninstall homcloud

And after that, please install the latest version of homcloud as follows:

    pip3 install homcloud-x.y.z.tar.gz

On linux, `--user` option may be required.

# DOCUMENTS

All packages/modules are installed under the package "homcloud", 
and you can run the programs by:

    python3 -m homcloud.****

In `doc` directory, there are documents of all commands. Please see them
for the details.

# Trouble shooting

## `ORTE_ERROR_LOG:` on Mac OS X

If you get the following messages on Mac OS X:

    [[46339,0],0] ORTE_ERROR_LOG: Bad parameter in file orted/pmix/pmix_server.c at line 262
    [[46339,0],0] ORTE_ERROR_LOG: Bad parameter in file ess_hnp_module.c at line 666

please change the environment variable TMPDIR to `/tmp` or something short name.

## RuntimeError: Invalid DISPLAY variable on ssh

If you get the following error:

    RuntimeError: Invalid DISPLAY variable
    
probably your environment cannot use GUI programs. For example, you try to
run the program under ssh environment.

If you get the error, please modify the matplotlibrc file as follows:

    backend: agg

You should put the file at `$HOME/.config/matplotlib/matplotlibrc`.

# AUTHORS

* Ippei Obayashi
* Tomohide Wada
* Hiraoka Lab, WPI-AIMR, Tohoku Univ.
