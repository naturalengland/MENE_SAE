
mene_factors <- function(mene.df) {
  mene.df$age = as.factor(mene.df$age)
  mene.df$sex = as.factor(mene.df$sex)
  mene.df$seg = as.factor(mene.df$seg)
  mene.df$segall = as.factor(mene.df$segall)
  mene.df$tenure = as.factor(mene.df$tenure)
  mene.df$ethnicity = as.factor(mene.df$ethnicity)
  mene.df$disability = as.factor(mene.df$disability)
  mene.df$marstat = as.factor(mene.df$marital)
  mene.df$adults_in_hh <- as.factor(mene.df$adults_in_hh)
  mene.df$child_in_hh <- as.factor(mene.df$child_in_hh)
  mene.df$hh_size <- as.factor(mene.df$hh_size)
  mene.df$workstat <- as.factor(mene.df$workstat)
  mene.df$car <- as.factor(mene.df$car)
  mene.df$genhealth <- factor(mene.df$generalhealth, levels = c("Don't know", "Very bad", "Bad", "Fair", "Good", "Very good"))
  mene.df$car[!(mene.df$car == "Yes" | mene.df$car == "No")] <- NA
  mene.df$genhealth[mene.df$genhealth == "Don't know"] <- NA
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
