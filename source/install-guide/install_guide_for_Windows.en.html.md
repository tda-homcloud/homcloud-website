---
title: Install HomCloud on Windows
lang: ja
---

# Installation on Windows 10 64bit machine

There are two ways to install on windows. Set it according to your environment.

 * Install individual packages for Windows (Refer to the following instructions to install)
 * Install in a linux environment such as ubuntu linux of WSL(Windows Subsystem of linux)(install acording to [the installation guide for ubuntu](install_guide_for_Ubuntu.html)). If you are using WSL other than ubuntu linux, please replace each required package for each OS and try installation. Xwindow operating environment is required to use GUI tools.

## Before installation

If you try to download the files indicated in this guide using Microsoft Edge .
The file with the identifier `.whl` may be downloaded with the identifier `.man`.
You should use another browser such as Chrome of Firefox.

## 1. Python installation

Download the 64-bit python installer (here, Windows x86-64 web-based installer is taken as an example) from [https://www.python.org/downloads/windows/](https://www.python.org/downloads/windows/) and click to install.
For the Python version, please install the latest version of Python **3.7** (3.7.5 as of November 1, 2019)．

Please choose the place where Japanese (two-byte characters) does not enter in the place (path) installing Python．

## 2. Installation of MSMPI

MSMPI is used by dipha to parallelize and compute homology. 

Download

* msmpisetup.exe
* msmpisdk.msi

from [Microsoft MPI page](https://docs.microsoft.com/en-us/message-passing-interface/microsoft-mpi) and click to install.

## 3. Installation of paraview

paraview is mainly used in homcloud as a viewer when redisplaying point cloud data.
Download the latest version from [https://www.paraview.org/](https://www.paraview.org/)
and install it. And where to install it must be set by the environment variable `HOMCLOUD_PARAVIEW_PROGRAMNAME`．
Check the paraview path like 
`C:\Program Files\ParaView5.6.0-Windows-msvc2015-64bit\bin\paraview.exe`
and set the environment variables.
Plaease use a search engine to find out how to set environment variables.
How to find the path of paraview is

* Open explorer
* Go to PC→Local Disk→Program Files and enter paraview.exe in the search field in the upper rigth.
* Right-click the file you found and "Open File Location"

## 4. Environment construction by venv

Here, the environment is set using the environment separation mechanism called venv.
First, create a folder for environment construction.
Create a folder called homcloud under the document folder.
Next, set up venv. 
Since venv has been added as a python module, I will use this to create a venv environment.
Start the command prompt and type the following command to create the venv37 folder under the homcloud folder.

    cd Documents\homcloud
    python3 -m venv venv37

## 5. Copy the executable file

Place DLL files etc. in the `Scripts` folder under the venv37 folder.
Extract the zip file of [winbinaries-20191101.zip](/download/win/winbinaries-20191101.zip)
and put the dll file and exe file in it under the  `Scripts` folder.

## 6. Move into the environment of venv
Start the `command prompt`．
You can find it by searching for `Windows administration tools`→`command prompt`．
You can move into the environment by typing

    venv37\Scripts\activate

in the opened  window．Note that this operation needs to be done each time  you start the command prompt.

It is a good idea to create a shortcut etc. to start the command prompt quickly.
Please check the website etc. for basic commands that can be entered.

The following are the basic commands we often use.

    cd c:\dev\work # カレントフォルダの移動
    dir # フォルダ内のファイルの一覧表示

## 7. Installation of python package
Install the required packages using the command prompt launched above.
Type as follows. You can also copy and paste．

    pip install numpy scipy pyqt5 matplotlib scikit-learn msgpack-python Pillow PuLP forwardable imageio

## 8. Installation of risper
Install the package `ripser` as follows.
The package is downloaded from  [ripser-0.4.1-cp37-cp37m-win_amd64.whl](/download/win/ripser-0.4.1-cp37-cp37m-win_amd64.whl) and placed in the homcloud folder．

    pip install ripser-0.4.1-cp37-cp37m-win_amd64.whl

## 9. HomCloud Installation
Download from 
[homcloud-2.7.2-cp37-cp37m-win_amd64.whl](/download/win/homcloud-2.7.2-cp37-cp37m-win_amd64.whl) and put it in the homcloud folder. Then install as follows.

    pip install homcloud-2.7.2-cp37-cp37m-win_amd64.whl

## 10. Run HomCloud's self-checking program

Finally run the following in a command prompt to find out if it was successfully installed.

    python -m homcloud.self_check

The Paraview window will open twice.
When first opened, press the "Apply" button to display something and then close the window.
When it is opened the second time, make sure that the red and white dots are displayed, then close the window.

Finally, it is OK if the following is displayed in the command prompt.
I think that `/usr/bin/paraview` is displayed differently, but if ok is displayed as follows, there is no problem.

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


## 11. Running the tutorial

Since it is a big deal, let's move the tutorial.
Download it from [python-tutorial.zip](/download/python-tutorial.zip)
and extract it to the homcloud folder.
Next, install the jupyter notebook used in the tutorial.
You can install it with

    pip install jupyter

After installation, 

    jupyter notebook

in homcloud folder.
Then, the browser will pop up and the jupyter notebook will start.
Start the tutorial here from the tutorials folder. There are some tutorials, but pointcloud is the easiest to do.
