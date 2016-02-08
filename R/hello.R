#' Take 3 pageviews, output Markov model prediction
#'
#' @param pageview_names A character vector of pageview names
#'
#' @return The prediction
predictMarkov <- function(pageview_names) {

  ## mc loaded on package load
  pv_n <- intersect(pageview_names, states(mc))

  startPattern <- new("Pattern", sequence = pv_n)

  predit <- predict(mc, startPattern)
}
