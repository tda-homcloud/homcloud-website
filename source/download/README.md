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

Please see the following install tutorial:

* [For Japanese](https://www.wpi-aimr.tohoku.ac.jp/hiraoka_labo/homcloud/homcloud-docs-ja/OS_selects.html)
* [For English](https://www.wpi-aimr.tohoku.ac.jp/hiraoka_labo/homcloud/how-to-install.en.html) 

## General Information
This package requires the following

* [dipha](http://github.com/DIPHA/dipha)
* [cgal](http://www.cgal.org/)
* python3, numpy, scipy, matplotlib, pyqt5, msgpack, paraview, pillow

## Notes

* If you don't want to install the software globally, please use virtualenv or venv.

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
