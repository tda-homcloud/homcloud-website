# News for 2.2.0 (2018/11/9)
* Rename optimal_cycle moule to optimal_volume
  * optimal_cycle is also available for backward compatibility
* `optimal_volume` supports `--threads` option to specify the number of threads
  for LP solver.
* Support older msgpack-python package

# News for 2.1.0 (2018/10/25)
* Fix a bug of -P option of `homcloud-pc-alpha` module
* Fix a bug of -n option of `homcloud-pc-alpha` module
* Implement the new "eigenvolume" feature in `optimal_cycle` module
  * Uses can compute three types of eigenvolumes by the following options
    * `--owned-volume`
    * `--tightened-volume`
    * `--tightened-subvolume`
  * Uses can also compute these types of eigenvolumes from `plot_PD_gui`
* Add `--no-optimal-volume` option to `optimal_cycle` module
* Add a new module `pict.slice3d` to show the 3D npy data by 2d slice images.
* Activate `-S` option in `pict.show_volume_2d`
* Now `plot_PD_gui` suuports the folloiwng options: `--power`, `-l`, `--loglog`,
  `-m`, `--colormap`
* Now `plot_PD_gui` correctly treats `-y` and `-Y` options
* Add some widgets to `plot_PD_gui`

# News for 2.0.0 (2018/9/5)
* Merge `homcloud-base` package and `homcloud-advanced` package
* Rename `pc2diphacomplex` to `pc_alpha` (`pc2diphacomplex` is now also available for
  backward compatibility)
* Support periodic cubical filtration
  * Use `-p` (`--periodic`) option for `pict.binarize_nd` and `pict.pixel_levelset_nd`
* Total refactoring
* Remove `view_birth_death_simplices` module
* Update `optimal_cycle` module, you should compute a `.idiagram` file 
  with `-M` option to compute a volume optimal cycle
  
