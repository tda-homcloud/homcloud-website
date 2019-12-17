# NAME

pict.tree - Compute a persistence tree from bitmap data

# SYNOPSIS

    python3 -m homcloud.pict.tree [-h] [-V] -m MODE [-t THRESHOLD] [--gt GT] [--lt LT]
        [-s] [--metric METRIC] [-T TYPE] [-O OUTPUT_TYPE] -o
        OUTPUT [input [input ...]]

# ALIAS

    homcloud-pict-tree
    
# DESCRIPTION

This program compute persistence tree from bitmap data.

Sublevel, superlevel, and dilation/erosion filtrations are available.
You can specify it with `-m` option.
Both 0th and (n-1)-th persistence trees are computed by this program.

Some options are common with `pict.binarize_nd` and `pict.pixel_levelset_nd`.
Please see the document of these program for the detailed documents of
this program.

There are two types of output data format, msgpack (.p2mt) and
json (.json). You can choose one of them with `-O` option.

# OPTIONS

    optional arguments:
      -h, --help            show this help message and exit
      -V, --version         show program's version number and exit
      -m MODE, --mode MODE  mode (white-base or black-base for binarize,
                            superlevel or sublevel for levelset)

    for binarize:
      -t THRESHOLD, --threshold THRESHOLD
      --gt GT               lower threshold
      --lt LT               upper threshold
      -s, --ensmall         ensmall binarized picture
      --metric METRIC       metric used to enlarge binarized image
                            (manhattan(default), euclidean, etc.)

    for input and output:
      -T TYPE, --type TYPE  input data format (text2d, text_nd(default),
                            picture2d, picture3d, npy)
      -O OUTPUT_TYPE, --output-type OUTPUT_TYPE
                            output file format (json, msgpack(default))
      -o OUTPUT, --output OUTPUT
                            output file

# INPUT
There are four type of input data.

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

# OUTPUT

You can choose either msgpack format or json format. The contents is
same in both format.

    {
        "dim": int, /* dimension of the input data */
        "upper": tree_info, /* tree information of the 0th persistence tree */
        "upper": tree_info, /* tree information of the (dim-1)-th persistence tree */
    }
    # structure of tree_info
    {
        "degree": int,
        "nodes": dict of (nodeid: node) pairs, 
    }
    # structure of node
    {
        "id": string, /* id of the node, string of nonnegative integers, not incremental */
        "parent": string, /* id of the parent node, null if the node has no parent */
        "birth-time": double, /* birth time */
        "death-time": double, /* death time */
        "birth-pixel": pixel, /* birth pixel */
        "death-pixel": pixel, /* death pixel */
        "volume": list of pixel /**/
    }
    # structure of pixel
    list of int, /* the length is the same as the dimension of input bitmap, 
                    ordered by numpy order (for example, y, x for 2d picture) */

# NOTE

Now this program is relatively slow. If you feel that 
the performance of this program is a bottleneck of your analysis, 
please request the performance improvement to the authors.
If not, this program remains slow.

