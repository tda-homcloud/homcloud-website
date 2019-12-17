# NAME

`plot_PD_slice` - Plot the 1d slice of PD histogram.

# SYNOPSIS

    homcloud-plot-PD-slice [-h] [-V] -d DEGREE [-T TYPE] [-N]
                          [-l LEFT_LABEL] [-r RIGHT_LABEL] [-b BINS]
                          [--log] [-o OUTPUT] [--dpi DPI]
                          birth1 death1 birth2 death2 width input
                          [input ...]

# ALIAS

    homcloud-plot-PD-slice
    
# DESCRIPTION

This program plots the 1d slice of PD histogram.

The program take the slice on a segment from (birth1, death1) to (birth2, death2).
Points on the segment strip whose width is `width` are counted to
construct 1d histogram.

# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -d DEGREE, --degree DEGREE
                          degree of PH
    -T TYPE, --type TYPE  input file format (dipha, idipha, text) (default:
                          autodetect)
    -N, --negate          flip the sign of birth/death times for superlevel
                          persistence (default: False)
    -l LEFT_LABEL, --left-label LEFT_LABEL
                          label for starting point
    -r RIGHT_LABEL, --right-label RIGHT_LABEL
                          label for end point
    -b BINS, --bins BINS  number of bins
    --log                 log scale
    -o OUTPUT, --output OUTPUT
                          output file path
    --dpi DPI             output dpi

# INPUT FORMAT

You can same data format as `plot_PD` and `plot_PD_gui` for an input file.
`.diagram` data, `.idiagram` data, and text data are available.

If multiple input files are specified, all birth-death pairs in the input files
are counted together.

# OUTPUT

If `-o` option is not given, the histogram is shown in your window.
If `-o` option is given, the output figure file format is determnined
by its extension. For example, PNG(.png), PDF(.pdf), etc. are available.
Other formats are also available if matplotlib supports the formats.
