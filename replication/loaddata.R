
# insert genesis username and password:
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

