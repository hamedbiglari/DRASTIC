
# Dear Client
# Using DRASTIC_Index.R code you could measure the DRASTIC Index for water quality purpose. 
# ****** befor runing the code please attention to following steps.

## DRASTIC Index Software User Manual:

##### 1- first installing the bellow packages

install.packages("installr")
install.packages("readxl")
install.packages("tidyverse")
install.packages("tibble")
install.packages("openxlsx")

##### 2- after that put the floder ( DRASTIC_R ) in your dervid D:\ on your if you has not derive D:\ you must chage the R software directory to another palce in the cod (change the setwd()).
##### 3- open the Original sub folder in DRASTIC_R folder and entry your data in DRASTIC excel file (you shoud be very carefull that not change the titles and fill all entries data very periciously with correct spelling as a available data sample.
##### 4- in D:\DRASTIC_R\Result subfolder you could See and get the result and shapes.

# You could also run the codes in RGUI or use following path base on source excutation easyly. 
# At the end of runing process the result in opened excel and shape files are shown for glance evaluate.
# if used RUGI please wait until the process sucessfuly done and you see (your analysis done sucssefully) message at the end of execution process. 

#  ******* NOTICE: 
## all cells contain missing value will be deleted.
## your R version will be updated to end version during the process automatically, and And this is mandatory.
## If analysis has been not done in any way, certainly your entries has speling error, so check all of entries and run the procces again.
##

# - Be lucky -


setwd("D:/DRASTIC_R/Origin")
source("2- DRASTIC_Index.R")
DRASTIC_Index("DRASTIC")
