#' Get example features
#' @return
#' @param region_size size of example study region's (in this case, a circle's diameter in meters)
#' @param type either 'points', or 'polygons'
#' @author Alec L. Robitaille
#' @export
get_example_features <- function(x, y, type = 'points', diameter, n_features) {
	xy_pt <- st_point(c(x, y))
	xy_buff <- st_buffer(xy_pt, buffer_size)

	xy_sample <- st_sample(xy_buff, n_pts)
	out <- data.frame(id = seq.int(n_pts))
	out$geometry <- xy_sample

	out_point <- st_as_sf(out, crs = 4326)

	return()
}
