# NAME

`vectorize_PD` - Vectorize persistence diagram using persistence image

# SYNOPSIS

    python3 -m homcloud.vectorize_PD [-h] [-V] -d DEGREE [-T TYPE] [-N] [-x X_RANGE]
                             [-X XBINS] [-y Y_RANGE] [-Y YBINS] -D GAUSSIAN_SD
                             [-C C] [-p P] [-c COORDINATES]
                             [-H HISTOGRAM_INFORMATION] [-o OUTPUT]
                             [-w WEIGHT_TYPE]
                             input

# ALIAS

    homcloud-vectorize-PD
    

# DESCRIPTION

This program vectorize a PD using persistence image.

# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -d DEGREE, --degree DEGREE
                          degree of PH
    -T TYPE, --type TYPE  input file format (dipha, idipha, text) (default:
                          autodetect)
    -N, --negate          flip the sign of birth/death times for superlevel
                          persistence (default: False)
    -x X_RANGE, --x-range X_RANGE
                          birth range
    -X XBINS, --xbins XBINS
                          number of bins in birth-axis
    -y Y_RANGE, --y-range Y_RANGE
                          death range
    -Y YBINS, --ybins YBINS
                          number of bins in death-axis
    -D GAUSSIAN_SD, --gaussian-sd GAUSSIAN_SD
                          standard deviation of gaussian diffusion
    -C C                  weight constant C
    -p P                  weight constant p
    -c COORDINATES, --coordinates COORDINATES
                          file to write coordinates
    -H HISTOGRAM_INFORMATION, --histogram-information HISTOGRAM_INFORMATION
                          file to write histogram information
    -o OUTPUT, --output OUTPUT
                          output file
    -w WEIGHT_TYPE, --weight-type WEIGHT_TYPE
                          weight type (atan(default),linear,none)
                        
                        
                        
# OUTPUT FORMAT

Output data is a k dimensiona vector.
Output is the text file with k lines. Each line shows a real number.
