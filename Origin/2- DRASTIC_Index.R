cat("Please wait until the process sucessfuly doing and see message (your analysis done sucssefully)")
cat("NOTICE: all cells contain missing value will be deleted")
cat("your R version would be updated to end version and some packages (installr, readxl, tidyverse, tibble, openxlsx) were install on your R software during process")
cat("If analysis has been not done in any way, certainly your entries has speling error, so check all of entries and run the procces again")

## your R version get updated
#install.packages("installr")
library(installr)
#sessionInfo()
#package_version(R.version)
Rversion <- noquote(as.character(getRversion()))
R<- Rversion
Rversion<- gsub("[.]", "", R)

for (version in Rversion){
  if (version==405){
        print("No need to update the R Version on your system")
  } else {
    updateR()
          }
}

library(tcltk)
pb<- tkProgressBar("test progress bar", "Some information in %", 0, 100, 50)
Sys.sleep(0.5)
u <- c(0, sort(runif(20, 0, 100)), 100)
for(i in u) {
  Sys.sleep(0.1)
  info <- sprintf("%d%% DRASTIC caculation Process", round(i))
  setTkProgressBar(pb, i, sprintf("test (%s)", info), info)
}
Sys.sleep(1)
close(pb)

rm(list=ls())
rm
cat("\014")
options(device = "windows")
setwd("D:/DRASTIC_R/Origin")

#############################
#DRASTIC <- read.csv('data.csv', header = TRUE, sep=",")
#write.csv(data.frame(DRASTIC), DRASTIC_Result)
#############################

##install.packages("readxl")
library(readxl)
DRASTIC <- read_excel("DRASTIC.xlsx")
#fix(DRASTIC)
noquote(colnames(DRASTIC))
class(DRASTIC)
str(DRASTIC)
summary(DRASTIC)
names(DRASTIC)[1] <- "D"
names(DRASTIC)[2] <- "R"
names(DRASTIC)[3] <- "A"
names(DRASTIC)[4] <- "S"
names(DRASTIC)[5] <- "T"
names(DRASTIC)[6] <- "I"
names(DRASTIC)[7] <- "C"
noquote(colnames(DRASTIC))
names(DRASTIC)

library("tibble")
Result <- data.frame(DRASTIC)
class(Result)
my_data <- Result
my_data <- as.data.frame(my_data)

col_order <- c("D", "R", "T", "C", "S", "I", "A")
my_data2 <- my_data[, col_order]
Result<- my_data2 
names(Result)

Result[!complete.cases(Result), ]

Result<- na.omit(Result)

Result[ ,1:4]<- apply(Result[ ,1:4], 2, function(x) as.numeric(as.character(x)))

######## condition processors##############

#Water table depth data entries
Dnew <- with(Result, ifelse(Result$D<=1.5, 10, ifelse(Result$D<=4.6, 9,
                                                                   ifelse(Result$D<=9.1, 7,
                                                                          ifelse(Result$D<=15.2, 5, 
                                                                                 ifelse(Result$D<=22.9, 3,
                                                                                        ifelse(Result$D<=30.5, 2,
                                                                                                                  1)))))) * 5)              
              
#if Water table depth data entries has spelling error the process has been stopped
matches <- Dnew
for (match in matches){
  if (match[1]==50 |match[1]==45 | match[1]==35 | match[1]==25 | match[1]==15 | match[1]==10 | match[1]==5){
    print("Dnew Passed True")
    break
  } else {
    stop("there is an error type in Water table depth data entries")
    break
  }
}

Result <- cbind(Dnew,Result)

#Net recharge data entries
Rnew<- with(Result, ifelse(Result$R <=5, 1,
                         ifelse(Result$R <=7, 3, 
                                ifelse(Result$R <=9, 5, 
                                       ifelse(Result$R <=11, 8,
                                                                10))))*4)

#if Net recharge data entries has spelling error the process has been stopped
matches <- Rnew
for (match in matches){
  if (match[1]==4 | match[1]==12 | match[1]==20 | match[1]==32 | match[1]==40){
    print("Rnew Passed True")
    break
  } else {
    stop("there is an error type in Net recharge data entries")
    break
  }
}
Result <- cbind(Rnew,Result)

#Topography data entries
Tnew <- with(Result, ifelse (Result$T <=2, 10, 
                             ifelse (Result$T <= 6, 9, 
                                     ifelse (Result$T <= 12, 5,
                                             ifelse (Result$T <= 18, 3, 
                                                                        1))))*1)

