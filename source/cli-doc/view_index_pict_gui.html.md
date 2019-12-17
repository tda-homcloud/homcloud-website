# NAME

view\_index\_pict\_gui -- View birth and death pixels for 2D cubical filtrations created by digital pictures interactively

# SYNOPSYS

    python3 -m homcloud.view_index_pict_gui
            [-h] -d DEGREE [-T TYPE] [-N]
            picture diagram

# ALIAS

    homcloud-view-index-pict-gui

# DESCRIPTION

You can view the birth and death pixels s for 2D cubical filtrations
of persistence digrams interactively.
You can use the diagrams created by pict.binarize or pict.pixel_levelset, and dipha.

If you want to use this program, you need to run
pict.binarize or pict.pixel_levelset with -i/-I option and
create index\_map.

You need to specify two files, picture and diagram:
picture is the original picture file.
diagram is a dipha's PERSISTENCE\_DIAGRAM file or
index-combined dipha diagram file.

# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -d DEGREE, --degree DEGREE
                          Degree of PH (default=1)
    -T TYPE, --type TYPE  Input file format (dipha(default), idipha)
    -N, --negate          Flip the sign of birth/death times for superlevel
                          persistence (default: False)

# REQUIRES

This program requires pyqt5 in addition to numpy, scipy, and matplotlib.
