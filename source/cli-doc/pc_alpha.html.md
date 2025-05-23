# NAME

`pc_alpha` - Compute a persistence diagram from alpha filtration

# SYNOPSIS

    python3 -m homcloud.pc2diphacomplex
            [-h] [-t TYPE] [-n NOISE] 
            [-d DIMENSION] [-w] [--no-square] [-I] [-P] [-A]
            INPUT OUTPUT

# ALIAS

    homcloud-pc-alpha

# DESCRIPTION

This program computes (weighted and non-weighted) alpha filtration for dipha
from (weighted or non-weighted) point clouds.

# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -t TYPE, --type TYPE  Input file format type
    -n NOISE, --noise NOISE
                          level of additive noise
    -d DIMENSION, --dimension DIMENSION
                          dimension of the input data
    -w, --weighted        use an weighed alpha filtraion
    --no-square           no squared output, if a birth radius is negative, the
                          output is -sqrt(abs(r))
    -I, --combine-index-map
                          combine the index map with the output filtration
    -D, --convert-to-diagram
                          call dipha and directly convert to a diagram
    -P, --partial-filtration
                          Compute partial filtration (relative homology)
    -A, --check-acyclicity
                          Check acyclicity for paritial filtration
    -M SAVE_BOUNDARY_MAP, --save-boundary-map SAVE_BOUNDARY_MAP
                          save boundary map into idiagram file(only available
                          with phat-* algorithms, *on*/off)
    --algorithm ALGORITHM
                          algorithm (dipha, phat-twist(default), phat-chunk-
                          parallel)
    --vertex-symbols VERTEX_SYMBOLS
                          vertex symbols file
    --license             show license and exit


# INPUT FILE FORMAT

You can use both weighed alpha filtraiton and non-weighted alpha filtration.

The input format of a non-weighted 3d point cloud of is:

    # A line starting with sharp sign is ignored
    x_1 y_1 z_1
    x_2 y_2 z_2
    :

You can use 2d point cloud:

    x_1 y_1
    x_2 y_2
      :

In the weighted case, the input file for 3d is:

    x_1 y_1 z_1 w_1
    x_2 y_2 z_2 w_2
       :

The weights should be squared (for example, you should put the
square of vanderwaals radius.
The lines starting with sharp sign are always ignored.

Now 2d weighted alpha filtration is not supported because of
the limitation of cgal.

# OUTPUT FILE 

If `-D` option is given, the output file is a diagram data. 
In this case, a persistence diagram is computed
from the boundary matrix.
dipha's diagram file is written if `-I` option is not given, and
indexed-diagram file (idiagarm) file is written if `-I` option is given.

# NOTES
This module was previously named `pc2diphacomplex` and renamed to
`pc_alpha`. Now the name `pc2diphacomplex` is obsolete.

Now the usage of `-D` option is always reocommend. This option is planned
to be mandatory and removed in a future version.
