library(rpostgis)
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname = "gis")
mene_sql = "select q1, q17, tenure, age, sex, ethnicity, disability,
                   marital, workstat, seg, segall, lifestage, physical,
                   adults_in_hh, child_in_hh, hh_size, workstat5,
                   car, general_health, survey_year, ons_code, ons_name
            from natural_england_mene_respondents;"
mene.df <- dbGetQuery(con, mene_sql)

