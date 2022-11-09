#' Filter image collection within start and end date
#' @return
#' @author Alec L. Robitaille
#' @export
filter_date <- function(image_collection, start_date, end_date) {
	image_collection |>
		ee$ImageCollection$filterDate(start_date, end_date)
}
