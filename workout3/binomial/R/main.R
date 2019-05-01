
# 1.3)
#' @title choose n from k trials
#' @description calculates the number of combinaitons in whicc k successes can occur in n trials
#' @param n number of trials
#' @param k numebr of success
#' @return number of combinations
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)
bin_choose <- function(n, k){
  if (sum(as.integer(length(k <= n))) != length(k <= n)){
    stop("k cannot be greater than n")
  } else{
    result = factorial(n) / (factorial(k) * factorial(n-k))
  }
  return(result)
}


# 1.4)
#' @title probability of a binomial experiment
#' @description calculates the probability of k successes occurring in n trials
#' @param success number of success
#' @param trials numebr of trials
#' @param prob probability of success for every trial
#' @return probability of the binomial experiment
#' @export
#' @examples
#' #  probability of getting 2 successes in 5 trials
#' # (assuming prob of success = 0.5)
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#'
#' # probabilities of getting 2 or less successes in 5 trials
#' # (assuming prob of success = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#'
#' # 55 heads in 100 tosses of a loaded coin with 45% chance of heads
#' bin_probability(success = 55, trials = 100, prob = 0.45)
bin_probability <- function(success, trials, prob){
  if (check_success(success, trials) != TRUE){
    stop("invalid success value")
  }
  if (check_trials(trials) != TRUE){
    stop("invalid trials value")
  }
  if (check_prob(prob) != TRUE){
    stop("invalid prob value")
  }
  if (check_success(success, trials)==TRUE & check_trials(trials)==TRUE & check_prob(prob)==TRUE){
    Pr = bin_choose(trials, success) * (prob^success) * ((1-prob)^(trials-success))
  }
  return(Pr)
}


# 1.5)
#' @title binomial distribution
#' @description displays the distribution in table format
#' @param trials number of trials
#' @param prob probability of success in each trial
#' @return binomial distribution
#' @export
#' @examples
#' # binomial probability distribution
#' bin_distribution(trials = 5, prob = 0.5)
bin_distribution <- function(trials, prob){
  dat = data.frame(success = 0:trials,
                   probability = bin_probability(0:trials, trials, prob))
  return(structure(dat, class = c("bindis", "data.frame")))
}


# plot.bindis
#' @export
plot.bindis <- function(dat, ...){
  barplot(names.arg = dat$success,
          height = dat$probability,
          xlab = "success",
          ylab = "probability")
}


# 1.6)
#' @title binomial cumulative distribution
#' @description calculates the cumulative distribution function
#' @param trials number of trials
#' @param prob probability of success per trial
#' @return binomial cumulative distribution
#' @export
#' @examples
#' # binomial cumulative distribution
#' bin_cumulative(trials = 5, prob = 0.5)
bin_cumulative <- function(trials, prob){
  dat = data.frame(success = 0:trials, probability = bin_probability(0:trials, trials, prob))
  dat$cumulative = rep(0, trials+1)
  for (i in 0:trials+1){
    dat$cumulative[i] = sum(dat$probability[1:i])
  }
  return(structure(dat, class = c("bincum", "data.frame")))
}


# plot.bincum
#' @export
plot.bincum <- function(dat, ...){
  plot(x = dat$success,
       y = dat$cumulative,
       type = "b",
       xlab = "successes",
       ylab = "probaility")
}


# 1.7)
#' @title binary variable
#' @description calculates the cumulative distribution function
#' @param trials number of trials
#' @param prob probability of success per trial
#' @return binomial cumulative distribution
#' @export
bin_variable <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  A = structure(list(trials = trials, prob = prob), class = "binvar")
  return(A)
}


# method print.binvar()
#' @export
print.binvar <- function(A){
  print("Binomial variable")
  print(" ")
  print("Paramaters")
  print(paste("- number of trials:", A$trials))
  print(paste("- prob of success :", A$prob))
}


# method summary.binvar() and print.summary.binvar()
#' @export
summary.binvar <- function(B){
  trials = B$trials
  prob = B$prob
  mean = aux_mean(B$trials, B$prob)
  variance = aux_variance(B$trials, B$prob)
  mode = aux_mode(B$trials, B$prob)
  skewness = aux_skewness(B$trials, B$prob)
  kurtosis = aux_kurtosis(B$trials, B$prob)
  B = structure(list(trials = trials, prob =  prob,
                     mean = mean, variance = variance,
                     mode = mode, skewness = skewness,
                     kurtosis = kurtosis), class = "summary.binvar")
}

# print.summary.bivar()
#' @export
print.summary.binvar <- function(B){
  print("Summary Binomial")
  print("")
  print("Paramaters")
  print(paste("- number of trials:", B$trials))
  print(paste("- prob of success :", B$prob))
  print("")
  print("Measures")
  print(paste("- mean    :", B$mean))
  print(paste("- variance:", B$variance))
  print(paste("- mode    :", B$mode))
  print(paste("- skewness:", B$skewness))
  print(paste("- kurtosis:", B$kurtosis))
}


# 1.8) Functions of measures
#' @title binomial mean
#' @description calculates the mean of the binomial distribution
#' @param trials number of trials
#' @param prob probability of success per trial
#' @return the mean of binomial distribution
#' @export
#' @examples
#' bin_mean(10, 0.3)
bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}


#' @title binomial variance
#' @description calculates the variance of the binomial distribution
#' @param trials number of trials
#' @param prob probability of success per trial
#' @return variance of the binomial distribution
#' @export
#' @examples
#' bin_variance(10, 0.3)
bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}


#' @title binomial mode
#' @description calculates the mode of te binomial distribution
#' @param trials number of trials
#' @param prob probability of success per trial
#' @return mode of the binoial distribution
#' @export
#' @examples
#' bin_mode(10, 0.3)
bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}


#' @title binomial skewness
#' @description calculates the skewness of the binomial distribution
#' @param trials number of trials
#' @param prob probability of success per trial
#' @return skewness
#' @export
#' @examples
#' bin_skewness(10, 0.3)
bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}


#' @title binomial kurtosis
#' @description calculates the krtosis of the binomial distribution
#' @param trials number of trials
#' @param prob probability of success per trial
#' @return kurtosis
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)
bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}

