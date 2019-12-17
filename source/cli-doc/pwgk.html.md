# NAME

pgwk -- Compute a gram matrix using PWGK kernel using PWGK

# SYNOPSYS

    python3 -m homcloud.pwgk
        [-h] -d DEGREE [-T TYPE] -D GAUSSIAN_SD
        [-C C] [-p P] [-s SECOND_GAUSSIAN_SD] [-N NUM_SAMPLES]
        [-o OUTPUT]
        input [input ...]

# ALIAS

    homcloud-pwgk

# DESCRIPTION

Compute a gram matrix using PWGK kernel from given peristence diagrams.

Weight function is:

    atan(C * pers(x)^p)

where pers(x) is the lifetime of the birth-death pair x and
C and p are the parameters given by -C and -p options.
If -C and -p options are not given, the weight function is constant 1.

If -o option is not given, the gram matrix is written to standard output.


# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -d DEGREE, --degree DEGREE
                          Degree of PH
    -T TYPE, --type TYPE  Input file format (dipha, idipha, text) (default:
                          autodetect)
    -D GAUSSIAN_SD, --gaussian-sd GAUSSIAN_SD
                          standard deviation of gaussian diffusion
    -C C                  weight constant C
    -p P                  weight constant p
    -s SECOND_GAUSSIAN_SD, --second-gaussian-sd SECOND_GAUSSIAN_SD
                          second gaussian parameter
    -N NUM_SAMPLES, --num-samples NUM_SAMPLES
                          number of samples for computing PWGK with Monte-Carlo
    -o OUTPUT, --output OUTPUT
                          output file

# OUTPUT FORMAT

For the given diagrams D1, D2, ... Dn, the output is a gram matrix for
the kernel function k as follows:

    k(D1, D1) k(D1, D2) ... K(D1, Dn)
    k(D2, D1) k(D2, D2) ... K(D2, Dn)
        :        :              :
    k(Dn, D1) k(Dn, D2) ... K(Dn, Dn)

Numbers are separated by a space, and you can load
the matrix using numpy.loadtxt.
