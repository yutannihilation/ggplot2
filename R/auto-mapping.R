#' Auto Mapping
#'
#' @export
auto_mapping <- function(data, mapping, ...) {
  UseMethod("auto_mapping")
}

#' @export
auto_mapping.default <- function(data, mapping, ...) {
  mapping
}

#' @export
auto_mapping.grouped_df <- function(data, mapping, ...) {
  if (!"group" %in% names(mapping)) {
    mapping$group <- rlang::quo(.group)
  }
  mapping
}

#' @export
auto_mapping.sf <- function(data, mapping, ...) {
  if (!"geometry" %in% names(mapping)) {
    geometry_col <- attr(data, "sf_column")
    mapping$geometry <- as.name(geometry_col)
  }
  mapping
}
