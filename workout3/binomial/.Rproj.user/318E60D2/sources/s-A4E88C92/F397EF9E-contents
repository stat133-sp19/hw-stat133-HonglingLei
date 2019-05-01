
# PRIVATE CHECKER FUNCTIONS
# tests if an input prob is a valid probability value (0<=p<=1)
check_prob <- function(prob){
  if (length(prob) != 1){
    stop("prob should be of length 1")
  }
  if (length(prob) == 1 & prob >= 0 & prob <= 1){
    result = TRUE
  }else{
    stop("invalid prob value")
  }
  return(result)
}

# tests if an input trials is a valid value for number of trials (non negative integer)
check_trials <- function(trials){
  if (length(trials) == 1 & trials >= 0 & (trials - as.integer(trials) == 0)){
    result = TRUE
  }else{
    stop("invalid trials value")
  }
  return(result)
}

# tests if an input success is a valid value for number of successes (0<=k<=n)
check_success <- function(success, trials){
  for (i in 1:length(success)){
    if(success[i] > trials){
      stop("invalid success value, success cannot be greater than trials")
    }else if(success[i] - as.integer(success[i]) != 0){
      stop("invalid success value, success should be an integer")
    }else if(success[i] < 0){
      stop("invalid success value, success cannot be smaller than 0")
    }else{
      return(TRUE)
    }
  }
}

# PRIVATE AUXILIARY FUNCTIONS
# calculates the expected value of a binomial distribution (np)
aux_mean <- function(trials, prob){
  result = trials * prob
  return(result)
}

# calculates the variance (np(1-p))
aux_variance <- function(trials, prob){
  variance = trials * prob * (1 - prob)
  return(variance)
}

# calculates the mode
aux_mode <- function(trials, prob){
  n = trials * prob + prob
  if(n - as.integer(n) == 0){
    mode = c(n, n-1)
  } else{
    mode = floor(n)
  }
  return(mode)
}

# calculates the skewness
aux_skewness <- function(trials, prob){
  skewness = (1-2*prob)/sqrt(trials*prob*(1-prob))
  return(skewness)
}

# calculates the kurtosis
aux_kurtosis <- function(trials, prob){
  kurtosis = (1-6*prob*(1-prob))/(trials*prob*(1-prob))
  return(kurtosis)
}

