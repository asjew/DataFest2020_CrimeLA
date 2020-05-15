library(dplyr)
library(tidyverse)
la_crime <- read.csv("CrimeLA_Clean.csv", header = T)
levels(la_crime$Vict_Descent) <- c("Unknown", "Unknown", "Asian", "Black", "Chinese", "Cambodian", "Filipino", "Guamanian", "Hispanic/Mexican", "American Indian/Alaskan Native", "Japanese", "Korean", "Laotian", "Other", "Pacific Islander", "Samoan", "Hawaiian", "Vietnamese", "White", "Unknown", "Asian Indian")
levels(la_crime$Vict_Descent)
levels(la_crime$Premis_Desc) #transient encampment is 279, halfway hgouse is 280
indoor_locations <- levels(la_crime$Premis_Desc)[c(10,74,84,117,113,96,114,249,233,236,250,280)] 
indoor_crimes<- la_crime%>%filter(Premis_Desc == indoor_locations)%>%select(Area_Name,Area_Code,Crm_Desc,Vict_Age,Vict_Descent,Vict_Sex,Premis_Desc, Date_Occ)

#Stay at home orders started march 19th link used https://www.gov.ca.gov/2020/03/19/governor-gavin-newsom-issues-stay-at-home-order/
east_asian <- levels(la_crime$Vict_Descent)[c(2,4,5,6,10,11,12,17,19)]

indoor_crimes_pre <- indoor_crimes[1:637,]
indoor_crimes_post <- indoor_crimes[638:nrow(indoor_crimes),]


battery_and_assult <- levels(la_crime$Crm_Desc)[c(3,6,39)]

pre_crimes <- indoor_crimes_pre%>%filter(Vict_Descent == east_asian) #4 crimes out of 637
View(pre_crimes)
post_crime <- indoor_crimes_post%>%filter(Vict_Descent == east_asian) #15 crimes out of 4577
View(post_crime)
#contruct a z prop 
res <- prop.test(x= c(4,15), n= c(637,4577))
res
