library(googlesheets4)

sheet_url <- "https://docs.google.com/spreadsheets/d/1JxhqL3cN1UmAlN-7_J3RVnG870xFPCWuYsOloeokIkE/edit?resourcekey=&gid=1723608119#gid=1723608119"

bites <- read_sheet(sheet_url)

write.csv(x=bites,file="./home_stuff/bites.csv")
