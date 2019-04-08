library("rstan")
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())

# Quick check
hier_model <- stan_model(file = 'hierarchical_binomial.stan')
map <- optimizing(hier_model, data = stan_data, hessian = TRUE)
post_mean = map$par[1:17]
post_mean_la = map$par[18:369]
post_var = 1 / (-1 * diag(map$hessian)[1:17])
post_var_la = 1 / (-1 * diag(map$hessian)[18:369])
names(post_mean) <- colnames(X)
names(post_var) <- names(post_mean)
cbind(post_mean, post_var)


# Full MCMC

fit <- stan(file = 'mene/MeneAnalysis/binomial.stan', data = stan_data, chains=2)
plot(fit)
summary(fit)
