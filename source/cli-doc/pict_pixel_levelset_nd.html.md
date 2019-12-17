# NAME

`pict.pixel_levelset_nd` - Compute a persistence diagram from an N-dimensional binary bitmap by using a cubical levelset filtration

# SYNOPSIS

    python -m homcloud.pict.pixel_levelset_nd 
        [-h] [-V] [-m MODE] [-u UPPER_BOUND]
        [-l LOWER_BOUND] [-I] [-T TYPE] [-D] [-C] -o
        OUTPUT [-p PERIODIC] [--algorithm ALGORITHM]
        [-M SAVE_BOUNDARY_MAP] [--license]
        [input [input ...]]

# ALIAS

    homcloud-pict-pixel-levelset-nd

# DESCRIPTION

This program computes a persistence diagram from a cubical filtration
constrcuted by a given n-dimensional bitmap data.

# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -m MODE, --mode MODE  the way to construct dipha complex
                          (sublevel(default),superlevel)
    -I, --combine-index-map
                          combine the index map with the output filtration
    -T TYPE, --type TYPE  input data format
                          (text2d,text_nd(default),picture2d,pictures3d,npy)
    -D, --convert-to-diagram
                          call dipha and directly convert to a diagram
    -C, --cubical         Use explicit cubical filtration (slow)
    -o OUTPUT, --output OUTPUT
                          output file
    -p PERIODIC, --periodic PERIODIC
                          periodic (example: 0,1,1 for y and z are periodic)
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
