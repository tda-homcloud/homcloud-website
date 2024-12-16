# News for 4.6.0 (2024/12/12)
* Support 2D periodic alpha complex without weights
  * Weighted 2D periodic alpha complex is not supproted since CGAL does not support it yet
  
# News for 4.5.1 (2024/10/21)
* Update `self_check`
* Remove trame option from pyvista dependency

# News for 4.5.0 (2024/10/16)
* Remove workaround for Numpy < 2
* Support manylinux build
* C++17 is required now

# News for 4.4.2 (2024/06/20)
* Workaround for Numpy < 2
  * Now HomCloud itself can be work with Numpy 2, but some dependent libraries does not work.

# News for 4.4.1 (2024/03/27)
* CGAL 5.6.1 and boost boost 1.84.0 is included in source package
  * The two builtin libraries are available if `HOMCLOUD_USE_BUILTIN_BOOST_CGAL` environmental variable
    is set to `1` when HomCloud is installed.

# News for 4.4.0 (2024/03/20)
* Drop support for Python 3.9 and older versions
* New features:
  * The following methods receive a new parameter "by". This parameter changes the type of return value.
    * `Volume.birth_position`, `Volume.death_position`, `Volume.points`, `Volume.boundary_points`, `Volume.boundary`, `Volume.boundary_points`, `Volume.cells`, `Volume.simplices`, `Volume.cubes`, `Volume.boundary_loop`, 
    * `Optimal1Cycle.path`, `Optimal1Cycle.boundary_points`
    * `GraphOptimal1Cycle.boundary_points`
  * Now 3d alpha filtration with non-cubic periodic condition is available when CGAL >= 5.6

# News for 4.3.0 (2024/02/08)
* New features:
  * New methods: `interface.Volume.dump_to_dict` and `interface.Volume.restore_from_dict`
* Better error messages
* Avoid an error when log-histogram is plotted for an empty diagram
* Bug fixes:
  * pyvista.UniformGrid is renamed to pyvista.ImageData in new version of pyvsita
* Drop support for python 3.7

# News for 4.2.1 (2023/12/04)
* New feature:
  * Now ripser algorithm accepts `upper_value`

# News for 4.2.0 (2023/12/02)
* New features:
  * New method: `interface.Volume.boundary_loop`
  * New method: `interface.Volume.boundary_loop_symbols`
  * `CPLEX_PY` is now available from `interface.Pair.optimal_volume` and `interface.Pair.stable_volume`
* Breaking change:
  * Change `solver_options` of `interface.Pair.optimal_volume` and `interface.Pair.stable_volume`
* Bug fixes:
  * Pulp - CPLEX interface

