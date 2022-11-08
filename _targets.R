# === Targets rgee extract ------------------------------------------------
# Alec L. Robitaille



# Source ------------------------------------------------------------------
targets::tar_source('R')




# Variables ---------------------------------------------------------------
x_mid <- -68.3559
y_mid <- 49.4672
buffer_dist <- 5e3



# Data --------------------------------------------------------------------
get_fake_points <- function(x, y, buffer_size) {
	xy_pt <- st_point(c(-68.3559, 49.4672))
	xy_df <- data.frame(id = 'mid')
	xy_df$geom <- st_sfc(xy_pt)
	xy_sf <- st_as_sf(xy_df, crs = 4326)
	xy_buff <- st_buffer(xy_sf, 100)

}

# Targets: setup ----------------------------------------------------------
targets_setup <- c(

)





# Targets: extract --------------------------------------------------------
targets_extract <- c(

)




# Targets: all ------------------------------------------------------------
# Automatically grab all the 'targets_*' lists above
lapply(grep('targets', ls(), value = TRUE), get)


