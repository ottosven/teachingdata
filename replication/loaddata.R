## ########################################
## DESTATIS GENESIS
## Statistisches Bundesamt
## API login required
## ########################################
# username = "my_username"
# password = "my_password"
# wiesbaden::save_credentials("de", username, password)

## GDP Germany
wiesbaden::retrieve_datalist("81000*", genesis=c(db="de"))
data=wiesbaden::retrieve_data("81000BV007", genesis=c(db="de"))
data=data[data$VGRPB5=="VGRJPM" & data$WERT05=="WERTORG",]
data = data[order(data$JAHR, data$QUARTG),]
gdp = ts(data$VGR014_val, start = data$JAHR[1], frequency = 4)
usethis::use_data(gdp, overwrite = TRUE)


## CPI and inflation Germany
wiesbaden::retrieve_datalist("61111*", genesis=c(db="de"))
data=wiesbaden::retrieve_data("61111BM001", genesis=c(db="de"))
data = data[order(data$JAHR, data$MONAT),]
cpi = ts(data$PREIS1_val, start = data$JAHR[1], frequency = 12)
infl=diff(log(cpi)*100, 12)
usethis::use_data(cpi, overwrite = TRUE)
usethis::use_data(infl, overwrite = TRUE)


## Unemployment rate Germany
wiesbaden::retrieve_datalist("13211*", genesis=c(db="de"))
data=wiesbaden::retrieve_data("13211BJ001", genesis=c(db="de"))
data = data[-1,]
urate_y = ts(data$ERW112_val, start = data$JAHR[1], frequency = 1)
data=wiesbaden::retrieve_data("13211BM001", genesis=c(db="de"))
data = data[order(data$JAHR, data$MONAT),]
urate = ts(data$ERW112_val, start = data$JAHR[1], frequency = 12)
usethis::use_data(urate_y, overwrite = TRUE)
usethis::use_data(urate, overwrite = TRUE)




## ########################################
## DWD Deutscher Wetterdienst
## ########################################
library(tidyverse)
url="https://www.dwd.de/DE/leistungen/_config/leistungsteckbriefPublication.htm?view=nasPublication&nn=16102&imageFilePath=12457998846040538266923503217546217740945044365452315531878965869354799583730014208313556886851581304435167075435902474522293820556788155046949847319924488503535140554578442479455774883276224364730830036670537891237508202786597280079524278375595464423260142208134840387684799613567248688392248048957&download=true"
tables = url %>% rvest::read_html() %>% rvest::html_table(fill = TRUE)
temp = ts(as.numeric(gsub('\\,','.',tables[[1]]$WertValue)), start = tables[[1]]$JahrYear[1], frequency=1)
usethis::use_data(temp, overwrite = TRUE)




## ########################################
## RKI Robert Koch-Institut
## ########################################
url='https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/Daten/Fallzahlen_Kum_Tab_aktuell.xlsx?__blob=publicationFile'
tmp <- tempfile()
r1 <- httr::GET(url, httr::write_disk(tmp))
df.case = readxl::read_excel(tmp,sheet=4, skip=4)
Gnames = c("BW", "BY", "BE", "BB", "HB", "HH", "HE", "MV", "NI", "NW", "RP", "SL", "SN", "ST", "SH", "TH", "GER")
covidcases = data.frame(
  date = as.Date(colnames(df.case)[-1], tryFormats = "%d.%m.%Y"),
  matrix(as.numeric(t(df.case)[-1,1:17]), ncol=17, dimnames = list(NULL, Gnames))
  )
df.hosp = readxl::read_excel(tmp,sheet=2, skip=4)
covidhosp = data.frame(
  date = as.Date(colnames(df.hosp)[-1], tryFormats = "%d.%m.%Y"),
  matrix(as.numeric(t(df.hosp)[-1,1:17]), ncol=17, dimnames = list(NULL, Gnames))
)
usethis::use_data(covidcases, overwrite = TRUE)
usethis::use_data(covidhosp, overwrite = TRUE)



## ########################################
## Financial and Economic data
## ########################################

## retrieve data from Yahoo Finance:
dax.dat = tidyquant::tq_get('^GDAXI', from = "1990-01-01", to = Sys.Date(), get = "stock.prices")
dax = na.omit(data.frame(date = as.Date(dax.dat$date), close = dax.dat$close))
eur.dat = tidyquant::tq_get('EURUSD=X', from = "1990-01-01", to = Sys.Date(), get = "stock.prices")
eur = na.omit(data.frame(date = as.Date(eur.dat$date), close = eur.dat$close))

## Data on German stock index (1990--2019):
library(smoots)
dax

## The FRED-QD and FRED-MD database (as of 2021):
library(BVAR)
fred_qd
fred_md
