# Name

pict.binarize_nd - Compute a persistence diagram from an N-dimensional binary bitmap by using a cubical dilation-erosion filtration

# SYNOPSIS

    python3 -m homcloud.pict.binarize_nd
        [-h] [-V] [-T TYPE] [-m MODE] [-t THRESHOLD]
        [--gt GT] [--lt LT] -o OUTPUT [-s] [-I]
        [--metric METRIC] [-D] [-C] [-p PERIODIC]
        [--mask MASK] [--algorithm ALGORITHM]
        [-M SAVE_BOUNDARY_MAP] [--license]
        [input [input ...]]

# ALIAS

    homcloud-pict-binarize-nd

# DESCRIPTION

This program computes a persistence diagram from an N-dimensional 
binary bitmap file by using a cubical dilation-erosion filtration.

The program accepts the following types of file formats:
`text2d`, `text_nd`, `picutre2d`, `pictures3d` and `npy`.
If you want to know the details, please see INPUT FILE FORMAT section below.

The input bitmap data is binarized by a given threshold (-t).
After that a dilation-erosion filtration is constructed and 
a persistnece diagram is computed and saved into the OUTPUT.

If you want to flip the roles of black pixels and white pixels,
please use -m option.

By default manhattan distance is used. You can use other distances
like euclidean or chebyshev by --metric option.

# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -T TYPE, --type TYPE  input data format
                          (text2d,text_nd(default),picture2d,pictures3d,npy)
    -m MODE, --mode MODE  the way to construct dipha complex (black-base|white-
                          base, default is black-base)
    -t THRESHOLD, --threshold THRESHOLD
                          threshold for binarization (default: 128)
    --gt GT               lower threshold
    --lt LT               upper threshold
    -o OUTPUT, --output OUTPUT
                          output complex file name
    -s, --ensmall         ensmall binarized picture
    -I, --combine-index-map
                          combine the index map with the output filtration
    --metric METRIC       metric used to enlarge binarized image
                          (manhattan(default), euclidean, etc.)
    -D, --convert-to-diagram
                          call dipha and directly convert to a diagram
    -C, --cubical         use explicit cubical filtration (slow)
    -p PERIODIC, --periodic PERIODIC
                          periodic (example: 0,1,1 for y and z are periodic)
    --mask MASK           mask bitmap
    --algorithm ALGORITHM
                          algorithm (dipha, phat-twist, phat-chunk-parallel)
    -M SAVE_BOUNDARY_MAP, --save-boundary-map SAVE_BOUNDARY_MAP
                          save boundary map into idiagram file(only available
                          with phat-* algorithms, on/*off*)
    --license             show license and exit


# INPUT FILE FORMAT

The program accepts the following types of file formats:
`text2d`, `text_nd`, `picutre2d`, `pictures3d` and `npy`.

## text2d
2D pixel (floating point number) values represented by a text as follows:

    x_11 x_12 ... x_1n
    x_21 x_22 ... x_2n
     :    :        :
    x_m1 x_m2 ... x_mn

Each coefficient should be floating point numbers. These values are
binarized by the threshold value given by -t option.

## text_nd

N-dimensional pixel (floating point number) values represented by a text as in the
following format:

* First line represents the shape of data. For example, if the shape of your data
  is 200x230x250, first line should be `200 230 250`.
* The following lines are floating point number values in x-fastest direction
* A line starting with `#` is skipped as a comment
* An empty line is also skipped.

An example is as follows:

    # 4x3x2 3D voxel data
    4 3 2
    
    1 2 3 4
    5 6 7 8
    9 10 11 12
    
    13 14 15 16
    17 18 19 20
    21 22 23 24

## picture2d
A gray scale PNG or TIFF file. 

If the input file is 16bit grayscale file, the pixel value
is normalized to the range of 0 .. 255. 

## pictures3d

Gray scale PNG or TIFF files.
All picture sizes must be same. If not, an error occurs.
All pictures are stacked in the commandline order.

If the input file is 16bit grayscale file, the pixel value
is normalized to the range of 0 .. 255. 

## npy

Numpy's npy file.

Please see https://docs.scipy.org/doc/numpy/neps/npy-format.html for details
of this format.

# OUTPUT FORMAT

If `-D` option is given, the output file is not a boundary matrix data,
but a diagram data. In this case, a persistence diagram is computed
from the cubical filtration.
dipha's diagram file is written if `-I` option is not given, and
indexed-diagram file (idiagarm) file is written if `-I` option is given.

# NOTES

Now this program always should run `-D` option. If `-D` option is not given,
a warning message is shown.
