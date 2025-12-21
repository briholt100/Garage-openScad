

library(xml2)
library(clipr)

lego <- read_xml(x ="/home/brian/Downloads/hilux_Parts.xml")

xml_structure(lego)
item_numbers <- xml_find_all(lego,"//ITEMID")
write_clip( xml_text(item_numbers, trim = TRUE))
