# === Targets rgee extract ------------------------------------------------
# Alec L. Robitaille



# Source ------------------------------------------------------------------
targets::tar_source('R')



# Variables ---------------------------------------------------------------
x_mid <- -73.7465
y_mid <- 45.4693
buffer_dist <- 0.1
n_pts <- 100
n_polys <- 10

# Images
elevation_asset_id <- 'CGIAR/SRTM90_V4'
elevation_scale <- 90

tree_species_asset_id <- 'projects/sat-io/open-datasets/CA_FOREST/LEAD_TREE_SPECIES'
tree_species_scale <- 30


# Reducers
reducer_mean <- ee$Reducer$mean()
reducer_max <- ee$Reducer$max()


# Data --------------------------------------------------------------------
# There are a number of ways one might end up with a dataset of locations
#   to extract through rgee / Earth Engine
# Here are some examples:

# 1) Load data files eg. a CSV of points
points_csv <- fread('data/example-points.csv')
points_csv_sf <- st_as_sf(points_csv, coords = c('X', 'Y'))

# 2) Points originating from some other function
# (See targets_setup/points in buffer)



# Targets: setup ----------------------------------------------------------
targets_setup <- c(
	tar_target(
		points,
		get_example_features(x_mid, y_mid, 'points', buffer_dist, n_pts)
	),
	tar_target(
		polygons,
		get_example_features(x_mid, y_mid, 'polygons', buffer_dist, n_polys)
	)
)



# Targets: sample image with polygons -------------------------------------
# For example, maximum elevation within polygons
targets_image_polys <- c(
	tar_target(
		sample_image_with_polys,
		ee_extract(
			get_ee_image(elevation_asset_id),
			polygons,
			scale = elevation_scale,
			fun = reducer_max,
			sf = TRUE
		)
	)
)




# Targets: sample image with points ---------------------------------------
# For example, leading tree species at points
targets_image_points <- c(
	tar_target(
		sample_image_with_points,
		ee_extract(
			get_ee_image(tree_species_asset_id),
			points,
			scale = tree_species_scale,
			fun = reducer_mean,
			sf = TRUE
		)
	)
)



# Targets: all ------------------------------------------------------------
# Automatically grab all the 'targets_*' lists above
lapply(grep('targets', ls(), value = TRUE), get)
