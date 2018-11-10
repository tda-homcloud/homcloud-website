---
title: Install HomCloud
lang: en
---

{::options parse_block_html="true" /}

# Install

HomCloud is now available on Linux, MacOS X, and Windows.

* [Install on Linux](#linux)
* [Install on OS X](#osx)
* Install guide on Windows is not available now. Sorry!

<div class="guide">
## <a name="linux"> Install on Linux(Ubuntu, Debian)

We recommend that apt and pip tools to install on Ubuntu and Debian.
We do not recommend Anaconda with HomCloud.
Please use 16.04 LTS or newer for Ubuntu, or
Debian 9 (stretch) or newer for Debian.
Too old distributions are not supported.


### 1. Install the following packages by apt

First, you should install python3 and some other packages.

* libcgal-dev
* libpython3-dev
* python3-matplotlib
* python3-numpy
* python3-scipy
* python3-pip
* python3-pyqt5
* python3-msgpack
* opnempi-bin
* libopenmpi-dev
* cmake
* paraview


Please type as follows:

    sudo apt-get install libcgal-dev libpython3-dev python3-matplotlib python3-numpy python3-scipy python3-pip python3-pyqt5 python3-msgpack openmpi-bin libopenmpi-dev cmake paraview


### 2. Download dipha from <http://github.com/DIPHA/dipha> and install it

1. Download latest dipha from "Download Zip" button
2. Extract the downloaded zip file
3. Go to the created directory
4. Type `cmake .`, and create Makefile
5. Type `make` to build dipha
6. Copy the dipha executable file to the directory in `PATH` environment variable.

   
### 3. Install python packages by pip
Type as follows to install scikit-learn, imageio, and forwardable:

    pip3 install --user scikit-learn imageio forwardable 

Alternative way is as follows:

    python3.6 -m pip install --user scikit-learn imageio forwardable

Please note that you should reinstall scikit-learn if python is major upgraded
since scikit-learn is installed under the version-dependent directory.

### 4. [Download](index.html#download) latest HomCloud and install

Download the file `homcloud-x.y.z.tar.gz`.
`x`, `y`, `z` depend on the version.

Go to the downloaded directory, and type as follows:

    pip3 install --user --no-deps homcloud-x.y.z.tar.gz

If you do not want to install the homcloud globally, please use
virtualenv or venv.

</div>

<div class="guide">
## <a name="osx"> Install on OSX

On MacOS X, we recommend [homebrew](https://brew.sh/index_ja.html) 
to install python and some other libraries.
We do not recommend Anaconda with HomCloud on OSX.

### 1. Install Xcode, Xcode commandline tools, and homebrew
   
You should install following three softwares.

* [Xcode](https://developer.apple.com/jp/xcode/)
* Xcode commandline tools
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

You can easily install various software from commandline interface.
You can install a package whose name is `PKG`, please type as follows:

    brew install PKG

### 3. Install the following python packages by pip3

After installing python3, you can use `pip3` command to maintain
the python package system. Please following packages by `pip3`.

* numpy
* scipy
* matplotlib
* scikit-learn
* msgpack-python
* Pillow
* forwadable
* imageio

Type as follows to install:

    pip3 install numpy scipy matplotlib scikit-learn msgpack-python Pillow forwardable imageio

### 4. Download dipha from <http://github.com/DIPHA/dipha> and install it

You can download dipha by [Git](https://git-scm.com/).
Install Git by homebrew, download dipha by git, and build it as follows:

    brew install git
    git clone https://github.com/DIPHA/dipha.git
    cd dipha/
    cmake
    make

Copy `dipha` executable file to a directory in `PATH` environment variable.

    # EXAMPLE
    cp dipha /usr/local/bin/

You can find `PATH` directories by:

    echo $PATH

### 5. [Download](index.en.html#download) latest HomCloud and install
Download `homcloud-x.y.z.tar.gz`.  `x`, `y`, `z` is latest version.

After downloading, open your terminal, and type as follows to go to the download
directory, and install HomCloud by `pip` command.

    cd Downloads/
    pip3 install homcloud-x.y.z.tar.gz

</div>