# News for 1.3.1 (2018/7/05)
* Fix a bug of "-n" option in pc2diphacomplex
* Support CubicalRipser (https://github.com/CubicalRipser)
  Set the environmennt variable "HOMCLOUD_USE_CUBICALRIPSER" to "1" if you want to use
  them.
* Rewrite pict.tree by C++ for speed up
* dump_diagram supports -E (--show-essential-pairs) option

# News for 1.3.0 (2018/5/28)
* Relase homcloud-advanced publicly under OSS

# News for 1.2.2 (2018/5/17)
* Support CGAL 4.12 (follow CGAL's breaking changes)

# News for 1.2.1 (2018/4/22)
* Fix a bug in `plot_PD_gui`

# News for 1.2.0 (2018/3/28)
* Improve error mesasge of N-dimensional bitmap loading
* Change the json format of `full_ph_tree`
* Fix a packaging bug on `pict.show_volume_2d`
* Fix a bug in `plot_PD_slice`

# News for 1.1.1 (2018/3/1)
* Fix a bug introduced at 1.1.0. (reported by: S. Kiyohara and K. Akagi)

# News for 1.1.0 (2018/2/13)
* Change the handling of signs for superlevel filtration.
  You can correctly handle the signs if you use .idiagram files, but some problems
  occur if you use .diagram files.

# News for 1.0.0 (2018/1/28)
* Add some examples for homcloud-base
* Add -o option to `plot_diagram`

# News for 0.9.5 (2018/1/10)
* Fix paraview invocation on Windows
* Add new program `pict.show_volume_2d`
* Reverse birth/death colors in `view_index_pict_gui` to use the same color as other programs
* Add new color options to `view_index_pict`:
  `--birth-color`, `--death-color`, and `--line-color`.
* In `view_index_pict`, the default value of `-s` option is changed from 3 to 1
* Now you can change the program name of the paraview by the environment variable
  `HOMCLOUD_PARAVIEW_PROGRAMNAME`

# News for 0.9.4 (2017/11/30)
* Refine GUI of mouse event handling on canvas
* Enable to show children's birth-death pair by `optimal_cycle`
* Enable to show children's voluems by `optimal_cycle`
* Add `--optimal-cycle-options` option to `plot_PD_gui`
* Add `--reorder-process` option to `vectorized_PD`

# News for 0.9.3 (2017/10/20)
* Change json format spec of `full_ph_tree` and `pict.tree`
* Support CGAL 4.11

# News for 0.9.2 (2017/9/15)
* Add new program `pict.tree`
* Add `--text-output` option to `plot_PD_slice`

# News for 0.9.1 (2017/8/31)
* Update `optimal_cycle`
* Fix paraview problem on Mac OS X
* Use embedded LP solver of pulp by default in `optimal_cycle`

# News for 0.9.0 (2017/8/17)
* Add new program `plot_PD_slice`
* Add `--aspect` option to `plot_PD` and `plot_PD_gui`
* Update documents

# News for 0.8.8 (2017/7/20)
* Remove `ph_tree` and `birth_death_area` modules
  * These modules have been marked as obsolete
* Fix bugs

# News for 0.8.7 (2017/7/18)
* Add optimal_cycle module to compute volume optimal cycle
* Add `--optimal-cycle` option to `plot_PD_gui`
* Remove `__init__.py` and use PEP-420

# News for 0.8.6 (2017/7/4)
* Add -j option to `full_ph_tree`
* Fix clang c++11 compile problem

# News for 0.8.5 (2017/6/29)
* Add -A and -P to `pc2diphacomplex`
* Support linear weight in `vectorize_PD`
* Fix bugs

# News for 0.8.4 (2017/5/01)
* Add `write-volume-simplices-in-rectangle` command to `query_full_ph_tree`

# News for 0.8.3 (2017/4/17)
* Add help command to `query_full_ph_tree`
* Add `write-volume-points-in-rectangle` command to `query_full_ph_tree`
* Add `merge_tree_levelset` module to compute persistence-merge-tree

# News for 0.8.2 (2017/4/13)
* Add new option `--vmin` to `plot_PD`
* Fix a bug

# News for 0.8.1
* Fix a bug in pict.utils

# News for 0.8.0
* Homcloud package is divided into two pacakges: homcloud-base and homcloud-advanced

# News for 0.7.5
* Now you can use paraview from homcloud directly on OS X
* You can query volumes in a rectangle on `plot_PD_GUI`

# News for 0.7.4
* Update the algorithm of `full_ph_tree`
* Change the dataformat of .pht file
* Now `plot_PD_gui` can browse an output by `full_ph_tree`
* `ph_tree` and `birth_death_area` are now obsolete. Please use `full_ph_tree` and `query_full_ph_tree`.

# News for 0.7.3
* Fix a bug of `plot_PD_gui`
* Add `--font-size` option to `plot_PD`
* Now `plot_PD` accept empty title

# News for 0.7.2
* Now `pict.binarize_nd` and `pict.pixel_levelset_nd` accept npy foramt file
* Add `-M` option to `view_index_pict`

# News for 0.7.1
* Fix a filter bug in `view_index_pict_gui` (Thanks for Ichinomiya's bug report)
* Add `-S` option to `view_index_pict`
* Add `pict.pixel_levelset_nd` and `pict.binarize_nd`
* Update documents
* Refactoring `plot_PD_gui`

# News for 0.7.0
* Add `ph_tree`, `full_ph_tree`, and `query_full_ph_tree` programs
* Add -M option to `plot_PD` program to show some addition information
  on the diagram

# News for 0.6.8
* Add birth\_death\_area program.
* Add -S option to dump\_diagram.
  You can change whether to output birth/death simplices using this option.
* Some refactroings

# News for 0.6.7
* Fix packaging
* Add dipha_alt functionality

# News for 0.6.6
* Add view\_vectorized\_PD program. This program shows the vectorized PD by
vectorize\_PD.
* Add view\_birth\_death\_simplices. This program shows the birth/death simplices
  computed from a 3D point cloud.
* Introduce -V|--version option to show version
* Introduce -v and -H option into view\_index\_pict
* Draw grids on persistence diagrams
* Improve efficiency of saving bitmap complexes
* Improve documents
* Suppress using mpirun by the environemntal variable "HOMCLOUD\_SUPPRESS\_MPI"
* Some refactorings

# News for 0.6.5
* Add --no-label option to view\_index\_pict not to draw birth/death values labels
* Add homcloud.pwgk to compute gram matrix using PWGK (Kusano-kernel). (https://arxiv.org/abs/1601.01741)
* Remove -i option from commands
* Add -H option to vectorize_PD

# News for 0.6.4
* Enable to change colormap in plot\_PD using -c option
* Enable to change dpi of output files in plot\_PD using --dpi option
* Fix bugs in plot\_PD\_gui

# News for 0.6.3
* Update plot\_PD\_gui for more useful GUI
* Add -n option to normalize histogram

# News for 0.6.2
* Rename pict.pict3d to pict.binarize3d
* Optimize (speed up) pict.binarize and pict.binarize3d
  * manhattan: 1000x faster, euclidean: 100x faster, mahalanobis: 2x faster
* Support the dual algorithm by dipha module

# News for 0.6.1
* Refactoring
* Now x_range (-x option) is automatically determined by diagram
  when -x option is not given
* Add examples
* Now you can negate the birth/death times when plotting your data

# News for 0.6.0
* Refactoring
* Fix bugs for contour plot
* Update GUI of plot\_PD\_gui
* Update commandline options of plot\_PD\_gui
  * Add mandatory options -x and -X (same as plot\_PD)
  * Add an optional option -y (same as plot\_PD)
  * Add an unused option -Y

# News for 0.5.6

* Rename the name of the mode in pict.pixel-levelset:
  From "pixel-value-superlevel" to "superlevel" and
  from "pixel-value-sublevel" to "sublevel" and
* Rename module view\_index to view\_index\_pict\_gui
* Add a new module view\_index\_pict
* Fix a bug in pict.pixel\_levelset and
  this program accepts floating point number values


# News for 0.5.5

* Add a new module homcloud.proj_histo (homcloud-proj-histo)

# News for 0.5.4

* Add support of "index-combined" diagram to view_index
* Add executables homcloud-* for convenience
* Support a text file as a picture on pict.binarize and pict.pixel_levelset
* Refactoring

# News for 0.5.3

* Support "index-combined" complex and diagram.

# News for 0.5.1

* Fix some bugs
* pc2diphacomplex rejects 2D alpha shape with a weighted point cloud.
  This is because CGAL does not work correctly if such an input is given.

# News for 0.5.0

* Change the commandline optionss of plot_PD

  * Remove RANEG and BIN arguments
  * Add the following options instead

    * -x|--x-range X_RANGE
    * -X|--xbins XBINS
    * -y|--y-range Y_RANGE
    * -Y|--ybins YBINS