#if Topography data entries has spelling error the process has been stopped
matches <- Tnew
for (match in matches){
  if (match[1]==10 | match[1]==9 | match[1]==5 | match[1]==3 | match[1]==1){
    print("Tnew Passed True")
    break
  } else {
    stop("there is an error type in Topography data entries")
    break
  }
}
Result <- cbind(Tnew,Result)

#Hydraulic conductivity data entries
Cnew <- with(Result, ifelse(Result$C <= 4.1, 1,
                            ifelse(Result$C <=12.2, 2,
                                   ifelse(Result$C <=28.5,4 ,
                                            ifelse(Result$C <=40.7, 6,
                                                                      8))))*3)
#if Hydraulic conductivity data entries has spelling error the process has been stopped
matches <- Cnew
for (match in matches){
  if (match[1]==3 | match[1]==6 | match[1]==12 | match[1]==18 | match[1]==24){
    print("Cnew Passed True")
    break
  } else {
    stop("there is an error type in Hydraulic conductivity data entries")
    break
  }
}
Result <- cbind(Cnew,Result)

#Soil media data entries
Snew <- with(Result, ifelse(Result$S %in% c("clay and silt"), 2, 
                             ifelse(Result$S %in% c("sand and clay and silt"), 3,
                                     ifelse(Result$S %in% c("sand"), 5, 
                                             ifelse(Result$S %in% c("gravel and sand and clay and silt"), 6 , 
                                                     ifelse(Result$S %in% c("gravel and sand"), 7,
                                                            ifelse(Result$S %in% c("rubble and sand and clay and silt"), 9,
                                                                                                                            0))))))*2)

#if Soil media data entries has spelling error the process has been stopped
matches <- Snew
for (match in matches){
  if (match[1]==4 | match[1]==6 | match[1]==10 | match[1]==12 | match[1]==14 | match[1]==18){
    print("Snew Passed True")
    break
  } else {
    stop("there is an error type in Soil media data entries")
    break
  }
}
Result <- cbind(Snew,Result)

#Aquifer media data entries
Anew <- with(Result, ifelse (Result$A %in%  c("rubble and sand"), 0,
                             ifelse (Result$A %in%  c("gravel and sand"), 7, 
                                     ifelse (Result$A %in% c("gravel and sand and clay and silt"), 5, 
                                             ifelse (Result$A %in% c("sand and clay"), 4,
                                                     ifelse (Result$A %in%  c("sand and clay and silt"), 3,
                                                                                                            1)))))*3)


#if Aquifer media data entries has spelling error the process has been stopped
matches <- Anew
for (match in matches){
  if (match[1]==0 | match[1]==21 | match[1]==15 | match[1]==12 | match[1]==9){
    print("Anew Passed True")
    break
  } else {
    stop("there is an error type in Aquifer media data entries")
    break
  }
}

Result <- cbind(Anew,Result)

#impact of the vadose zone data entries
Inew <- with(Result, ifelse(Result$I %in% c("sand and clay and silt"), 3 ,
                             ifelse(Result$I %in% c("gravel and sand and clay and silt"), 5,
                                    ifelse(Result$I %in% c("gravel and sand"), 7,
                                           ifelse(Result$I %in% c("rubble and sand and clay and silt"), 9, 
                                                                                                           0))))*5)

#if impact of the vadose zone data entries has spelling error the process has been stopped
matches <- Inew
for (match in matches){
  if (match[1]==15 | match[1]==25 | match[1]==35 | match[1]==45){
    print("Inew Passed True")
    break
  } else {
    stop("there is an error type in impact of the vadose zone data entries")
    break
  }
}

Result <- cbind(Inew,Result)

############ DRASTIC and DRASTIC Explanation

DRASTIC_Index<- Dnew+ Rnew+ Anew+ Snew+ Tnew+ Inew+ Cnew
Result <- cbind(DRASTIC_Index,Result)

Explanation <- with(Result, ifelse(DRASTIC_Index <=46, "Very Low Risk",
                                   ifelse (DRASTIC_Index <=92, "Low Risk",
                                           ifelse (DRASTIC_Index <=136, "Moderate Risk", 
                                                   ifelse (DRASTIC_Index <=184, "High Risk", 
                                                           ifelse(DRASTIC_Index>184, "Very High Risk", "A") ) ) ) ) )
