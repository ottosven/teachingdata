#' German Quarterly Gross Domestic Product
#'
#'
#' @docType data
#'
#' @usage data(gdp)
#'
#' @format A quarterly time series of the class ts.
#'
#' @keywords datasets
#'
#' @source Statistisches Bundesamt (Destatis), Genesis-Online, Tablename 81000BV007, License \href{https://www.govdata.de/dl-de/by-2-0}{DL-DE BY-2.0}
"gdp"


#' Consumer Price Index Germany
#'
#'
#' @docType data
#'
#' @usage data(cpi)
#'
#' @format A monthly time series of the class ts.
#'
#' @keywords datasets
#'
#' @source Statistisches Bundesamt (Destatis), Genesis-Online, Tablename 61111BM001, License \href{https://www.govdata.de/dl-de/by-2-0}{DL-DE BY-2.0}
"cpi"



#' Inflation Rate Germany
#'
#' Monthly CPI inflation rate (year-on-year change). Calculated from the data set cpi as diff(log(cpi)*100,12)
#'
#' @docType data
#'
#' @usage data(infl)
#'
#' @format A monthly time series of the class ts.
#'
#' @keywords datasets
#'
#' @source Statistisches Bundesamt (Destatis), Genesis-Online, Tablename 61111BM001, License \href{https://www.govdata.de/dl-de/by-2-0}{DL-DE BY-2.0}
"infl"


#' Unemployment rate Germany
#'
#' Yearly unemployment rates for Germany
#'
#' @docType data
#'
#' @usage data(urate_y)
#'
#' @format A yearly time series of the class ts.
#'
#' @keywords datasets
#'
#' @source Statistisches Bundesamt (Destatis), Genesis-Online, Tablename 13211BJ001, License \href{https://www.govdata.de/dl-de/by-2-0}{DL-DE BY-2.0}
"urate_y"


#' Unemployment rate Germany
#'
#' Monthly unemployment rates for Germany
#'
#' @docType data
#'
#' @usage data(urate)
#'
#' @format A monthly time series of the class ts.
#'
#' @keywords datasets
#'
#' @source Statistisches Bundesamt (Destatis), Genesis-Online, Tablename 13211BM001, License \href{https://www.govdata.de/dl-de/by-2-0}{DL-DE BY-2.0}
"urate"



#' Average Temperature Germany
#'
#' @docType data
#'
#' @usage data(temp)
#'
#' @format A yearly time series of the class ts.
#'
#' @keywords datasets
#'
#' @source Deutscher Wetterdienst (DWD), \href{https://www.dwd.de/DE/leistungen/zeitreihen/zeitreihen.htm}{Source}, \href{https://www.dwd.de/DE/service/copyright/copyright_node.html}{Copyright}
"temp"




#' Reported Covid-19 infection incidence numbers Germany
#'
#' The Covid-19 infection incidence number is the number of reported infections in the past 7 days per 100000 inhabitants.
#' The data are available for the individual federal states and for Germany overall.
#'
#' @docType data
#'
#' @usage data(covidcases)
#'
#' @format A daily multivariate time series of the class data.frame.
#'
#' @keywords datasets
#'
#' @source Robert Koch-Institut (RKI), \href{https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/Daten/Fallzahlen_Kum_Tab_aktuell}{Source}, \href{https://www.govdata.de/dl-de/by-2-0}{DL-DE BY-2.0}
"covidcases"




#' Covid-19 hospitalization incidence numbers Germany
#'
#' The Covid-19 hospitalization incidence is the number of hospitalized infected persons in the past 7 days per 100000 inhabitants.
#' The data are available for the individual federal states and for Germany overall.
#'
#' @docType data
#'
#' @usage data(covidhosp)
#'
#' @format A daily maulivariate time series of the class data.frame.
#'
#' @keywords datasets
#'
#' @source Robert Koch-Institut (RKI), \href{https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/Daten/Fallzahlen_Kum_Tab_aktuell}{Source}, \href{https://www.govdata.de/dl-de/by-2-0}{DL-DE BY-2.0}
"covidhosp"
