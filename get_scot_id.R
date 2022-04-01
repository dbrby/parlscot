#' Get data from the Scottish Open Data Platform
#'
#' @param type API to call
#' @param id Unique ID for data type
#' @importFrom attempt stop_if
#' @importFrom jsonlite fromJSON
#' @importFrom janitor clean_names
#' @export
#' @rdname get_scot_id
#'
#' @return Scottish Open Data
#' @examples
#' \dontrun{
#' get_scot(type = "addresses", id = 1)
#' }
#'



get_scot_id <- function(type = c("addresses",
                              "addresstypes",
                              "allowancesgrouptransactions",
                              "allowancetransactions",
                              "bills",
                              "billstages",
                              "billstagetypes",
                              "billtypes",
                              "committeeroles",
                              "committees",
                              "committeetypelinks",
                              "constituencies",
                              "crosspartygrouproles",
                              "crosspartygroups",
                              "departments",
                              "directorates",
                              "directoratetypes",
                              "electionreasondates",
                              "electionstatuses",
                              "emailaddresses",
                              "emailaddresstypes",
                              "events",
                              "genders",
                              "governmentroles",
                              "legislationdetails",
                              "membercrosspartyroles",
                              "memberelectionconstituencystatuses",
                              "memberelectionregionstatuses",
                              "membergovernmentroles",
                              "memberparties",
                              "memberpartyroles",
                              "members",
                              "motionsquestionsanswersmotions",
                              "parties",
                              "partyroles",
                              "personcommitteeroles",
                              "petitioncountries",
                              "petitiondiscussions",
                              "petitiononbehalfofs",
                              "petitions",
                              "petitionsignatures",
                              "petitionstatuses",
                              "petitionsubjectcategories",
                              "regions",
                              "registerofinterest",
                              "externalresearches",
                              "sessions",
                              "telephones",
                              "telephonetypes",
                              "websites",
                              "websitetypes"),
                     id = id) {
  args <- list(type = type, id = id)
  attempt::stop_if_all(args, is.null, "you need to specify data type and ID")
  check_internet()
  res <- fromJSON(paste0(api_base, type, "/", id))
  res <- as.data.frame(res)
  res <- clean_names(res)
}

#' @export
#' @rdname get_scot_id