Result <- cbind(Explanation,Result)

#install.packages("tidyverse")
library(tidyverse)
Result<- Result %>% select(D, R, A, S, T, I, C, DRASTIC_Index, Explanation)
names(Result)

#install.packages("tibble")
library("tibble")
my_data <- Result
my_data <- as.data.frame(my_data)
col_order <- c("D", "R", "A", "S", "T", "I", "C", "DRASTIC_Index", "Explanation")
my_data2 <- my_data[, col_order]
Result<- my_data2 
colnames(Result)<- c("Water table depth(m)","Net recharge(m)","Aquifer media", "Soil media", "Topography(%)","The impact of the vadose zone","Hydraulic conductivity(m d-1)", "DRASTIC_Index", "Explanation")
noquote(colnames(Result))

# Statics Reporting
Describe<- Result %>% count(Explanation)
names(Describe)<- c("Risk level", "Frequency")
Describe <- data.frame(Describe)
class(Describe)
x<- sum(Describe$Frequency)
percentage<- Describe[,2]/x*100
percentage <- paste(percentage, "%", sep =" " )
Describe <- cbind(percentage,Describe)
Describe <- Describe[, c(2, 3, 1)]
noquote(colnames(Describe))
class(Describe)

#install.packages("openxlsx")
library(openxlsx)
wb <- createWorkbook()
addWorksheet(wb, "Result", gridLines = TRUE)
addWorksheet(wb, "Describe", gridLines = TRUE)

#Formatting data in excel file 
##rows and header formatting

setColWidths(wb, sheet = "Result", cols = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), widths = c(2.84, 18, 13.47, 26.58, 26.68, 12.58, 26.68, 24.21, 12.53, 10.33))
setRowHeights(wb,sheet = "Result", rows = 1:nrow(Result)+1, heights = 14)

dataStyle  <-  createStyle(fontSize = 11, fontName = "Calibri", fontColour = "#000000", halign = "left", valign = "center", border = "TopBottomLeftRight", borderColour = getOption("openxlsx.borderColour", "black"), borderStyle= getOption("openxlsx.borderStyle", "thin"), fgFill = "#FFFFFF", bgFill = "#FFFFFF", textDecoration = c("italic"), wrapText = FALSE)
addStyle(wb, sheet = "Result", dataStyle,  rows = 1:nrow(Result)+1, cols = 1:9,  gridExpand = TRUE)

# Conditional Formatting

DRASTStyle <-  createStyle(fontSize = 10, fontName = "Calibri", fontColour = "#000000", halign = "left", valign = "center", border = "TopBottomLeftRight", borderColour = getOption("openxlsx.borderColour", "black"), borderStyle= getOption("openxlsx.borderStyle", "thin"), bgFill = "#7DFDFE", wrapText = FALSE)
textStyle1 <-  createStyle(fontSize = 10, fontName = "Calibri", fontColour = "#FFFFFF", halign = "left", valign = "center", border = "TopBottomLeftRight", borderColour = getOption("openxlsx.borderColour", "black"), borderStyle= getOption("openxlsx.borderStyle", "thin"), bgFill = "#95B9C7", wrapText = FALSE)
textStyle2 <-  createStyle(fontSize = 10, fontName = "Calibri", fontColour = "#FFFFFF", halign = "left", valign = "center", border = "TopBottomLeftRight", borderColour = getOption("openxlsx.borderColour", "black"), borderStyle= getOption("openxlsx.borderStyle", "thin"), bgFill = "#87AFC7", wrapText = FALSE)
textStyle3 <-  createStyle(fontSize = 10, fontName = "Calibri", fontColour = "#FFFFFF", halign = "left", valign = "center", border = "TopBottomLeftRight", borderColour = getOption("openxlsx.borderColour", "black"), borderStyle= getOption("openxlsx.borderStyle", "thin"), bgFill = "#659EC7", wrapText = FALSE)
textStyle4 <-  createStyle(fontSize = 10, fontName = "Calibri", fontColour = "#FFFFFF", halign = "left", valign = "center", border = "TopBottomLeftRight", borderColour = getOption("openxlsx.borderColour", "black"), borderStyle= getOption("openxlsx.borderStyle", "thin"), bgFill = "#3090C7", wrapText = FALSE)
textStyle5 <-  createStyle(fontSize = 10, fontName = "Calibri", fontColour = "#FFFFFF", halign = "left", valign = "center", border = "TopBottomLeftRight", borderColour = getOption("openxlsx.borderColour", "black"), borderStyle= getOption("openxlsx.borderStyle", "thin"), bgFill = "#488AC7", wrapText = FALSE)

