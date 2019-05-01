
library(testthat)


context("check summary measures")

# aux_mean
test_that("aux_mean gives the right calculation result",{
  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(3, 0.7), 2.1)
  expect_equal(aux_mean(4, 0.4), 1.6)
})

test_that("aux_mean is of length 1",{
  expect_length(aux_mean(10, 0.3), 1)
  expect_length(aux_mean(2, 0.6), 1)
  expect_length(aux_mean(3, 0.5), 1)
})

test_that("aux_mean gets an error if inputs are not of the same type,
          so they cannot be multiplied using the function designed",{
            expect_error(aux_mean("abc", 0.5))
            expect_error(aux_mean(2, "abc"))
            })


# aux_variance
test_that("aux_variance gives the right calculation result",{
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(3, 0.7), 0.63)
  expect_equal(aux_variance(4, 0.4), 0.96)
})

test_that("aux_variance is of length 1",{
  expect_length(aux_variance(10, 0.3), 1)
  expect_length(aux_variance(2, 0.6), 1)
  expect_length(aux_variance(3, 0.5), 1)
})

test_that("aux_variance gets an error if inputs are not of the same type,
          so they cannot be calculated using the function designed",{
            expect_error(aux_variance("abc", 0.5))
            expect_error(aux_variance(2, "abc"))
            })


# aux_mode
test_that("aux_mode gives the right calculation result",{
  expect_equal(aux_mode(10, 0.3), 3) # when n*p + p is not an integer, there is only one mode
  expect_equal(aux_mode(3, 0.7), 2)
  expect_equal(aux_mode(4, 0.4), c(2, 1)) # when n*p + p is an integer, there are two answeres
})

test_that("aux_mode is of length 1 or 2 (it depends)",{
  expect_length(aux_mode(10, 0.3), 1) # when n*p + p is not an integer, there is only one mode
  expect_length(aux_mode(3, 0.7), 1)
  expect_length(aux_mode(4, 0.4), 2) # when n*p + p is an integer, there are two answeres
})

test_that("aux_mode gets an error if inputs are not of the same type,
          so they cannot be calculated using the function designed",{
            expect_error(aux_mode("abc", 0.5))
            expect_error(aux_mode(2, "abc"))
            })


# aux_skewness
test_that("aux_skewness gives the right calculation result",{
  expect_equal(aux_skewness(1, 0.5), 0)
  expect_equal(aux_skewness(1, 0.2), 1.5)
  expect_equal(aux_skewness(4, 0.5), 0)
})

test_that("aux_skewness is of length 1",{
  expect_length(aux_skewness(10, 0.3), 1)
  expect_length(aux_skewness(3, 0.7), 1)
  expect_length(aux_skewness(4, 0.4), 1)
})

test_that("aux_skewness gets an error if inputs are not of the same type,
          so they cannot be calculated using the function designed",{
            expect_error(aux_skewness("abc", 0.5))
            expect_error(aux_skewness(2, "abc"))
          })


# aux_kurtosis
test_that("aux_kurtosis gives the right calculation result",{
  expect_equal(aux_kurtosis(1, 0.5), -2)
  expect_equal(aux_kurtosis(1, 0.2), 0.25)
  expect_equal(aux_kurtosis(4, 0.5), -0.5)
})

test_that("aux_kurtosis is of length 1",{
  expect_length(aux_kurtosis(10, 0.3), 1)
  expect_length(aux_kurtosis(3, 0.7), 1)
  expect_length(aux_kurtosis(4, 0.4), 1)
})

test_that("aux_kurtosis gets an error if inputs are not of the same type,
          so they cannot be calculated using the function designed",{
            expect_error(aux_kurtosis("abc", 0.5))
            expect_error(aux_kurtosis(2, "abc"))
          })
