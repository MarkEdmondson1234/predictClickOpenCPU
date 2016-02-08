#' Take 3 pageviews, output Markov model prediction
#'
#' @param pageview_names A character vector of pageview names
#'
#' @return The prediction
predictMarkov <- function(pageview_names) {

  ## mc loaded on package load
  states <- invisible(states(mc))

  pv_n <- pageview_names[pageview_names %in% states]

  startPattern <- new("Pattern", sequence = pv_n)

  predit <- predict(mc, startPattern)

  list(page = predit@sequence,
       probability = predit@probability)
}
