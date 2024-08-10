
data {
  int n;
  int s;
}

parameters {
  real<lower=0, upper=1> rate;
}

model {
  rate ~ uniform(0, 1);
  s ~ binomial(n, rate);
}

generated quantities {
  real rate_squared;
  rate_squared = rate^2;
}
