# NAME

`pict.slice3d` - Shows the sliced images of 3D bitmap data in npy format

# SYNOPSIS

    python3 -m homcloud.pict.slice3d
        [-h] [-s SLICE] [-S SPACER] [-r RANGE]
        [--image-viewer IMAGE_VIEWER]
        input [input ...]

# ALIAS

    homcloud-pict-slice3d
    
# DESCRIPTION

This program shows the sliced images of 3D bitmap data in npy format.

`-s` option specfies n-th axis is used for slicing.

You can see the multiple npy data with same shape. `-S` option 
specifies the number of pixels between each sliced image.

`--image-viewer` specifies the program name of image viewer you want.
The viewer should be able to display multiple images by the order
or file paths. Some image viewers such as `eog` and `ristretto` is
good for that purpose.

# OPTIONS

    -h, --help            show this help message and exit
    -s SLICE, --slice SLICE
                          slicing direction (0, 1, or 2)
    -S SPACER, --spacer SPACER
                          spacer pixels
    -r RANGE, --range RANGE
                          range of slices
    --image-viewer IMAGE_VIEWER
                          image viewer program name

# EXAMPLES

    # Sliced by yz-plane (-s 2), the separator is 5 pixels, eog is used for image viewer
    python3 -m homcloud.pict.slice3d -s 2 -S 5 m1.npy m2.npy --image-viewer eog
