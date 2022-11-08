#' Get example points in a region
#' @return
#' @author Alec L. Robitaille
#' @export
get_example_points <- function(x, y, buffer_size, n_pts) {
	xy_pt <- st_point(c(x, y))
	xy_df <- data.frame(id = 'mid')
	xy_df$geom <- st_sfc(xy_pt)
	xy_sf <- st_as_sf(xy_df, crs = 4326)
	xy_buff <- st_buffer(xy_sf, buffer_size)

	xy_sample <- st_sample(xy_buff, n_pts)
	out <- data.frame(id = seq.int(n_pts))
	out$geometry <- xy_sample

	return(st_as_sf(out))
}
