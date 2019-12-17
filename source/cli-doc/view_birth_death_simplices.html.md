# NAME

view\_birth\_death\_simplices - View birth and death simplices computed from 3D point cloud

# SYNOPSIS

    python3 -m homcloud.view_birth_death_simplices [-h] -d DEGREE [-T TYPE] [-N]
                                                   pointcloud [input [input ...]]

# ALIAS

    homcloud.view_birth_death_simplices

# DESCRIPTION

This program shows birth and death simplices for each birth-death pair
computed from 3D point cloud using simple GUI.

The `pointcloud` file is the original point cloud input text file,
and  `input` should be the ".idiagram" file computed from the point cloud data.

# OPTIONS

    -h, --help            show this help message and exit
    -d DEGREE, --degree DEGREE
                          degree of PH
    -T TYPE, --type TYPE  input file format (dipha, idipha, text) (default:
                          autodetect)
    -N, --negate          flip the sign of birth/death times for superlevel
                          persistence (default: False)

