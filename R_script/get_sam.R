library(rpostgis)
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = "gis")
sam_sql = "select ageh, sex, cars, e.general_description || ':' || e.description as ethnicity,
                  scgpuk11c, tenduk11, tenure, lower_age, upper_age, marstat, disability, 
                  dpcfamuk11, family_structure, sizhuk11, hours, 
                  substring(ec.description, 1, 10) || ':' || substring(ec.economic_activity, 1, 10) as econact,
                  cars, health, marstat, scgpuk11c, dpcfamuk11, sizhuk11
           from ons_la_small_area_microdata sam 
           left join ons_sam_agebands a
           on sam.ageh=a.agehrp
           left join ons_sam_ethnicity e
           on sam.ethnicityew = e.idx
           left join ons_sam_econact ec
           on sam.ecopuk11 = ec.idx;"
sam.df <- dbGetQuery(con, sam_sql)
