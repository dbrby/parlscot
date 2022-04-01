
<!-- README.md is generated from README.Rmd. Please edit that file -->

# parlscot

<!-- badges: start -->
<!-- badges: end -->

parlscot provides a suite of functions to download data from the
Scottish Parliamentary Record and the Scottish Parliament Open Data
Platform.

## Installation

You can install the development version of parlscot from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("dbraby/parlscot")
```

## Example

To download speeches from the Spoken Record, we use the `parlscot()`
function, passing a start and an end date will return a data.frame with
each speaking instance as a row

``` r
library(parlscot)


df <- parlscot("2022-03-01", "2022-03-10")
#> Date1
#> Date2
#> Date3
#> Date4
#> Date5
#> Date6
#> Date7
#> Date8
#> Date9
#> Date10
```

`get_scot()` and `get_scot_id()` provide wrappers for the Scottish
Parliament Public APIs.`get_scot()` will return all records, while
`get_scot_id()` allows single cases to be returned (given you know the
ID).

For both functions it is required you specify type =, for which there
are 50 possible options, listed below:

``` r
get_scot <- (type = c("addresses",
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
                              "websitetypes"))
```
