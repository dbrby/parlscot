#' Get data from the Scottish Open Data Platform
#'
#' @param type API to call
#' @importFrom attempt stop_if
#' @importFrom jsonlite fromJSON
#' @importFrom janitor clean_names
#' @export
#' @rdname get_scot
#'
#' @return Scottish Open Data
#' @examples
#' \dontrun{
#' get_scot(type = "addresses")
#' }
#'



get_scot <- function(type = c("addresses",
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
                              "websitetypes")) {
  args <- list(type = type)
  attempt::stop_if(type, is.null, "you need to specify data type")
  check_internet()
  res <- fromJSON(paste0(api_base, type))
  res <- clean_names(res)
}

#' @export
#' @rdname get_scot
