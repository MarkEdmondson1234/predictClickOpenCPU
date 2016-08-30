#' Take some pageviews, output Markov model prediction
#'
#' @param pageview_names A character vector of pageview names
#'
#' @return The prediction
#' @import clickstream
#' @export
predictMarkov <- function(pageview_names) {

  ## mc loaded on package load
  states <- invisible(clickstream::states(model))

  pv_n <- pageview_names[pageview_names %in% states]

  startPattern <- new("Pattern", sequence = pv_n)

  predit <- predict(model, startPattern)

  list(page = predit@sequence,
       probability = predit@probability)
}

#' Predict next page model 2
#'
#' @param current_url the url to predict from
#' @export
#' @import markovchain
predictNextPage <- function(current_url){

  current_url <- current_url[!grepl("undefined", current_url)]

  message("Predicting next page for ", current_url)

  markovList <-  mcfL$estimate
  out <- try(predict(markovList, newdata = current_url), silent = TRUE)

  if(inherits(out, "try-error")){

    ## try just with last page
    ll <- length(current_url)
    retry_urls <- current_url[ll]
    out <- try(predict(markovList, newdata = retry_urls), silent = TRUE)

    if(inherits(out, "try-error")){
      message("No prediction available")
      return(NULL)
    }
  }

  out
}


#' Replace a string with substitutions
#'
#' @param string_vector vector of (URL) strings
#' @param findme Regex or string to find to replace
#' @param replace What to replace with. If NULL, uses findme string
#' @param fixed IF FALSE, findme is regex, if not a fixed match
#'
#' @return string_vector with replacements if required
#' @export
cleanURL <- function(string_vector, findme, replace=NULL, fixed=TRUE){

  if(is.null(replace)) {
    replace <- findme
  } else {
    replace <- replace
  }

  if(fixed) findme <- stringr::fixed(findme)

  string_vector[stringr::str_detect(string_vector, findme)] <- replace

  string_vector
}


#' Specific client aggregation
#'
#' @param string_vector URLs to clean
#'
#' @return The string_vector with substitutions made
#' @export
aggregateVD <- function(string_vector){

  string_vector <- as.character(string_vector)

  # string_vector[str_detect(string_vector[,pagePath_name], "[0-9]$"),"aggregation"] <- "holiday_listing"
  string_vector <- cleanURL(string_vector, "[0-9]$", replace = "holiday_listing", fixed=FALSE)
  string_vector <- cleanURL(string_vector, "search/result", replace = "search_result")
  string_vector <- cleanURL(string_vector, "?", "site_search")
  string_vector <- cleanURL(string_vector, "blog")
  string_vector <- cleanURL(string_vector, "employees-list", replace = "employees")
  string_vector <- cleanURL(string_vector, "booking")
  string_vector <- cleanURL(string_vector, "geography")
  string_vector <- cleanURL(string_vector, "interest")
  string_vector <- cleanURL(string_vector, "dragoer")
  string_vector <- cleanURL(string_vector, "aktiviteter")
  string_vector <- cleanURL(string_vector, "product")
  string_vector <- cleanURL(string_vector, "feriecentre")
  string_vector <- cleanURL(string_vector, "gastronomi")
  string_vector <- cleanURL(string_vector, "aktiviteter")
  string_vector <- cleanURL(string_vector, "natur")
  string_vector <- cleanURL(string_vector, "fur")
  string_vector <- cleanURL(string_vector, "begivenheder")
  string_vector <- cleanURL(string_vector, "season")
  string_vector <- cleanURL(string_vector, "sydjylland")
  string_vector <- cleanURL(string_vector,  "vestjylland")
  string_vector <- cleanURL(string_vector, "sydsjaelland")
  string_vector <- cleanURL(string_vector, "publikationer")
  string_vector <- cleanURL(string_vector, "oestjylland")
  string_vector <- cleanURL(string_vector, "nordjylland")
  string_vector <- cleanURL(string_vector, "koebenhavn")
  string_vector <- cleanURL(string_vector, "tyskland")
  string_vector <- cleanURL(string_vector, "sverige")
  string_vector <- cleanURL(string_vector, "sport")
  string_vector <- cleanURL(string_vector, "norge")
  string_vector <- cleanURL(string_vector, "historie")
  string_vector <- cleanURL(string_vector, "england")

  string_vector
}

