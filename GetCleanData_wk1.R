 ## Question 1
download.file(url= "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "gcdquiz2.csv")
houses <- read.csv("gcdquiz2.csv")
sum(!is.na(houses$VAL[houses$VAL == 24]))

 ## Question 3
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile = "ngas.xlsx")
library(xlsx)
dat <- read.xlsx(file = "ngas.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T) 

 ## Question 4
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", destfile = "balrest.xml")
library(XML)
baltrest <- xmlTreeParse("balrest.xml", useInternal = TRUE)
rootNode <- xml(baltrest)
sum(xpathSApply(rootNode, "//zipcode", xmlValue) == "21231")

 ## Question 5
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "idaho.csv")
library(data.table)
DT <- fread("idaho.csv")
system.time(mean(DT[DT$SEX==1,]$pwgtp15)) + system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(rowMeans(DT)[DT$SEX==1]) + system.time(rowMeans(DT)[DT$SEX==2])
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))

