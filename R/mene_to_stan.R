library(hash)


format_hierarchical <- function(y, mene.df, individual_terms, la_index){
  current.na.action <- options('na.action')
  options(na.action='na.pass')
  X = model.matrix(reformulate(termlabels=individual_terms), mene.df)
  X <- cbind(X, mene.df$la_number)
  xy = strip_nas(y, X)
  X = xy$X
  y = xy$y
  stan_data = list(y=as.integer(y), X=X, N=length(y),
                   K=dim(X)[2], la_index=la_index, N_las=max(la_index))
  options(na.action=current.na.action)
  return(stan_data)
}

strip_nas <- function(y, X) {
  xy = cbind(y, X)
  xy <- na.omit(xy)
  y = xy[,1]
  X = xy[,-1]
  la_index <- xy[,ncol(xy)]
  X <- X[,-ncol(X)]
  return(list(X=X, y=y))
}

label_las <- function(mene.df, la_index, posterior_summaries){
  dict <- hash(c(1:length(levels(mene.df$la))), levels(mene.df$la))
  the_names <- vector(,length(unique(la_index)))
  for (i in la_index) {the_names[i] = values(dict, i)}
  names(post_mean_la) <- the_names
  return(post_mean_la)
  }
