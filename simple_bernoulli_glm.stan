data {
  int<lower=0> N;
  int<lower=0> K;
  matrix[N, K] X;
  int<lower=0,upper=1> y[N];
}
parameters {
  vector[K] beta;
}
transformed parameters {
  vector[N] eta;
  eta = X * beta;

}
model {
  for (i in 1:N) {
  y[i] ~ bernoulli_logit(eta[i]);
  }
}



