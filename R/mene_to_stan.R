library(hash)


format_hierarchical <- function(y, mene.df, individual_terms){
  current.na.action <- options('na.action')
  options(na.action='na.pass')
  X = model.matrix(reformulate(termlabels=individual_terms), mene.df)
  without_nas = strip_nas(cbind(y, X, mene.df$la_number))
  stan_data = list(y=as.integer(without_nas$y), X=without_nas$X, N=length(without_nas$y),
                   K=dim(without_nas$X)[2], la_index=without_nas$la_index,
                   N_las=max(without_nas$la_index))
  options(na.action=current.na.action)
  return(stan_data)
}

strip_nas <- function(Z) {
  Z <- na.omit(Z)
  la_index <- Z[,ncol(Z)]
  y = Z[,1]
  X = Z[,-1]
  X <- X[,-ncol(X)]
  return(list(X=X, y=y, la_index=la_index))
}

label_las <- function(la_dict, n_reffs){
  la_names <- vector("numeric", n_reffs)
  for (i in 1:n_reffs) {
      la_names[i] = values(la_dict, i)
    }
  return(la_names)
  }

create_la_index <- function(mene.df){
    no_names <- c(" ", "355", "356", "358", "359", "361", "362", "367", "368", "371", "372", "373", "374", "375")  
    for (no_name in no_names) {mene.df$ons_code[mene.df$ons_code == no_name] <- NA}
    mene.df$ons_code <- as.factor(mene.df$ons_code)
    mene.df$la_number <- as.numeric(mene.df$ons_code)
    return(mene.df)
}


extract_bayesian_point_estimates <- function(stan_data, stan_posterior, post_reff_names){
    n_design_columns = dim(stan_data$X)[2]
    n_la_columns = max(stan_data$la_index)
    reff_start_pos = n_design_columns + 1
    reff_end_pos = n_design_columns + n_la_columns
    post_mean = stan_posterior$par[1:n_design_columns]
    post_mean_la = stan_posterior$par[reff_start_pos: reff_end_pos]
    post_var = sqrt(1 / (-1 * diag(stan_posterior$hessian)[1:n_design_columns]))
    post_var_la = sqrt(1 / (-1 * diag(stan_posterior$hessian)[reff_start_pos:reff_end_pos]))
    names(post_mean) <- colnames(stan_data$X)
    names(post_var) <- names(post_mean)
    names(post_mean_la) <- post_reff_names
    names(post_var_la) <- names(post_mean_la)
    return(list(feff=data.frame(mean=post_mean, var=post_var),
                reff=data.frame(mean=post_mean_la, var=post_var_la)))}

    
format_hierarchical_forecast <- function(y, mene.df, individual_terms, sam.df){
  current.na.action <- options('na.action')
  options(na.action='na.pass')
  X = model.matrix(reformulate(termlabels=individual_terms), mene.df)
  X_star = model.matrix(reformulate(termlabels=individual_terms), sam.df)
  without_nas = strip_nas(cbind(y, X, mene.df$la_number))
  X_star <- na.omit(X_star)
  stan_data = list(y=as.integer(without_nas$y), X=without_nas$X, N=length(without_nas$y),
                   K=dim(without_nas$X)[2], la_index=without_nas$la_index,
                   N_las=max(without_nas$la_index), X_star=X_star, N_star=dim(X_star)[1])
  options(na.action=current.na.action)
  return(stan_data)
}
