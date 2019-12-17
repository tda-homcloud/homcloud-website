# NAME

dipha - Call dipha

# SYNOPSIS

    python3 -m homcloud.dipha
            [-h] [-T TYPE] [-n PARALLELS] input output

# ALIAS

    homcloud-dipha

# DESCRIPTION

This program is a wrapper for dipha command.
Mainly this program is used to work with index-combined data.

This program is obsolete. You should use `homcloud.pc_alpha`,
`homcloud.pict.pixel_levelst_nd`, and `homcloud.pict.binarize_nd` with `-D` option.


# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -T TYPE, --type TYPE  input type (dipha, idipha)
    -n PARALLELS, --parallels PARALLELS
                          number of parallel computation (default: 1)

# EXAMPLE

    python3 -m homcloud.dipha -T idipha -n 2 input.idiagram output.icomplex
