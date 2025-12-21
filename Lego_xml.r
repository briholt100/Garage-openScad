

library(xml2)

lego <- read_xml(x ="/home/brian/Downloads/hilux_Parts.xml")

xml_structure(lego)
xml_find_all(lego,"//ITEMID")
