
match_sam <- function(sam.df){
sam.df$car <- NA
sam.df$car[sam.df$cars == "0"] <- 0
sam.df$car[sam.df$cars == "1" | sam.df$cars == "2" | sam.df$cars == "3" | sam.df$cars == "4 or more"] <- 1
sam.df$car <- as.factor(sam.df$car)
sam.df$sex <- as.factor(sam.df$sex)

sam.df$age <- NA
sam.df$age[sam.df$ageh == "-8"] <- NA
sam.df$age[sam.df$ageh == "4" | sam.df$ageh == "5"] <- "16-24"
sam.df$age[sam.df$ageh == "6" | sam.df$ageh == "7"] <- "25-34"
sam.df$age[sam.df$ageh == "8" | sam.df$ageh == "9"] <- "35-44"
sam.df$age[sam.df$ageh == "10" | sam.df$ageh == "11"] <- "45-54"
sam.df$age[sam.df$ageh == "12" | sam.df$ageh == "13"] <- "55-64"
sam.df$age[sam.df$ageh == "14" | sam.df$ageh == "15" | sam.df$ageh == "16" | sam.df$ageh== "17" | sam.df$ageh == "18" | sam.df$ageh == "19"] <- "65+"
sam.df$age <- as.factor(sam.df$age)
sam.df$ethnicity_5 <- NA
sam.df$ethnicity_5[sam.df$ethnicity == "Asian:Bangladeshi" | sam.df$ethnicity == "Asian:Chinese" | sam.df$ethnicity == "Asian:Indian" | sam.df$ethnicity == "Asian:Other" | sam.df$ethnicity == "Asian:Pakistani"] <- "asian"
sam.df$ethnicity_5[sam.df$ethnicity == "Black:African" | sam.df$ethnicity == "Black:Caribbean or Other"] <- "black"
sam.df$ethnicity_5[sam.df$ethnicity == "Mixed:White and Asian or Other" | sam.df$ethnicity == "Mixed:White and Black" | sam.df$ethnicity == "Other:Other"] <- "other"
sam.df$ethnicity_5[sam.df$ethnicity == "White:Irish" | sam.df$ethnicity == "White:Other"] <- "white_other"
sam.df$ethnicity_5[sam.df$ethnicity == "White:UK"] <- "white_british"
sam.df$marital_mene <- sam.df$marstat
sam.df$marstat <- NA
sam.df$marstat[sam.df$marital_mene == "Single (never married/never partnership)"] <- "Single"
sam.df$marstat[sam.df$marital_mene == "Married" | sam.df$marital_mene == "Registered civil partnership"] <- "Married"
sam.df$marstat[sam.df$marital_mene == "Separated" | sam.df$marital_mene == "Divorced or from legally dissolved civil partnership" | sam.df$marital_mene == "Widowed or Surviving partner of civil partnership"] <- "Sep/Wid/div"
sam.df$marstat <- as.factor(sam.df$marstat)
sam.df$seg <- as.factor(sam.df$scgpuk11c)
sam.df$child_in_hh <- "Some"
sam.df$child_in_hh[sam.df$dpcfamuk11 == "None"] <- "None"
sam.df$child_in_hh[is.na(sam.df$dpcfamuk11)] <- NA
sam.df$child_in_hh <- as.factor(sam.df$child_in_hh)
sam.df$adults_in_hh <- sam.df$sizhuk11
sam.df$adults_in_hh[sam.df$sizhuk11 == "5" | sam.df$sizhuk11 == "6" | sam.df$sizhuk11 == "7 or more"] <- "5+"
sam.df$adults_in_hh <- as.factor(sam.df$adults_in_hh)
return(sam.df)}
