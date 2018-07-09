---
title: Basic Tutorial
lang: en
---

{::options parse_block_html="true" /}

# Basic Tutorial of HomCloud

In this tutorial, we explain the analysis of the following
three types of data.

* [3D point cloud](#pointcloud)
* [Binary image (white and black)](#binary-image)
* [Grayscale image](#grayscale-image)

<div class="guide">
## <a name="pointcloud"> Analysis of 3D point cloud

In this section, the following four items are explained.

1. Computing a persistnece diagram from a 3D point cloud
2. Visualizng the diagram
3. Outputting birth-death pairs as a text
4. Inverse analysis

These basic analyses are common for any point cloud data,
so you should master this tutorial.

### Computing a persistence diagram

Please download sample data from
[pointcloud-example.zip](download/pointcloud-example.zip), and extract the zip file.
`pointcloud` directory is created, and go to the directory by `cd` commmand.

In the directory, there is a file `pointcloud.txt`. This file contains
5000 random points in `[-1, 1]^3`.

First of all, type:

    python3 -m homcloud.pc2diphacomplex -I -D -d 3 pointcloud.txt pointcloud.idiagram

to generate `pointcloud.idiagram` file. This file has all information
about the 0th/1st/2nd persistnce diagrams. `-d 3` specifies the dimension of
the data, `pointcloud.txt` specifies input data, `pointcloud.idiagram`
specifies output data. `-I` and `-D` options are used to activate utility functionalities
of HomCloud, so please alyways specify these two options.

## Visualizng the diagram

Now we plot the 1st persistence diagram. Type:

    python3 -m homcloud.plot_PD -d 1 pointcloud.idiagram

`-d 1` specifies the degree of the PD. In this case, 1st PD is shown.

The following window is shown on your screen.

![PD1 pointcloud](images/pointcloud-pd1-1.png){: width="256"}

Nothing appears except in left-bottom side. This is because
many birth-death pairs are concentrated in that area. Therefore
we use the log-scale colorbar instead of the linear scale colorbar. `-l` is used.

    python3 -m homcloud.plot_PD -d 1 -l pointcloud.idiagram

The folloiwng diagram is shown.

![PD1 pointcloud logscale](images/pointcloud-pd1-2.png){: width="256"}

Basically, a birth-death pair farther from the diagonal is a more "meaningful"
ring structure, and a pair with larger Y (death time) corresponds to a larger ring.
Therefore, the pair around (0.5, 0.7) correspoonds to most well-structured ring.

Note that X and Y axis in this diagram uses the square of radii. Hence
√0.5≒0.7 and √0.7≒0.84 correspond to real radii. This is mainly because of
the internal algorithm of HomCloud. If you do not want to use squared radii,
please add `--no-square` option to `homcloud.pc2diphacomplex`.

Next, we focus on the left-bottom area in which many pairs are concentrated.
By default, the plotting area is determiend by the maxmam value and minimum value
of birth times and death times. We change the plotting region by using `-x` option.

    python3 -m homcloud.plot_PD -d 1 -l -x "[0:0.1]" pointcloud.idiagram
    
The following diagram is shown in your screen. 

[PD1 pointcloud zoomup](images/pointcloud-pd1-zoomup.png){: width="256"}

You can change the plot resolution by `-X` option. The default resolution is
128x128. We try 256x256.

    python3 -m homcloud.plot_PD -d 1 -l -x "[0:0.1]" -X 256 pointcloud.idiagram
    
![PD1 pointcloud zoomup 256x256](images/pointcloud-pd1-zoomup-fine.png){: width="256"}

You can save the figure by clicking the "save" icon on the window. You can
also save teh figure by `-o` option. By using the option, an window is not opened.
This option is useful to plot multiple diagrams by using a shell script.

    python3 -m homcloud.plot_PD -d 1 -l -x "[0:0.1]" -X 256 pointcloud.idiagram -o pointcloud-pd1.png

### Outputting birth-death pairs as a text

Here, we try to output birth-death pairs as a text data.
If you want further statistical analysis, text data is most 手軽 for you.
The following command enables you to output in the text format.

    python3 -m homcloud.dump_diagram -d 1 -S no pointcloud.idiagram

Then 2-columes numerical data is shown on your terminal. 
All birth-death pairs in the 1st PD is shown. The left colume has birth times,
and the right column has death times. All values are the squares of 
radii, as above. If you change `-d 1` to `-d 2`, all birth-death pairs in the 2nd
PD is shown.

When you want to save the text to a file, please use `-o` option as follows.

    python3 -m homcloud.dump_diagram -d 1 -S no pointcloud.idiagram -o pointcloud-pd1.txt
    
The text data is seved into `pointcloud-pd1.txt`.

## Inverse anaysis (birth/death simplices)

Each birth-death pair on a PD corresponds to a homologous structure such as 
ring or cavity in the input data. In fact, it is not an easy task to identify
such a structure. HomCloud can use "birth or death simplices" and "volume optimal cycles"
for the purpose. Birth/death simplices are explained here. You can show the simplices
by changing `-S no` to `-S yes`.

    python3 -m homcloud.dump_diagram -d 1 -S yes pointcloud.idiagram
    
Then the following text is shown.

    0.0005037159143533377 0.0005579705552885796 {(0.957826751985,-1.02576376749,0.584557432918),(0.950995498828,-1.00684503611,0.544429148124)} {(0.957826751985,-1.02576376749,0.584557432918),(0.950995498828,-1.00684503611,0.544429148124),(0.949185316562,-1.0446271794,0.553072016288)}
    0.0009259080093991961 0.0009586588306071996 {(-0.339241447596,0.193383603721,0.0879432393893),(-0.285082787425,0.181717125153,0.113129839874)} {(-0.339241447596,0.193383603721,0.0879432393893),(-0.285082787425,0.181717125153,0.113129839874),(-0.340910140206,0.168486056354,0.0955091671374)}
        :

The first and second columns are birth and death times. Next column surronding `{`
and `}` is the birth simplices, and the last column is the death simplices.
The first line means that the ring corresponding to the 
birth-death pair (0.0005037159143533377, 0.0005579705552885796) 
appears when an edge appears whose vertices are 

    (0.957826751985,-1.02576376749,0.584557432918) and
    (0.950995498828,-1.00684503611,0.544429148124),

and the ring disappears when a triangle whose vertices are 

    (0.957826751985,-1.02576376749,0.584557432918)
    (0.950995498828,-1.00684503611,0.544429148124)
    (0.949185316562,-1.0446271794,0.553072016288)

fills the internal of the ring. For the practical analysis of point clouds,
the death simplices are more important than birth simplices since
the death simplices are located at the cneter of the rings.


The tutorial for a point cloud is finished.

</div>

<div class="guide">
## <a name="binary-image"> Analysis of a binary image 

In this section, we will analyze a binary image by persistent homology.
The contents of this section is as follows:

1. Computing a PD from the given binary image
2. Visualizng the diagram
3. Outputting the birth-daeth pairs in text format
4. Inverse analysis

The filtration is constructed from the signed distance function with
manhattan distance. It means that we investigate the appearance and disappearance
of islands and holes by the dilation and erosion.
Please see section 2.3, figure 2 in [https://arxiv.org/abs/1706.10082](https://arxiv.org/abs/1706.10082).

## Computing a persistence diagram

Please download [binary-image-example.zip](download/binary-image-example.zip) and
extract the zip file. Then the directory `binary-image` is generated, and
go into the directory by `cd` command.

An example data is named `binary-image.png`, shown below:

![入力画像](images/binary-image.png){: width="256"}

We will try to analyze the image by persistent homology.

To compute a diagram, please type:

    python3 -m homcloud.pict.binarize_nd -T picture2d -m black-base -t 128 -I -D -s -o binary-image.idiagram binary-image.png

and then the file `binary-image.idiagram` is generated.
This file contains information about the persistence diagram.

* The option `-T picture2d` is used to specify the input file format. This means that
  the input file is a 2D picture.
  * You can specify other file formats, such as text format (`text2d`) and 
    numpy's .npy format (`npy`).
* `-m black-base` is used to declare that HomCloud focus on the black part of the image.
* `-t 128` to specify the threshold for binarization. In the example image, the 
  pixel value of black pixel is 0 and white pxiel is 255, hence you can specify any
  value between 1 and 244.
* You should alyways specify `-I -D`  options.
* `-o binary-image.idiagram` to specify the output file
* `-s` specify to use the *singed* distance function. If this option is not given,
  we use the normal distance function. This option is always recommended to use
  since the signed distance function have more information than the normal
  distance function.

### Visualizng the diagram

Now we plot the 0-th PD. That is, we focus on the connected components, or
island structures. Since we specify `-m black-base`, we focus on the black islands
in the image. Please type as follows:

    python3 -m homcloud.plot_PD -d 0 -l binary-image.idiagram

We use the 0-th PD by `-d 0`, and log-scale colorbar by `-l`. The command line
options are the same as the case of a pointcloud. Then the following figure 
is shown.

![PD0 binary image](images/binary-image-pd0-1.png){: width="256"}

Some small points are discretely shown. Since we use the manhattan distance, 
all birth/death times are integers. By default, the resolution of the plotting
is 128x128, and the resolution is too fine for the PD. Therefore we will change the
resolution. From the above figure, we know that all birth/death times are
larger than  -20 and less than  +7, so we adjust the plotting area as follows.

    python3 -m homcloud.plot_PD -d 0 -l -x "[-20.5:7.5]" -X 28 binary-image.idiagram

We specify the plotting area [-20.5, 7.5]x[-20.5, 7.5] by `-x "[-20.5:7.5]"`,
and specify the plotting resolution 28x28 by `-X 28`. Then the following figure is shown.

![PD0 binary image](images/binary-image-pd0-2.png){: width="256"}

Now we save the figure into a PNG file. We can use the `-o` option for that purpose.

    python3 -m homcloud.plot_PD -d 0 -l -x "[-20.5:7.5]" -X 28 binary-image.idiagram -o binary-image-pd0.png

### Outputting birth-death pairs as a text

We can output pairs in the text format in the same as the pointcloud case.

    python3 -m homcloud.dump_diagram -d 0 -S no binary-image.idiagram -o binary-image-pd0.txt
    
The following text is saved into `binary-image-pd0.txt`.

    -19 -18
    -18 -17
    -18 -17
    -18 -17
        :

In fact, the 0-th PD have one birth-death pair whose death time is +∞,
but such a pair is not outputted by HomCloud by default. If you want to output
such a birth-death pair, please use add `-E yes` in your commandline.

## Inverse analysis (birth pixels, death pixels)

You know that there are many birth-death pairs at (-5,-4). We want to know 
the geometric origin of these birth-death pairs. Now we show birth pxiels and
death pixels. Please change `-S no` to `-S yes`.

    python3 -m homcloud.dump_diagram -d 0 -S yes binary-image.idiagram

Then the following data is shown in your terminal.

    -19 -18 (57,121) (56,121)
    -18 -17 (46,111) (53,119)
    -18 -17 (47,112) (46,112)
    -18 -17 (48,113) (47,113)
          :

The first column has birth times, the second column has the death times,
the third column has the coordinates of birth pixels,
and the last column has the coordinates of death pixels.
Please note that the order of the coordinates is (y,x). This is a specification 
of HomCloud and not a bug, please pay attention. (In fact, this specification comes
from the python's numpy's specification.)

OK, we pick up lines for the (-5, -4) pairs by using `grep` command.

    python3 -m homcloud.dump_diagram -d 0 -S yes binary-image.idiagram | grep "^-5 -4"

The following data is shown.

    -5 -4 (9,35) (8,35)
    -5 -4 (10,36) (9,36)
    -5 -4 (11,37) (10,37)
    -5 -4 (18,45) (17,45)
    -5 -4 (19,46) (18,46)
    -5 -4 (20,48) (19,48)
    -5 -4 (21,49) (20,49)
    -5 -4 (25,103) (24,103)

Now we put these points on the original input image. The module `homcloud.view_index_pict` is available for that purpose.

    python3 -m homcloud.view_index_pict -d 0 -f "birth == -5" -f "death == -4" -B --no-label binary-image.png binary-image.idiagram -o birth-pixels.png

The following image file is generated as `birth-pixels.png`.

![binary image birth pixels](images/binary-image-birth-pixels.png){: width="256"}

Some red points are shown at the center of the black "roads". This means that
these birth-death pairs correspond to road-like structures whose width is
10 pixels.


</div>

<div class="guide">
## <a name="grayscale-image"> Analysis of a grayscale image

<!-- In this section, we explain how to analyze a grayscale image by persistent homology. -->
<!-- The content of this section is similar to the above section about  -->
<!-- the binary image analysis. -->

<!-- 1. Computing a PD from the given binary image -->
<!-- 2. Visualizng the diagram -->
<!-- 3. Outputting the birth-daeth pairs in text format -->
<!-- 4. Inverse analysis -->

<!-- Here, we use text file as an input grayscale image, but you can apply the -->
<!-- way explained in this section to other types of input data. -->

<!-- ## Data -->

<!-- Please download [grayscale-example.zip](download/grayscale-example.zip) and -->
<!-- extract the zip file. The directory whose name is `grayscale-image` is generated, -->
<!-- then go into the directory by `cd` command on your terminal. -->

<!-- `grayscale.txt` in the directory is the target data. This text data has -->
<!-- 200x200 floating number points. We analyze it. -->


<!-- Before computing a PD, we examine some basic information of the data. -->
<!-- Now we use `python` programming language.  -->

Under construction
</div>


