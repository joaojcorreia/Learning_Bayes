library (tidyverse)
library(rstan)
library(V8)

options(mc.cores = parallel::detectCores())
rstan_options(auto_write = TRUE)

#exercise taken from the video: https://youtu.be/Ie-6H_r7I5A?si=UJhEK2uuwN_NSptp #



data_list <- list(n = 16, s = 6)

# Compiling and producing posterior samples from the model.
stan_samples <- stan(file = 'code/fish.stan', data = data_list)

# Plotting and summarizing the posterior distribution
stan_samples
traceplot(stan_samples)
plot(stan_samples)

# Export the samples to a data.frame for easier handling.
posterior <- as.data.frame(stan_samples)

# Now we could, for example, calculate the probability that the rate is higher
# than, say, 20%
sum(posterior$rate > 0.2) / length(posterior$rate )
