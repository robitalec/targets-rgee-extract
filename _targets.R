# === Targets rgee extract ------------------------------------------------
# Alec L. Robitaille



# Source ------------------------------------------------------------------
targets::tar_source('R')



# Variables ---------------------------------------------------------------
x_mid <- -68.3559
y_mid <- 49.4672
buffer_dist <- 1e5
n_pts <- 100


# Images
world_settlement_footprint_asset_id <- 'DLR/WSF/WSF2015/v1'
world_settlement_footprint_asset_scale <- 10

# Reducers
reducer_mean <- ee$Reducer$mean()


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
		get_example_points(x_mid, y_mid, buffer_dist, n_pts)
	)
)



# Targets: images ---------------------------------------------------------
targets_images <- c(
	tar_target(
		world_settlement_footprint,
		get_ee_image(world_settlement_footprint_asset_id)
	)
)



# Targets: extract --------------------------------------------------------
targets_extract <- c(
	tar_target(
		extract_world_settlement_footprint,
		ee_extract(
			points,
			world_settlement_footprint_asset_id,
			scale = world_settlement_footprint_scale,
			fun = reducer_mean
		)
	)
)



# Targets: all ------------------------------------------------------------
# Automatically grab all the 'targets_*' lists above
lapply(grep('targets', ls(), value = TRUE), get)
