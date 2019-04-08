data {
  int<lower=0> N;
  int<lower=0> K;
  int<lower=0> N_las;
  matrix[N, K] X;
  int<lower=0,upper=1> y[N];
  int<lower=0> la_index[N];
}
parameters {
  vector[K] beta;
  vector[N_las] beta_0;
}
transformed parameters {
  vector[N] eta;
  for (i in 1:N) {
    eta[i] = X[i] * beta + beta_0[la_index[i]];
  }
}
model {
  for (i in 1:N) {
  y[i] ~ bernoulli_logit(eta[i]);
  }
}



