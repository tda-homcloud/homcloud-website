# NAME

view\_index\_pict -- Put birth and death pixels for 2D cubical filtrations created by digital pictures

# SYNOPSYS

    python3 -m homcloud.view_index_pict 
        [-h] -d DEGREE [-T TYPE]
        [-f FILTER]
        [-B] [-D] [-L] [-s SCALE] [--no-label]
        [--show-command SHOW_COMMAND] [-o OUTPUT]
        picture diagram

# ALIAS

homcloud-view-index-pict

# DESCRIPTION

Put birth and death pixels for 2D cubical filtrations created by digital pictures.
You can use the diagrams created by pict.binarize or pict.pixel_levelset, and dipha.

You need to specify two files, picture and diagram:
picture is the original picture file.
diagram is a dipha's PERSISTENCE\_DIAGRAM file or
index-combined dipha diagram file.

If you want to see the birth and death pixels interactively,
please use view\_index\_pict\_gui intead.

# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -d DEGREE, --degree DEGREE
                          Degree of PH
    -T TYPE, --type TYPE  Input file format (dipha, idipha, text) (default:
                          autodetect)
    -N, --negate          Flip the sign of birth/death times for superlevel
                          persistence (default: False)
    -f FILTER, --filter FILTER
                          filters (ex: "lifetime > 5.0")
    -B, --birth           plot birth pixels
    -D, --death           plot death pixels
    -L, --line            draw line between death and birth pixels
    -s SCALE, --scale SCALE
                          image scaling factor (1, 3, 5, ...)
    --show-command SHOW_COMMAND
                          image display command
    --no-label            birth-death labels are not drawn
    -o OUTPUT, --output OUTPUT
                          output file name

