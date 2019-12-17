# NAME

optimal_volume - Compute volume optimal cycle

# SYNOPSYS

    homcloud-optimal-volume [-h] [-V] -d DEGREE [-x X] [-y Y] [-X X_RANGE]
        [-Y Y_RANGE] [-c CUTOFF_RADIUS] [-T TYPE]
        [-j JSON_OUTPUT] [-v VTK_OUTPUT] [-P] [-n RETRY]
        [-C OPTIMAL_CYCLE_CHILDREN]
        [--integer-programming INTEGER_PROGRAMMING]
        [--debug DEBUG] [--solver SOLVER]
        [--constrain-on-birth-simplex]
        [--skip-infeasible SKIP_INFEASIBLE]
        input

# ALIAS

    homcloud-optimal-volume
    
# DESCRIPTION

This program computes optimal volumes and
volume optimal cycles for given birth-death pairs.

The input diagram (.idiagram file) should have the information of
the boundary map. The information is computed by the following programs
with `-M on` option:

* `homcloud-pc-alpha`
* `homcloud-pict-binarize-nd` 
* `homcloud-pict-pixel-levelset-nd`

You can specify single point by using `-x` and `-y` option.
By using these options, the program choose the closest birth-death pair
and compute an optimal volume and a volume optimal cycle for the pair.

You can also specify a rectangle region on persistence diagram
by using `-X` and `-Y` options. The program computes all 
volume optimal cycels for birth-death pairs in the given rectangle.

# OPTIONS

    -h, --help            show this help message and exit
    -V, --version         show program's version number and exit
    -d DEGREE, --degree DEGREE
                          degree of PH
    -x X                  birth time of the pair
    -y Y                  death time of the pair
    -X X_RANGE, --x-range X_RANGE
                          birth time of the pair
    -Y Y_RANGE, --y-range Y_RANGE
                          death time of the pair
    -c CUTOFF_RADIUS, --cutoff-radius CUTOFF_RADIUS
                          cut-off radius in R^n
    -j JSON_OUTPUT, --json-output JSON_OUTPUT
                          output in json format
    -v VTK_OUTPUT, --vtk-output VTK_OUTPUT
                          output in vtk format
    -P, --invoke-paraview
                          invoke paraview for visualization
    -n RETRY, --retry RETRY
                          number of retry
    -C OPTIMAL_CYCLE_CHILDREN, --optimal-cycle-children OPTIMAL_CYCLE_CHILDREN
    --integer-programming INTEGER_PROGRAMMING
                          use integer programming (on/*off*)
    --debug DEBUG         debug mode (on/*off*)
    --solver SOLVER       LP solver
    --constrain-on-birth-simplex
                          constrain on the birth simplex
    --skip-infeasible SKIP_INFEASIBLE
                          skip infeasible (on/*off*)

# OUTPUT FORMAT

The output format of this module is json.

    {
        "format-version": double, /* version of the format of this file */
        "query": query, /* Query information */
        "dimension": int, /* Dimension of the input data */
        "num-volumes": int, /* The number of results */
        "num-infeasible": int,  /* The number of "infeasible" erros */
        "result": array of result /* The list of all optimal volumes */
    }
    
    query: point_query or rectangle_query
    
    point_query: {
        "query-target": "volume-optimal-cycle",
        "query-type": "signle",
        "birth": double, /* Query coordinate X */
        "death": double, /* Query coordinate Y */
        "degree": int, /* the degree of homology */
        "cutoff-radius": double or null, /* cutoff radius */
        "num-retry": int, /* the maximum number of retries */
        "integer-programming": bool, /* use integer programming */
        "constrain-on-birth-simplex": false, 
        "skip-infeasible": bool, /* skip "infeasible" errors */
        "optimal-cycle-children": bool,
        "solver": string, /* The name of the LP solver */
        "owned-volume": double or null,
        "owned-volume-connected-component": bool,
        "tightened-volume": double or null,
        "tightened-subvolume": double or null,
        "no-optimal-cycle": bool, /* optimal volume is not computed */
    }

    rectangle_query: {
        "query-target": "volume-optimal-cycle",
        "query-type": "rectangle",
        "birth-range": [double, double] /* The range of Query coordinate X */
        "death-range": [double, double] /* The range of Query coordinate X */
        "degree": int, /* the degree of homology */
        "cutoff-radius": double or null, /* cutoff radius */
        "num-retry": int, /* the maximum number of retries */
        "integer-programming": bool, /* use integer programming */
        "constrain-on-birth-simplex": false, 
        "skip-infeasible": bool, /* skip "infeasible" errors */
        "optimal-cycle-children": bool,
        "solver": string, /* The name of the LP solver */
        "owned-volume": double or null,
        "owned-volume-connected-component": bool,
        "tightened-volume": double or null,
        "tightened-subvolume": double or null,
        "no-optimal-cycle": bool, /* optimal volume is not computed */
    }

    result: {
        "birth-time": double, /* birth time */
        "death-time": double, /* death time */
        "points": array of point /* all vertices in the volume */
        "simplices": array of simplex /* all simplices in the volume, 
            only available for simplicial filtrations */
        "cubes": array of cubes /* all simplices in the volume, 
            only available for cubical filtrations */
        "boundary": array of simplex/cube /* all simplices in the boundary of the volume */
        "boundary-points": array of point /* all points in the boundary of the volume*/
        "children": array of pair/array of optimal_volume, /* children pairs' information */
    }

    pair: {
        "birth-time": double, /* birth time */
        "death-time": double, /* death time */
    }

    point: array of float
    simplex: array of point
    cube: [array of int, array of bool]

If -C option is activated, "children" field has an array of volume optimal cycles
for children birth-death pairs. This computation will be expensive for a large
volume optimal cycle. On the other hand, if -C option is not activated,
only birth time and death time is output. In this case, the computation cost is
very small.

# EXAMPLE

Single birth-death pair query.

    python3 -m homcloud.optimal_volume -d 1 -x 2.5 -y 6.2 -j voc.json example.idiagram

Rectangle query.

    python3 -m homcloud.optimal_volume -d 1 -x 2.4:2.5 -y 6.2:6.3 -j voc.json example.idiagram
