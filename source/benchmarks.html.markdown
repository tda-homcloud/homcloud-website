---
title: HomCloud Benchmark
lang: ja
---

# HomCloud Benchmarks

This document shows the benchmark scores of HomCloud.
Computation times and maximal memory usages for persistence diagram computation
are measured by `time -v` command. The benchmark results of the inverse analysis are also shown.

PC spec and OS are as follows: 

* CPU: AMD Ryzen 9 5950X
* Memory: 128GB
* OS: Ubuntu 20.04

A persistence diagram is computed on a single core. Parallel computing is not used.
The time and memory is measured only one time, and the result of this document is not
the average time and memory.

## Alpha filtration from 3D pointcloud

Each point is randomly drawn from a uniform distribution on (-1,1)^3.

* 10,000 points - 2.4sec 350MB (pdgm file size: 13MB)
  * 1d optimal volume with `cutoff_radius=0.1` - 3.5sec 240MB <!-- (0.004754372380611359, 0.011357401613097931) -->
* 100,000 points - 23sec 3GB (pdgm file size: 136MB)
  * 1d optimal volume with `cutoff_radius=0.1` - 32sec 1.6GB <!-- (0.00048184003477194203, 0.0024763523144140038) -->
* 1,000,000 points - 260sec, 27GB (pdgm file size: 1.5GB)
  * 1d optimal volume with `cutoff_radius=0.1` - 190sec 15GB <!-- (0.00011187889212818131, 0.0005480027994254226) -->
* 3,000,000 points - 800sec, 80GB (pdgm file size: 4.4GB)
  * 1d optimal volume with `cutoff_radius=0.1` - 310sec 43GB <!-- Pair(0.00015036854456581476, 0.00033002057082796464) -->

## Periodic alpha filtration from 3D pointcloud

Each point is randomly drawn from a uniform distribution on (-1,1)^3.

* 10000 points - 3.6sec 380MB (pdgm file size: 13MB)
<!--  * 1d optimal volume with `cutoff_radius=0.1` - 3.5sec 240MB <!-- (0.004754372380611359, 0.011357401613097931) -->
* 100000 points - 31sec 3GB (pdgm file size: 137MB)
<!--  * 1d optimal volume with `cutoff_radius=0.1` - 32sec 1.6GB <!-- (0.00048184003477194203, 0.0024763523144140038) -->
* 1000000 points - 350sec, 27GB (pdgm file size: 1.5GB)
<!--  * 1d optimal volume with `cutoff_radius=0.1` - 190sec 15GB <!-- (0.00011187889212818131, 0.0005480027994254226) -->

### Remark

In HomCloud, alpha filtration is computed using the [CGAL library](https://www.cgal.org/).
A PD is calculated using [PHAT](https://bitbucket.org/phat-code/phat/).

## 3D Bitmap

The following two types of data were used for 3D data. One is that each voxel value is random, and
the sublevel persistence diagram is computed. The other is the data obtained by distance transform. 
The data by distance transform is more *ordered* than the random voxel value data,
and the order makes the computation faster.

### Levelset persistence diagram from random voxel data

* 100x100x100 - 5sec 570MB
* 300x300x300 - 614sec 11GB

### Distance transform data

* 100x100x100 - 1.6sec 310MB
* 300x300x300 - 50sec 6.4GB
* 600x600x600 - 530sec 60GB
* 800x800x800 - not comuputable because of memoly limitation. We plan to try bigger computer

### Remark

The algorithm for computing the PD from 2D/3D bitmap is separated into the [homccube3 library](https://bitbucket.org/tda-homcloud/homccube3/).

## Rips

A point cloud in 10-dimensional Euclidean space is randomly uniformly generated and
distance matrix with Euclidean distance is computed.

* 1000 points
  * maxdim=1: 1.6sec 210MB
  * maxdim=2: 90sec 10GB <!-- * optimal 1-cycle: 0.5sec 140MB -->
  * maxdim=3: Memory limitation
* 10000 points
  * maxdim=1: 500sec, 16GB <!-- optimal 1-cycle (1d cycle) 8sec, 4GB -->
  * maxdim=2: Memory limitation
* 20000 points
  * maxdim=1: 2000sec, 65GB
* 50000 points
  * maxdim=1: Memory limitation

### Remark

[Ripser](https://github.com/ripser/ripser) is used in HomCloud.

## Benchmark code

[Download](/download/homcloud_benchmark_codes.zip)
