# NAME

query_pht - Query a PH tree

# SYNOPSYS

    python3 -m homcloud.query_pht
        [-h] [-V] [-x X] [-y Y] [-X X_RANGE] [-Y Y_RANGE]
        [--ancestors] [-j JSON_OUTPUT] [-v VTK_OUTPUT] [-P]
        input

# ALIAS

    homcloud-query-pht
    
# DESCRIPTION

This program retrieve optimal volume and volume optimal cycles from a PH tree.

The PH tree information (a file with `.pht` suffix) is computed 
by `full_ph_tree` module.

If you want to query a volume optimal cycle for a single birth-death pair,
you should use both `-x` and `-y` options. The closest birth-death pair
given by these options are specified.

If you want to qury volume optimal cycles for multiple birth-death pairs
in a rectangle, you should use `-X` and `-Y` options.
For each birth-death pairs in the given rectangle, the corresponding
volume optimal cycle is shown.

You cannot use `-x -y` pairs and `-X -Y` pairs of options at the same time.

# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -x X                  birth time of the pair
    -y Y                  death time of the pair
    -X X_RANGE, --x-range X_RANGE
                          birth time of the pair
    -Y Y_RANGE, --y-range Y_RANGE
                          death time of the pair
    --ancestors           store ancestors
    -j JSON_OUTPUT, --json-output JSON_OUTPUT
                          output in json format

# OUTPUT FORMAT

The output format of this module is json.

    {
        "format-version": double, /* version of the format of this file */
        "query": query, /* Query information */
        "dimension": int, /* Dimension of the input data */
        "num-volumes": int, /* The number of results */
        "result": array of result /* The list of all optimal volumes */
    }

    query: point_query or rectangle_query
    
    point_query: {
        "query-target": "phtree-volume-optimal-cycle",
        "query-type": "signle",
        "birth": double, /* Query coordinate X */
        "death": double, /* Query coordinate Y */
        "degree": int, /* the degree of homology */
        "optimal-cycle-children": bool,
        "ancestor-pairs": bool,
    }

    rectangle_query: {
        "query-target": "phtree-volume-optimal-cycle",
        "query-type": "rectangle",
        "birth-range": [double, double] /* The range of Query coordinate X */
        "death-range": [double, double] /* The range of Query coordinate X */
        "degree": int, /* the degree of homology */
        "optimal-cycle-children": bool,
        "ancestor-pairs": bool,
    }

    result: {
        "id": int, /* the index of the pair */
        "parent": int, /* the index of the parent pair */
        "birth-time": double, /* birth time */
        "death-time": double, /* death time */
        "points": array of point /* all vertices in the volume */
        "simplices": array of simplex /* all simplices in the volume */
        "boundary": array of simplex /* all simplices in the boundary of the volume */
        "boundary-points": array of point /* all points in the boundary of the volume*/
        "birth-simplex": simplex, /* the birth simplex */
        "death-simplex": simplex, /* the death simplex */
        "ancestors": array of birth_death_pair, /* array of ancestor pairs, from the birth-death itself to its ancestors */
        "descendants": array of birth_death_pair, /* array of descendent pairs, the order is not specified */
        "children": array of volume_optimal cycle, /* children pairs' information */
    }
    
    point: array of float
    simplex: array of point


# EXAMPLE

Single birth-death pair query.

    python3 -m homcloud.query_pht -x 2.5 -y 6.2 -j voc.json example.pht

Rectangle query.

    python3 -m homcloud.query_pht -x 2.4:2.5 -y 6.2:6.3 -j voc.json example.pht
