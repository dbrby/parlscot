#' Download multiple days from the Parliamentary Record
#'
#' @param start_date From
#' @param end_date Until
#' @importFrom attempt stop_if_all
#' @importFrom attempt stop_if_not
#' @importFrom jsonlite fromJSON
#' @importFrom lubridate day
#' @importFrom lubridate month
#' @importFrom lubridate year
#' @importFrom data.table rbindlist
#' @importFrom janitor clean_names
#' @export
#' @rdname parlscot
#'
#' @return Parliamentary Record
#' @examples
#' \dontrun{
#' parlscot(start_date = "1999-05-01", end_date = "2022-01-01)
#' }
#'

parlscot <- function(start_date = NULL, end_date = NULL) {
  args <- list(start_date = start_date, end_date = end_date)
  # Check arguments are not null
  attempt::stop_if_all(args, is.null, "You need to specify both dates")
  # Check Internet Connection
  check_internet()
  # Generate sequence of dates
  start_date <- as.Date(start_date)
  end_date <- as.Date(end_date)
  dates <- seq.Date(from = start_date,
                    to = end_date,
                    by = "days")
  # Convert to dataset and split date into columns
  dates <- as.data.frame(dates)
  dates$dates <- as.POSIXct(dates$dates)
  dates$day <- lubridate::day(dates$dates)
  dates$month <- lubridate::month(dates$dates)
  dates$year <- lubridate::year(dates$dates)

  # Generate URLs
  dates$urls <- paste0(base_url, day, dates$day, month, dates$month,
                       year, dates$year)
  # Read in Record by days
  dfs <- list()
  for(i in 1:length(dates$urls)) {
    dfs[[i]] <- jsonlite::fromJSON(dates$urls[[i]], flatten = TRUE)
    message("Date", i)
    dfs[[i]] <- dfs[[i]]$data
  }

  # Bind together and return dataframe
  res <- data.table::rbindlist(dfs)
  res <- janitor::clean_names(res)

}

#' @export
#' @rdname parlscot
