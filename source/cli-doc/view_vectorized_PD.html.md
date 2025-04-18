# NAMA

view\_vectorized\_PD - Plot vectorized PD in the histogram style

# SYNOPSYS

    pythom3 -m homcloud.view_viectorized_PD
        [-h] [-o OUTPUT] [-p POWER] [-l] [--loglog]
        [-m MAX] [-c COLORMAP]
        input vectorization_info

# ALIAS

    homcloud-view-vectorized-PD

# DESCRIPTION

This program plots the vectorized PD generated by vectorize\_PD
in the histogram style.

# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -o OUTPUT, --output OUTPUT
                          output image file
    -p POWER, --power POWER
                          Output x^POWER for each value x
    -l, --log             Output log(x+1) for each value x
    --loglog              Output log(log(x+1)+1)
    -m MAX, --vmax MAX    Maximum of colorbar (default: autoscale)
    -c COLORMAP, --colormap COLORMAP
                          matplotlib colormap name
    -s STYLE, --style STYLE
                          plotting style (colorhistogram(default), contour)
    -t Title, --title Title
                          Title string
    -U UNIT_NAME, --unit-name UNIT_NAME
                          The unit name of birth and death times


# EXAMPLE

    homcloud-vectorize-PD -d 0 -x "[-20.25:20.25]" -X 81 -D 0.5 -C 6 -p 4 -H histoinfo.json -o vect.txt data.idiagram
    # do something statistical processing
    # v.txt is created by the processing
    
    # View v.txt
    homcloud-view-vectorized-PD v.txt histoinfo.json
