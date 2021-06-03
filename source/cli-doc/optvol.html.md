# NAME

optvol - Compute optimal volumes and volume-optimal cycles

# SYNOPSYS

    python3 -m homcloud.optvol [-h] [-V] [--license] -d DEGREE [-x X] [-y Y] [-X X_RANGE] [-Y Y_RANGE] 
        [-j JSON_OUTPUT] [-P] [-T TYPE] [-e EPSILON]
        [-c CUTOFF_RADIUS] [-n RETRY] [--skip-infeasible SKIP_INFEASIBLE] 
        [--solver SOLVER] [-O OPTION]
        input

# ALIAS

    homcloud-optvol
    
# DESCRIPTION

This program computes optimal volumes and
volume optimal cycles for given birth-death pairs.

The input diagram (.idiagram file) should have the information of
the boundary map. The information is computed by the following programs
with `-M on` option:

* `homcloud-pc-alpha`
* `homcloud-pict-binarize-nd` 
* `homcloud-pict-pixel-levelset-nd`

You can specify a single point by using the `-x` and `-y` options.
The program chooses the closest birth-death pair
with these options and computes an optimal volume and an optimal volume cycle for the pair.

You can also specify a rectangle region on the persistence diagram
using `-X` and `-Y` options. The program computes all volume-optimal cycles for birth-death pairs 
in the given rectangle.


# OPTIONS

    positional arguments:
      input                 input filename

    optional arguments:
      -h, --help            show this help message and exit
      -V, --version         show program's version number and exit
      --license             show license and exit

    target:
      -d DEGREE, --degree DEGREE
                            degree of PH
      -x X                  birth time of the pair
      -y Y                  death time of the pair
      -X X_RANGE, --x-range X_RANGE
                            birth time of the pair
      -Y Y_RANGE, --y-range Y_RANGE
                            death time of the pair

    output options:
      -j JSON_OUTPUT, --json-output JSON_OUTPUT
                            output in json format
      -P, --invoke-paraview
                            invoke paraview

    computation parameters:
      -T TYPE, --type TYPE  target type (*optimal-volume*, tightened-volume, or tightened-
                            subvolume
      -e EPSILON, --epsilon EPSILON
                            tighened-volume/subvolume epsilon
      -c CUTOFF_RADIUS, --cutoff-radius CUTOFF_RADIUS
                            cut-off radius in R^n
      -n RETRY, --retry RETRY
                            number of retry
      --skip-infeasible SKIP_INFEASIBLE
                            skip infeasible (on/*off*)

    solver parameters:
      --solver SOLVER       LP solver name
      -O OPTION, --option OPTION
                            options for LP solver


# OUTPUT FORMAT

The output format of this module is json.

    {
        "format-version": double, /* version of the format of this file */
        "query": query, /* Query information */
        "results": array of result /* The list of all optimal volumes */
    }
    
    query: {
        "degree": int, /* degree of PH */
        "solver-name": string, /* LP solver name*/
        "solver-options": string or null, /* LP solver options*/
        "cutoff-radius": double or null, /* cutoff radius */
        "num-retry": 1, /* the maxmum number of retry for each query */
        "query-target": string,
        "birth": double, /* the birth time for point query */
        "death": double  /* the death time for point query */
        "birth-rainge": [double, double] /* the range of birth times for rectangle query */
        "death-rainge": [double, double] /* the range of death times for rectangle query */
    }
    
    result: {
        "birth-time": double, /* birth time */
        "death-time": double, /* death time */
        "birth-index": int,
        "death-index": int,
        "success": bool, /* true if the query is not infeasible */
        "points": array of point /* all vertices in the volume */
        "simplices": array of simplex /* all simplices in the volume, 
            only available for simplicial filtrations */
        "boundary": array of simplex/cube /* all simplices in the boundary of the volume */
        "boundary-points": array of point /* all points in the boundary of the volume*/
        "points-symbols": array of symbol /* all vertices in the volume */
        "simplices-symbols": array of symbol-simplex /* all simplices in the volume, 
            only available for simplicial filtrations */
        "boundary-symbols": array of symbol-simplex /* all simplices in the boundary of the volume */
        "boundary-points-symbols": array of symbol /* all points in the boundary of the volume*/
        "children": array of pair, /* children pairs' information */
    }

    pair: {
        "birth-time": double, /* birth time */
        "death-time": double, /* death time */
        "birth-index": int,
        "death-index": int,
    }

    point: array of float
    simplex: array of point
    symbol: string
    symbol-simplex: array of symbol
    cube: [array of int, array of bool]


# EXAMPLE

A Single pair query.

    python3 -m homcloud.optvol -d 1 -x 2.5 -y 6.2 -j voc.json example.idiagram

Rectangle query.

    python3 -m homcloud.optvol -d 1 -X "[2.4:2.5]" -Y "[6.2:6.3]" -j voc.json example.idiagram
