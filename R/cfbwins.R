#' @title All-Time College Football Wins Leaders
#'
#' @description By stripping data from \link{www.winsipedia.com}, see who leads
#' NCAA FBS history in total wins
#'
#' @param rank which rank to see
#' @param school which school to see
#'
#' @return a string
#'
#' @import rvest
#' @import xml2
#' @examples
#' \dontrun{
#'  cfbwins()
#'  cfbwins(47)
#'  cfbwins(school = "Army")
#'  }
#' @export

cfbwins <- function(rank = NULL, school = "Notre Dame") {
  # scrape table data
  table <- rvest::html_text(
    rvest::html_nodes(
      xml2::read_html("http://www.winsipedia.com/ranking/all-time-wins"),
    "li")
  )
  # only keep a ranking
  table <- table[grepl("^\\d",table)]
  # take off the rank
  table <- data.frame(School = substring(table, first = unlist(gregexpr("\\.",table))+1),
                      stringsAsFactors = FALSE)
  # add rankings
  table$Rank <- 1:nrow(table)
  # find the first number of each string
  winspt <- unlist(lapply(gregexpr("\\d",table$School), min))
  # separate wins and school
  table$Wins <- substring(table$School, first = winspt)
  table$School <- substring(table$School, first = 1, last = winspt-1)

  # re-arrange
  table <- table[,c("Rank","School","Wins")]

  # subset by school or rank and return
  if (!is.null(rank)) {
    # return rank of interest
    table <- table[which(table$Rank %in% rank), , drop = FALSE]
    mes <- paste0(table$Rank,". ",table$School, " ", table$Wins)
    return(mes)
  } else {
    # return school of interest
    table <- table[which(table$School %in% school), , drop = FALSE]
    mes <- paste0(table$Rank,". ",table$School, " ", table$Wins)
    return(mes)
  }
}


