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



# Targets: extract --------------------------------------------------------
targets_extract <- c(
	tar_target(
		extract_world_settlement_footprint,
		ee_extract(
			get_ee_image(world_settlement_footprint_asset_id),
			points,
			scale = world_settlement_footprint_scale,
			fun = reducer_mean,
			sf = TRUE
		)
	)
	# table(extract_world_settlement_footprint$settlement, useNA = 'always')

	# TODO: map over images in a collection
)



# Targets: all ------------------------------------------------------------
# Automatically grab all the 'targets_*' lists above
lapply(grep('targets', ls(), value = TRUE), get)
