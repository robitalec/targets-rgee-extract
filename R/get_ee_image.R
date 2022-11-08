#' Get EE image
#' @return
#' @author Alec L. Robitaille
#' @export
get_ee_image <- function(asset_id) {
	ee$Image(asset_id)
}
