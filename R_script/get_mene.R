library(rpostgis)
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = "gis")
mene_sql = "select q1, q17, tenure, age, sex, ethnicity, disability,
                   marital, workstat, seg, segall, lifestage, physical,
                   adults_in_hh, child_in_hh, hh_size, workstat,
                   car, generalhealth, year, residence_localauthority
            from staging.natural_england_mene_respondents_y1_9;"
mene.df <- dbGetQuery(con, mene_sql)

