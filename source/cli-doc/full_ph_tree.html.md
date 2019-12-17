# NAME

`full_ph_tree` - Construct a tree structure data for (n-1)-th persistent homology

# SYNOPSIS

    python3 -m homcloud.full_ph_tree 
        [-h] [-V] -d DEGREE [-j DUMP_JSON] input output
        
# ALIAS

    homcloud-full-ph-tree
    
# DESCRIPTION

This program computes a tree structure data for (n-1)-th persistent homology
of the alpha filtration diagram of a point cloud in R^n based on the theory
of volume optimal cycle.

# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -d DEGREE, --degree DEGREE
                          degree of PH
    -j DUMP_JSON, --dump-json DUMP_JSON
                          json dump output

# INPUT
The input file should be the idiagram file computed from a point cloud

# OUTPUT
PH-tree format. You can query the output file by 

* `plot_PD_gui` with `-p` option by GUI
* `query_full_ph_tree` by CUI

You can also use all tree information in json format with `-j` option.

# OUTPUT JSON FORMAT

    # root struct
    {
        "dim": int, /* dimension of a point cloud */
        "num-node": int, /* the number of nodes */
        "nodes": dict of (nodeid, node) pairs
    }
    # Node struct
    {
        "index": string, /* id of the node itself */
        "parent": string, /* id of the parent node */
        "birth-time": float, /* birth time */
        "death-time": float, /* death time */
        "simplices": list of Simplex, /* all simplices contained in the volume */
        "birth-simplex": Simplex, /* birth simplex */
        "death-simplex": Simplex, /* death simplex */
        "points": list of Point /* all vertices contianed in the volume */
    }
    # Simplex
    list of Point /* vertices */
    # Point
    list of float /* coordinate values */

# EXAMPLE

    # Compute diagram
    python3 -m homcloud.pc2diphacomplex -d 3 -I -D sphere_packing.txt sphere_packing.idiagram
    # Compute tree structure
    python3 -m homcloud.full_ph_tree -d 2 sphere_packing.idiagram sphere_packing.pht -j sphere_packing_tree.json
    # See the tree data using plog_PD_gui
    python3 -m homcloud.plog_PD_gui -d 2 -p sphere_packing.pht sphere_packing.idiagram

# NOTES

The argument of `-d` option must be `n-1` for a point cloud in R^n.
