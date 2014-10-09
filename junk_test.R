
TempData <- read.csv("408876_A.csv", header=TRUE, na.strings="-9999")

TempData$TMIN = as.numeric(TempData$TMIN)
TempData$TMAX = as.numeric(TempData$TMAX)
                                                         
TempData<-TempData[,c("STATION", "STATION_NAME", "DATE", "TMIN", "TMAX")]
                                                         
                                                         ## keep complete cases
                                                         
TempData<-TempData[complete.cases(TempData),]
                                                         
                                                         ## convert dates
TempData$DATE<-as.Date(as.character(TempData$DATE), format="%Y%m%d")
                                                         
                                                         ##create Date Factor Columns for later analysis
MON<-format(TempData$DATE, "%b")
YEAR <-format(TempData$DATE, "%Y")
                                                         #MON<-factor(MON)
MON<-factor(MON, levels=c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))
YEAR<-factor(YEAR)
TempData<-cbind(TempData, MON, YEAR)
                                                         
                                                         ## convert temperatures 
                                                         ## note the data as input are in tenths of a degree C
                                                         
TempData$TMIN <- TempData$TMIN/10.
TempData$TMAX <- TempData$TMAX/10.
                                                         
str(TempData)
                                                         
datadim<-dim(TempData)
                                                         