library(tidyverse)

#load data
crime2020 <- read.csv("Crime_Data_from_2020_to_Present.csv")
crime2010 <- read.csv("Crime_Data_from_2010_to_2019.csv")
crime <- rbind(crime2010, crime2020)

#delete DR_NO, Rpt.Dist.No, Part.1-2, Mocodes, Crm.Cd.1, Crm.Cd.2, Crm.Cd.3, Crm.Cd.4 columns
crime <- crime[-c(1, 7, 8, 11, 21, 22, 23, 24)]

#rename columns
names(crime) <- c("Date_Rptd", "Date_Occ", "Time_Occ", "Area_Code", "Area_Name", "Crm_Code", "Crm_Desc", "Vict_Age", "Vict_Sex", "Vict_Descent", "Premis_Code", "Premis_Desc", "Weapon_Code", "Weapon_Desc", "Status_Code", "Stat_Desc", "Location", "Cross_Street", "Lat", "Lon")

#convert Date.Rptd, DATE.OCC from factor to Date
crime$Date_Rptd <-  as.Date(crime$Date_Rptd, format = "%m/%d/%Y")
crime$Date_Occ <- as.Date(crime$Date_Occ, format = "%m/%d/%Y")

#filter for just 2019 and 2020 data
crime <- crime %>% filter(Date_Occ > "2018-12-31")
#arrange by ascending date and time
crime <- crime %>% arrange(Date_Occ, Time_Occ)

write.csv(crime, file = "CrimeLA_Clean.csv")