conditionalFormatting(wb, "Result", rows = 1:nrow(Result)+1, cols = 9,                     rule = ">0",               style = DRASTStyle)
conditionalFormatting(wb, "Result", rows = 1:nrow(Result)+1, cols = 10, type = "contains", rule = "Very Low Risk",    style = textStyle1)
conditionalFormatting(wb, "Result", rows = 1:nrow(Result)+1, cols = 10, type = "contains", rule = "Low Risk",         style = textStyle2)
conditionalFormatting(wb, "Result", rows = 1:nrow(Result)+1, cols = 10, type = "contains", rule = "Moderate Risk",    style = textStyle3)
conditionalFormatting(wb, "Result", rows = 1:nrow(Result)+1, cols = 10, type = "contains", rule = "High Risk",        style = textStyle4)
conditionalFormatting(wb, "Result", rows = 1:nrow(Result)+1, cols = 10, type = "contains", rule = "Very High Risk",   style = textStyle5)

headerS    <-  createStyle(fontSize = 11, fontName = "Calibri", fontColour = "#000000", halign = "left", valign = "center", border = "TopBottomLeftRight", borderColour = getOption("openxlsx.borderColour", "black"), borderStyle= getOption("openxlsx.borderStyle", "thin"), fgFill = "#C0C0C0", bgFill = "#C0C0C0", textDecoration = c("bold"), wrapText = FALSE)
addStyle(wb, sheet = "Result", headerS,    rows = 1, cols = 1:10, gridExpand = TRUE)

#Formatting Describe page

dataStyle2 <-  createStyle(fontSize = 11, fontName = "Calibri", fontColour = "#000000", halign = "center", valign = "center", border = "TopBottomLeftRight", borderColour = getOption("openxlsx.borderColour", "black"), borderStyle= getOption("openxlsx.borderStyle", "thin"), fgFill = "#FFFFFF", bgFill = "#FFFFFF", textDecoration = c("italic"), wrapText = FALSE)
addStyle(wb, sheet = "Describe", dataStyle2, rows = 1:nrow(Describe)+1, cols = 1:4,  gridExpand = TRUE)

headerS2 <-  createStyle(fontSize = 11, fontName = "Calibri", fontColour = "#000000", halign = "center", valign = "center", border = "TopBottomLeftRight", borderColour = getOption("openxlsx.borderColour", "black"), borderStyle= getOption("openxlsx.borderStyle", "thin"), fgFill = "#C0C0C0", bgFill = "#C0C0C0", textDecoration = c("bold"), wrapText = FALSE)
addStyle(wb, sheet = "Describe", headerS2,    rows = 1, cols = 1:4, gridExpand = TRUE)

setColWidths(wb, sheet = "Describe", cols = c(1, 2, 3 , 4), widths = c(1.84, 12.26, 8.58, 9.26))
setRowHeights(wb,sheet = "Describe", rows = 1:nrow(Describe)+1, heights = 14)

#graphics.off()
#the cods of Saving Result in an excel file 
writeData(wb, "Result",   Result,   startCol = 1, startRow = 1, rowNames = TRUE)
writeData(wb, "Describe", Describe, startCol = 1, startRow = 1, rowNames = TRUE)

par(mar=c(5,5,5,5))
Result1<- table(Result$Explanation)
barplot(Result1, horiz=FALSE, main = "Risk explanation number per total", ylab = "Risk numbers", xlab="Type of available Risk", col=c("Red"),font.main= 2, cex.main= 1.5, cex.sub= 1, legend = rownames(Result1), beside=FALSE)
jpeg(file="D:/DRASTIC_R/Result/DRATICgraph.jpg",width=2, height=2, units="in", res=300)
dev.off()


saveWorkbook(wb, "D:/DRASTIC_R/Result/DRASTIC_Result.xlsx", overwrite = TRUE)

#install.packages("NCmisc")
#library(NCmisc)
#list.functions.in.file(rstudioapi::getSourceEditorContext()$path, alphabetic = TRUE)

openXL(wb)

cat("\014")
print(noquote("Analysis Done Successfully, at date: ")); cat(as.character(Sys.time()), sep = "\n")
