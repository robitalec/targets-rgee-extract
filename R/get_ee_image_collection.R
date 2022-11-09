#' Get EE image collection
#' @return
#' @author Alec L. Robitaille
#' @export
get_ee_image_collection <- function(asset_id) {
	ee$ImageCollection(asset_id)
}
