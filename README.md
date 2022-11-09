
# targets-rgee-extract

![](README_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

### Sample image with polygons

For example, extract the maximum elevation in each polygon
(“elevation”):

``` r
head(tar_read(sample_image_with_polys))
```

    ## Simple feature collection with 6 features and 2 fields
    ## Geometry type: POLYGON
    ## Dimension:     XY
    ## Bounding box:  xmin: -74.83679 ymin: 46.41328 xmax: -74.72176 ymax: 46.53996
    ## Geodetic CRS:  WGS 84
    ##   id elevation                       geometry
    ## 1  1       277 POLYGON ((-74.82771 46.4962...
    ## 2  2       323 POLYGON ((-74.73499 46.4376...
    ## 3  3       292 POLYGON ((-74.73261 46.4810...
    ## 4  4       315 POLYGON ((-74.79072 46.4221...
    ## 5  5       373 POLYGON ((-74.7963 46.53405...
    ## 6  6       310 POLYGON ((-74.72462 46.5243...

### Sample image with points

For example, extract the leading tree species at each point (“b1”):

``` r
head(tar_read(sample_image_with_points))
```

    ## Simple feature collection with 6 features and 2 fields
    ## Geometry type: POINT
    ## Dimension:     XY
    ## Bounding box:  xmin: -74.83523 ymin: 46.41165 xmax: -74.6694 ymax: 46.50514
    ## Geodetic CRS:  WGS 84
    ##   id b1                   geometry
    ## 1  1  6  POINT (-74.6694 46.49735)
    ## 2  2  6 POINT (-74.67346 46.41165)
    ## 3  3  6  POINT (-74.72348 46.4236)
    ## 4  4 NA POINT (-74.82548 46.50514)
    ## 5  5 26 POINT (-74.83523 46.43082)
    ## 6  6  6  POINT (-74.7969 46.48492)

<!-- 
### Sample image collections with polygons

### Sample image collections with points
-->

## Setup

First time using this project:

``` r
Sys.setenv(DOWNLOAD_STATIC_LIBV8 = 1)
install.packages('renv')
renv::restore()
rgee::ee_Authenticate()
rgee::ee_Initialize(drive = TRUE)
```

### Dependencies

Details for `rgee` here:
<https://r-spatial.github.io/rgee/articles/rgee01.html#installation>

#### System dependencies

-   gcloud (<https://cloud.google.com/sdk/docs/install>)
-   python \>= 3.5
-   earthengine python package

#### `rgee`

The “first time” section above should get you set up, but if you are
starting from scratch:

**Install**:

``` r
library(rgee)
ee_install(py_env = 'rgee')
```

**Authenticate**:

``` r
ee_Initialize()
```

**Check**:

``` r
ee_check()
```

Renv + python:

``` r
renv::use_python(reticulate::py_discover_config()$python)
renv::snapshot()
```
