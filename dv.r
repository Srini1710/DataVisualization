california <- read.csv("C:\\Users\\SRINIVAS P A\\Desktop\\sf-air-traffic-passenger-and-landings-statistics\\air-traffic-landings-statistics.csv")
california$Activity.Period  <-  as.Date(paste0(as.character(california$Activity.Period), '01'), format='%Y%m%d')
write.csv(california, file="landing.csv")

california <- read.csv("C:\\Users\\SRINIVAS P A\\Desktop\\sf-air-traffic-passenger-and-landings-statistics\\air-traffic-passenger-statistics.csv")
california$Activity.Period  <-  as.Date(paste0(as.character(california$Activity.Period), '01'), format='%Y%m%d')
write.csv(california, file="passenger.csv")

library(rvest)
library(htmltab)

url <- "https://en.wikipedia.org/wiki/List_of_the_busiest_airports_in_the_United_States"

table <- url %>% read_html() %>% html_node('body #content #bodyContent #mw-content-text .mw-parser-output table') %>% html_table(header = F)
wikitable <- as.data.frame(table)

names(wikitable) <- as.character(unlist(wikitable[1,]))
wikitable <- wikitable[-1,]

names(wikitable)[names(wikitable) == "2017[3]"] <- "2017"
names(wikitable)[names(wikitable) == "2016[4]"] <- "2016"
names(wikitable)[names(wikitable) == "2015[5]"] <- "2015"
names(wikitable)[names(wikitable) == "2014[6]"] <- "2014"
names(wikitable)[names(wikitable) == "2013[7]"] <- "2013"
names(wikitable)[names(wikitable) == "2012[8]"] <- "2012"
names(wikitable)[names(wikitable) == "2011[9]"] <- "2011"
names(wikitable)[names(wikitable) == "2010[10]"] <- "2010"
names(wikitable)[names(wikitable) == "2009[11]"] <- "2009"
names(wikitable)[names(wikitable) == "Rank(2017)"] <- "Rank"

write.csv(wikitable, "wikipedia.csv", row.names = FALSE)


california <- read.csv("C:\\Users\\SRINIVAS P A\\Desktop\\Air_Traffic_Cargo_Statistics.csv")
california$ï..Activity.Period  <-  as.Date(paste0(as.character(california$ï..Activity.Period), '01'), format='%Y%m%d')
write.csv(california, file="cargo.csv", row.names = FALSE)