# NAME

dump_diagram - Display all birth death pairs

# SYNOPSYS

    python3 -m homcloud.dump_diagram
        [-h] [-V] -d DEGREE [-T TYPE] [-N] [-o OUTPUT] [-S SHOW_SIMPLICES]
        [-E SHOW_ESSENTIAL_PAIRS] [-s SYMBOLS]
        input


# ALIAS

    homcloud-dump-diagram

# DESCRIPTION

This program displyas all birth-death pairs on your console.

If -o option is given, the result is saved into the file instead of
showing pairs on the console.

If input data has index-map information, the data about birth/death
simplices are also displayed.

# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -d DEGREE, --degree DEGREE
                          degree of homology (default:1)
    -T TYPE, --type TYPE  Input file format (dipha(default), idipha)
    -N, --nagate          Flip the sign of birth/death times for superlevel
                          persistence (default: False)
    -o OUTPUT, --output OUTPUT
                          output text file
    -S SHOW_SIMPLICES, --show-simplices SHOW_SIMPLICES
                          show birth/death simplices (yes/no, default:yes)
    -E SHOW_ESSENTIAL_PAIRS, --show-essential-pairs SHOW_ESSENTIAL_PAIRS
                          show essential pairs (yes/no, default:no)
    -s SYMBOLS, --symbols SYMBOLS
                          show birth/death simplices by symbols(yes/no
                          default:no)

# OUTPUT FORMAT

When `-E yes` is given, all essential pairs (pairs with 
infinite death time) is shown. If `no` is given (default),
the pairs are not shown.

## CASE WITH `-S no` option
Birth times are shown on the 1st column, and
death times are shown on the 2nd column.
The columns are separated by a space.

Example:
    b1 d1
    b2 d2
      :

## CASE WITH `-S yes` OPTION FOR CUBICAL FILTRATION

Birth times are shown on the 1st column, 
death times are shown on the 2nd column,
positions of birth pixels are shown on the 3rd column, and
positions of death pixels are shown on the 4rd column.
The columns are separated by a space.

    Example:
    b1 d1 (x_b1,y_b1) (x_d1,y_d2)
    b2 d2 (x_b2,y_b2) (x_d2,y_d2)
        :

## CASE WITH `-S yes` OPTION FOR ALPHA FILTRATION

Birth times are shown on the 1st column, 
death times are shown on the 2nd column,
vertices of birth simplices are shown on the 3rd column, and
vertices of death simplices are shown on the 4rd column.
The columns are separated by a space.


    Example:
    b1 d1 {(x_b11,y_b11,z_b11),(x_b12,y_b12,z_b12)} {(x_d11,y_d11,z_d11),(x_d12,y_d12,z_d12),(x_d13,y_d13,z_d13)}
    b2 d2 {(x_b21,y_b21,z_b21),(x_b22,y_b22,z_b22)} {(x_d21,y_d21,z_d21),(x_d22,y_d22,z_d22),(x_d23,y_d23,z_d23)}
        :



