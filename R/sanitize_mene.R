library(dplyr)

handle_nas <- function(x){
    return(droplevels(addNA(factor(na_if(x, " "), exclude=NULL))))}

mene_factors <- function(mene.df) {
  mene.df$age = handle_nas(mene.df$age)
  mene.df$sex = handle_nas(mene.df$sex)
  mene.df$seg = handle_nas(mene.df$seg)
  mene.df$segall = handle_nas(mene.df$segall)
  mene.df$tenure = handle_nas(mene.df$tenure)
  mene.df$ethnicity_5 = handle_nas(sapply(mene.df$ethnicity, mene_ethnicity_5))
  mene.df$ethnicity = handle_nas(mene.df$ethnicity)
  mene.df$disability = handle_nas(mene.df$disability)
  mene.df$marstat = handle_nas(mene.df$marital)
  mene.df$adults_in_hh <- handle_nas(mene.df$adults_in_hh)
  mene.df$child_in_hh <- handle_nas(mene.df$child_in_hh)
  mene.df$hh_size <- handle_nas(mene.df$hh_size)
  mene.df$workstat <- handle_nas(mene.df$workstat)
  mene.df$car <- handle_nas(mene.df$car)
  mene.df$genhealth <- addNA(factor(mene.df$generalhealth, levels = c("Don't know", "Very bad", "Bad", "Fair", "Good", "Very good"), , exclude=NULL))
  return(mene.df)
}


mene_code_q1 <- function(mene.df){
  mene.df$q1_binary <- 0
  mene.df$q1_binary[mene.df$q1 > 0] <- 1
  return(mene.df)
}


mene_code_q17 <- function(mene.df){
  mene.df$q17_binary <- 1
  mene.df$q17_binary[mene.df$q17 == "Never"] <- 0
  mene.df$q17_binary[mene.df$q17 == "Once or twice"] <- 0
  mene.df$q17_binary[mene.df$q17 == "Once every 2-3 months"] <- 0
    mene.df$q17_binary[mene.df$q17 == " "] <- NA
  mene.df$q17 <- factor(mene.df$q17, levels=c("Never", "Once or twice", "Once every 2-3 months", "Once or twice a month", "Once a week", "Several times a week", "Every day", "More than once per day"))
  return(mene.df)
}

mene_ethnicity_5 <- function(x){
    if (x ==  "White British") {
            y <- "white_british"
        } else if (x == "Any other white background" ||
                   x == "White Irish") {
            y <- "white_other"
        } else if (x == "African" || x == "Any other Black background" ||
                   x == "Caribbean") {
            y <- "black"
        } else if (x == "Any other Asian backgrund" ||
                   x == "Bangladeshi" || x == "Chinese" ||
                   x == "Indian" || x == "Pakistani") {
            y <- "asian"
        }  else {
            y <- "other"
        }
    return(y)}

  
