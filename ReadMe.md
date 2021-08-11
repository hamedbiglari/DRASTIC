DRASTIC: A free package for DRASTIC Index Calculation in R

Background:
There is no absolute method for assessing the vulnerability of groundwater, but several methods for estimating the sensitivity of aquifers to pollution have been developed (Murat V., Martel R., Michaud Y., Therrien R., (2000)). 
The DRASTIC method, which belongs to the group of weighted classes, is a system that was developed by (Aller, T. Bennet, J.H. Lehr, R.J. Petty, G. Hacket 1987) as a means to evaluate the intrinsic vertical groundwater vulnerability to pollution by parametric systems, the common principle of these systems is to first select the parameters on which to base the assessment of vulnerability. Each parameter is divided into intervals of significant value and is assigned a numerical rating increasing, according to its importance in vulnerability.
In practice, each parameter was divided into intervals of significant values and has been assigned a numerical rating increasing, according to its importance in vulnerability.
The acronym DRASTIC stands for the initials of seven factors determining the value of the vulnerability index (Bézèlgues S., Des Garets E., Mardhel V. et Dörfliger N. (2002)): the water depth (D), the effective charge (R) materials of the aquifer (A), the type of ground (S), the topography or the slope (T), the impact area vadose zone or aerated (I) and the permeability or hydraulic conductivity of the aquifer (C). 
Each parameter is assigned a scale comprising intervals where a rating is assigned according to the peculiarity of the environment. Each parameter has been classified into classes associated with scores ranging from 1 to 10. For example, the deeper the water, the greater the odds are low.
Each of the seven parameters was then multiplied by a scaling factor (Dp) sets 1 to 5 which increases with the importance of the parameter in the estimation of vulnerability.
It describes the degree of Vulnerability of each hydrogeological unit. The ID was calculated by summing the products of the weight measured from the corresponding parameters according to equation:

ID = Dc×Dp + Rc×Rp + Ac× Ap + Sc×Sp + Tc×Tp + Ic× Ip + Cc×Cp

(Where D, R, A, S, T, I and C are the seven parameters of the DRASTIC method, "p" is the weight of Parameter and "c" the rating associated).

* Refer to shape 1 in repository attachment
* Refer to shape 2 in repository attachment

-------------------------------------------------------------
Dear Client
The process can be broken into five major steps that include:

1- first installing the bellow packages (before running the codes)
install.packages("installr")
install.packages("readxl")
install.packages("tidyverse")
install.packages("tibble")
install.packages("openxlsx")

2- Create a folder with name of "DRASTIC_R" (D:\DRASTIC_R\)and Put it (DRASTIC_R) in your D:\ on your computer. if you has not derive D:\ you must chage the R directory to another palce in the code (change the setwd()).

3- Create a subfolder with name "Origin" (D:\DRASTIC_R\Origin)and put the content of our repository Origin folder in it then open the Origin subfolder and entry your data in DRASTIC.xls file (An excel file)(you shoud be carefull do not change the titles and fill all entries data periciously with correct spelling as a available data samples.

4-  Create a subfolder with name "Results" (D:\DRASTIC R\Result), after running the codes you could see the result and shapes in this folder.


# You could also run the codes in RGUI or use following path base on source excutation easyly. 

setwd("D:/DRASTIC_R/Origin")
source("2- DRASTIC_Index.R")
DRASTIC_Index("DRASTIC")

If used RUGI please wait until the process sucessfuly done and you see (your analysis done sucssefully) message at the end of execution process. 
At the end of runing process the result in opened excel and shape files are shown for glance evaluate.


*** NOTICE: 
All Excell cells (data) contain missing value will be deleted.
your R version will be updated to end version during the process automatically, and And this is mandatory.

*** If analysis has been not done in any way, certainly your entries has speling error, so check all of entries and run the procces again.

------------------------------------------
This was a project in the Environmental Engineering PhD cours. It was done in 2021/4 with the encouragement of Dr. Ramin Nabizadeh.
Thanks to all the encouragement and dear companions

Hamed Biglari
PhD in environmental health Engineering, Tehran, Iran

WhatAppNumber: +98 936 080 5530
hamed.biglari@gmu.ac.ir
hamed.biglari@gmail.com

yours faithfully