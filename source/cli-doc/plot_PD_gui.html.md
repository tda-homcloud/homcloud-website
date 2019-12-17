# NAME

plot\_PD\_gui -- plot_PD - Plot the output of dipha interactively.

# SYNOPSIS

    python3 -m homcloud.plot_PD_gui
        [-h] -d DEGREE [-T TYPE] [-N] [-x X_RANGE] [-X XBINS]
        [-y Y_RANGE] [-Y YBINS] [-U UNIT_NAME]
        [-n NORMALIZE_CONSTANT] [-p PH_TREES]
        input [input ...]

# ALIAS

    homcloud-plot-PD-gui

# DESCRIPTION

Using this program, you can plot the output of dipha interactively.
You can change the range and the number of bins from GUI wedgets.

You can specify multiple input files. In that case,
all pairs are displayed on the diagram.

# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -T TYPE, --type TYPE  input file format (dipha(default), idipha, text)
    -d DEGREE, --degree DEGREE
                          degree of PH (default: 1)
    -x X_RANGE, --x-range X_RANGE
                          birth range (required)
    -X XBINS, --xbins XBINS
                          number of bins in birth-axis (required)
    -y Y_RANGE, --y-range Y_RANGE
                          death range
    -Y YBINS, --ybins YBINS
                          number of bins in death-axis
    -U UNIT_NAME, --unit-name UNIT_NAME
                          The unit name of birth and death times
    -n NORMALIZE_CONSTANT, --normalize-constant NORMALIZE_CONSTANT
                          normalize constant to histogram height
    -p PH_TREES, --ph-trees PH_TREES
                          ph trees file (.pht)

# REQUIRES

This program requires pyqt5 in addition to numpy, scipy, and matplotlib.



