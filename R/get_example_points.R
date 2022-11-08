#' Get example points in a region
#'
get_example_points <- function(x, y, buffer_size, n_pts) {
	xy_pt <- st_point(c(-68.3559, 49.4672))
	xy_df <- data.frame(id = 'mid')
	xy_df$geom <- st_sfc(xy_pt)
	xy_sf <- st_as_sf(xy_df, crs = 4326)
	xy_buff <- st_buffer(xy_sf, 100)

	st_sample(xy_buff, n_pts)
}