# News for 4.1.0 (2023/09/16)
* New features:
  * Persistence Codebook vectorization (<https://link.springer.com/article/10.1007/s10462-020-09897-4>)
    * Not well tested, but looks working
  * Better support for 3D periodic boundary condition for visualization
    * `homcloud.interface.Volume.to_pyvista_boundary_mesh` and `homcloud.interface.Volume.to_pyvista_volume_mesh` have `adjust_periodic_boundary` parameter
    * Other interface such as py3dmolhelper does not support periodic boundary condition.
* Bug fixes:
  * Fix memory leak in 3D periodic alpha shape
  * Automatically remove birth-death pairs with birth == death in `homcloud.pict.show_volume2d`

# News for 4.0.0 (2023/04/10)
* Major version up!
* New features:
  * Add `homcloud.interface.PDList.from_simplicial_levelset` to create a filtration from a simplicial level function
  * New 3D visualization functions using [PyVista](https://pyvista.org)
  * Add simple py3dmol integration
* Breaking changes:
  * Remove `.diagram` and `.idiagram` files loader
  * Remove `homcloud.optimal_cycle` module
* Internal structural changes


# News for 3.6.0 (2022/11/02)
* New methods:
  * `interface.BitmapPHTrees.roots`
  * `interface.PD.torch_tensor_tensor_birth_death` (for bitmap and alpha)
* New properties
  * `interface.PD.alpha_squared`
* New parameter `squared` in `interface.PDList.from_alpha_filtration`. This paramter is equivalent to `not no_square`.

# News for 3.5.2 (2022/03/09)
* New methods:
  * interface.PHTrees.roots
* Add `save_cocycles` argument to `interface.PDList.from_rips_filtration`
* Add `torelance` argument to `interaface.Pair.optimal_1_cycle`

# News for 3.5.1 (2021/12/08)
* Fix a bug in plotly3d.Cubes2d
* Add workaround for paraview
* Enable to compute optimal 1-cycle with respect to graph weights

# News for 3.5.0 (2021/09/27)
* Support M1 Mac
* New parameter `bgcolor` in `paraview_interface.show`. We can specify the background color by this paramter
* New methods
  * `interface.PHTrees.all_nodes` to get all nodes of the tree
  * `interface.PHTrees.Node.stable_volume_information`

# News for 3.4.1 (2021/07/10)
* New 3D visualization tools using plotly

# News for 3.4.0 (2021/06/25)
* Breaking change: Change the output format of optvol
  * `results` field is renamed to `result`

# News for 3.3.2 (2021/06/22)
* `interface.Optimal1Cycle.to_pvnode` is now available for alpha filtration

# News for 3.3.1 (2021/05/31)
* Activate console_scripts for windows

# News for 3.3.0 (2021/05/28)
* Implement efficient optimal 1-cycle for rips filtrations

# News for 3.2.1 (2021/05/02)
* Bug fix: Optimal volumes for periodic alpha filtrations

# News for 3.2.0 (2021/04/30)
* New feature: Wasserstein and botlleneck distance (by using hera <https://bitbucket.org/grey_narn/hera>)
* Bug fix: `homcloud.pict.pixel_levelset_nd`

# News for 3.1.0 (2021/02/01)
* New feature: optimal 1-cycle
* Speedup visualization of voxel data

# News for 3.0.1 (2020/11/22)
* Fix a bug about paraview's .vtk output
* Upload to pypi

# News for 3.0.0 (2020/10/01)
* Major version up!
* Change the URL from <https://www.wpi-aimr.tohoku.ac.jp/hiraoka_labo/homcloud/> to <https://homcloud.dev/>
* New features:
  * Introduce a new file format `.pdgm`. This format is more recommended than `.idiagram`.
  * New module `optvol`. This is the alternative module of `optimal_volume` for `.pdgm` format PD file.
  * Integrate the new version of homccube (homccube 3) for more efficient bitmap filtration computation
  * Now self_check accept `--no-dipha` option
  * Easier installation of HomCloud on Windows
  * New modules `build_phtrees` and `phtrees`. These are successors of `full_ph_trees`, `query_pht`, and `query_full_phtrees`.
  * Add `--save-phtrees` option to `pc_alpha`
  * Now `interface.PDList.from_alpha_filtration` accepts a new parameter `save_phtrees` to save PH-trees to `.pdgm` file.
  * Now `plot_PD` and `interface` modules can plot essential pairs.
  * `pict.tree` module can output `.pdgm` format file
  * Add `load_indexed_pairs` parameter to `interface.PDList.dth_diagram`
  * Add `HistoSpec.histogram_from_vector`
  * Add `interface.Pair.ph0_componens` and `interface.PH0Components`
  * Now you can calculate optimal volumes for rips filtrations and abstract filtrations
  * `interface.PDList.from_bitmap_levelset` supports periodic boundary condition
  * `interface.distance_transform` supports periodic boundary condition
* Breaking changes:
  * HomCloud drops the support of `.diagram`, `.icomplex` and `.complex` format
  * `abstract_filtration` module drops the support of `.idiagram` format
    * The module only supports `.pdgm` for output format
  * `rips` modules drops the support of `.idiagram` format
    * The module only supports `.pdgm` for output format
  * Change the default value of `-S` option to `off` in `dump_diagram`
  * `pict.optimal_one_cycle` drops the support of `.idiagram` format and only supports `.pdgm` format
  * `interface.Mesh` is renamed to `interface.HistoSpec`
    * The old name `interface.Mesh` is marked deprecated, but available now
  * `interface.PIVectorizerMesh` is renamed to `interface.PIVectorizeSpec`
    * The old name `interface.PIVectorizerMesh` is marked deprecated, but available now
  * Remove `interface.PD.check_coefficient_problem`
    * You should use `interface.PDList.check_coefficient_problem` instead
  * `interface.Pair.tightened_volume` is renamed to `interface.Pair.stable_volume`
  * `interface.Pair.tightened_subvolume` is renamed to `interface.Pair.stable_subvolume`
  * `interface` module now drops the support of `.p2mt` format
  * Remove `interface.BitmapPHTreesPair`
    * You should use `interface.BitmapPHTrees.for_bitmap_levelset` instead to build bitmap ph-trees
    * You should use `interface.PDList.bitmap_phtrees` instead to load bitmap ph-trees
  * Now `pict.tree` module does not supports `.p2mt` format. Use `.pdgm` format instead
  * In `interface` module, the default PD file format is changed from `.idiagram` to `.pdgm`
  * In `interface` module, the following functionalities only support `.pdgm` format and drop the support of `.idiagram` format
    * Optimal volumes
    * Stable volumes
    * PH-trees
    * Optimal 1-cycles for bitmaps 
* Update the internal format version of `.idiagram` from 3 to 4.

# News for 2.9.0 (2020/04/06)
* Integrate homccube for more efficient bitmap filtration

# News for 2.8.1 (2020/02/02)
* Support CGAL 5.0 and later

# News for 2.8.0 (2020/01/16)
* Support periodic alpha filtration (`--periodic` option)
* Update self_check
* Now self_check accept `--no-paraview` option
* Add interface.PHTrees.StableVolume.to_paraview_node
* Add interface.PDList.from_boundary_information
* Add interface.BitmapPHTrees.Node.stable_volume

# News for 2.7.2 (2019/12/2)
* Update self_check

# News for 2.7.1 (2019/11/29)
* Fix paraview bugs

# News for 2.7.0 (2019/11/1)
* `pict.binarize`, `pict.binarize3d`, `pict.pixel_levelset` are now marked as obsolete
* Remove `-u` and `-l` options from `pict.pixel_levelset_nd`
* `interface.Pair.optimal_volume` raises exception if an optimal volume is not
  found
* Enable to visualize a 2D pointcloud from `paraview_interface.PointCloud`
* Add `paraview_interface.PolyLine` to draw polylines
* Fix `paraview_interface.PipelineNode.set_color`
* Fix the handling of Windows file paths in `paraview_interface`
* Enable to output birth/death positions by `optimal_volume` module
* Enable to visualize boolean 3D arrays by `pict.slice3d`
* `-D` option is strongly recommended by `pc_alpha`, `binarize_nd`, 
  and `pixel_levelset_nd`
* Improve tutorials

# News for 2.6.0 (2019/7/19)
* Add new module `idiagram2diagram` to convert a `.idiagram` file to
  a `.diagram` file.
* Add new module `abstract_filtration` to construct a input directly
  from boundary maps
* Add `interface.show_slice3d` to display voxel data by slices
* Now the constructor of `interface.Mesh` accepts `superclass` parameter.
* Make the dependency to ripser optional for Windows
* `plot_diagram` and `diagram_to_text` are now obsolete.
* Now `interface.Mesh` class accepts "superlevel" parameter.
* Fix memory leak in alpha_shape3
* Remove `scipy.misc.imread` and `imsave` and use `imageio` instead
* `interface.distance_transform` is now available
  * `interface.PDList.from_bitmap_distance_transform` and
    `interface.BitmapPHTreesPair.from_bitmap_distance_transform` are now obsolete.
* Add `--tight-layout` option to `plot_PD` module and you should use 
* Add `ax` parateter to `interface.SlicedHistogram.plot()`
* Add a new method `interface.PIVectorizerMesh.vector_size()`
  * This method returns the number of elements of a vector generated by
    the instance of `PIVectorizerMesh`
    
# News for 2.5.1 (2019/2/21)
* Fix a bug in `interface.MaskHistogram`.

# News for 2.5.0 (2019/2/14)
* Add `--dpi` option to `view_vecotrized_PD`.
* Add a new module named `pict.optimal_one_cycle` and its interface to 
  `interface` module.
* Add `marker_size` parameter to `interface.draw_volumes_on_2d_image`.
* Fix bugs for Vietoris-Rips filtrations

# News for 2.4.0 (2019/2/7)
* Support PI vectorization for superlevel persistence.
* Fix a bug in `optimal_volume`.
* Support Vietoris-Rips filtrations by `homcloud.rips` module.
  * `homcloud.interface` also supports VR filtrations

# News for 2.3.0 (2018/11/28)
* Support +-inf values by superlevel/sublevel filtrations on bitmaps
* Some bug fixes
  * Fix package dependencies
  * Fix build configurations
* You can represents vertices by symbols
  * You can specify symbols by `--vertex-symbols` option of `homcloud.pc_alpha`
  * You can change the output of birth/death simplices of `homcloud.dump_diagram` by
    `-s` option
  * The json outputs by `homcloud.optimal_volume` and `homcloud.query_pht`
    now contains symbolic representations of `points`, `simplices`,
    `boundary`, `boundary-points`. The names are `points-symbols`,
    `simplices-symbols`, `boundary-symbols`, and `boundary-points-symbols`.
* You can visualize birth/death pixels for 3D voxel data by
  `homcloud.view_index_pict3d`. This program is useful by combining
  other visualization program `homcloud.pict.pict3d_vtk`

# News for 2.2.0 (2018/11/9)
* Rename optimal\_cycle moule to optimal\_volume
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
* Fix a bug of `-n` option in pc2diphacomplex
* Support CubicalRipser (https://github.com/CubicalRipser)
  Set the environmennt variable `HOMCLOUD_USE_CUBICALRIPSER` to `1` if you want to use
  them.
* Rewrite pict.tree by C++ for speed up
* dump_diagram supports `-E` (`--show-essential-pairs`) option

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
* Add `-j` option to `full_ph_tree`
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
* Add `view_vectorized_PD` program. This program shows the vectorized PD by
`vectorize_PD`.
* Add `view_birth_death_simplices`. This program shows the birth/death simplices
  computed from a 3D point cloud.
* Introduce `-V|--version` option to show version
* Introduce `-v` and `-H` option into `view_index_pict`
* Draw grids on persistence diagrams
* Improve efficiency of saving bitmap complexes
* Improve documents
* Suppress using mpirun by the environemntal variable "HOMCLOUD\_SUPPRESS\_MPI"
* Some refactorings

# News for 0.6.5
* Add `--no-label` option to `view_index_pict` not to draw birth/death values labels
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

    * `-x|--x-range X_RANGE`
    * `-X|--xbins XBINS`
    * `-y|--y-range Y_RANGE`
    * `-Y|--ybins YBINS`
