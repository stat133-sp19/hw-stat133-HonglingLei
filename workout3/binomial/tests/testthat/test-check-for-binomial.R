

library(testthat)


context("check binomial functions")

# bin_choose
test_that("bin_choose gives the right calculation result",{
  expect_equal(bin_choose(5, 2), choose(5, 2))
  expect_equal(bin_choose(4, 2), choose(4, 2))
  expect_equal(bin_choose(3, 2), choose(3, 2))
})

test_that("bin_choose is of length 1",{
  expect_length(bin_choose(5, 2), 1)
  expect_length(bin_choose(10, 3), 1)
  expect_length(bin_choose(8, 3), 1)
})

test_that("bin_choose gives an error with invalid inputs",{
  expect_error(bin_choose("abc", 3))
  expect_error(bin_choose(3, "abc"))
})


# bin_probability
test_that("bin_probability with ok inputs trials, prob, and success gives the right calculation",{
  expect_equal(bin_probability(2, 3, 0.5), choose(3, 2)*0.5^2*(1-0.5)^1)
  expect_equal(bin_probability(3, 5, 0.3), choose(5, 3)*0.3^3*(1-0.3)^2)
  expect_equal(bin_probability(0:2, 5, 0.5), c(0.03125, 0.15625, 0.31250))
})

test_that("bin_probability has the same length as success",{
  expect_length(bin_probability(2, 3, 0.5), length(2))
  expect_length(bin_probability(1:3, 3, 0.5), length(1:3))
  expect_length(bin_probability(c(2,4,5,2,6), 10, 0.2), length(c(2,4,5,2,6)))
})

test_that("bin_probability gives an error if inputs are invalid",{
  expect_error(bin_probability(5, 4, 0.5)) # success cannot be greater than trials
  expect_error(bin_probability(-1, 2, 0.5)) # success cannot be negative
  expect_error(bin_probability(2.3, 4, 0.5)) # success cannot be non-integer
  expect_error(bin_probability(2, -3, 0.5)) # trials cannot be negative
  expect_error(bin_probability(2, 3.4, 0.5)) # trials cannot be non-integer
  expect_error(bin_probability(2, 3, 2)) # prob should be between 0 and 1
  expect_error(bin_probability(2, 3, -1)) # prob cannot be negative
})


# bin_distribution
test_that("bin_distribution returns a data frame with two classes c('bindis', 'data.frame')",{
  expect_equal(class(bin_distribution(5, 0.5)), c('bindis', 'data.frame'))
  expect_equal(class(bin_distribution(10, 0.2)), c('bindis', 'data.frame'))
  expect_equal(class(bin_distribution(9, 0.56)), c('bindis', 'data.frame'))
})

test_that("bin_distribution has a number of rows that equals (trials+1)",{
  expect_equal(nrow(bin_distribution(5, 0.5)), 5+1)
  expect_equal(nrow(bin_distribution(3, 0.3)), 3+1)
  expect_equal(nrow(bin_distribution(8, 0.2)), 8+1)
})

test_that("bin_distribution gives an error if inputs are invalid",{
  expect_error(bin_distribution(5, 4, 0.5)) # success cannot be greater than trials
  expect_error(bin_distribution(-1, 2, 0.5)) # success cannot be negative
  expect_error(bin_distribution(2.3, 4, 0.5)) # success cannot be non-integer
  expect_error(bin_distribution(2, -3, 0.5)) # trials cannot be negative
  expect_error(bin_distribution(2, 3.4, 0.5)) # trials cannot be non-integer
  expect_error(bin_distribution(2, 3, 2)) # prob should be between 0 and 1
  expect_error(bin_distribution(2, 3, -1)) # prob cannot be negative
})


# bin_cumulative()
test_that("bin_cumulative returns a data frame with two classes c('bindis', 'data.frame')",{
  expect_equal(class(bin_cumulative(5, 0.5)), (c('bincum', 'data.frame')))
  expect_equal(class(bin_cumulative(10, 0.2)), c('bincum', 'data.frame'))
  expect_equal(class(bin_cumulative(9, 0.56)), c('bincum', 'data.frame'))
})

test_that("bin_cumulative has a number of rows that equals (trials+1)",{
  expect_equal(nrow(bin_cumulative(5, 0.5)), 5+1)
  expect_equal(nrow(bin_cumulative(3, 0.3)), 3+1)
  expect_equal(nrow(bin_cumulative(8, 0.2)), 8+1)
})

test_that("bin_cumulative gives an error if inputs are invalid",{
  expect_error(bin_cumulative(5, 4, 0.5)) # success cannot be greater than trials
  expect_error(bin_cumulative(-1, 2, 0.5)) # success cannot be negative
  expect_error(bin_cumulative(2.3, 4, 0.5)) # success cannot be non-integer
  expect_error(bin_cumulative(2, -3, 0.5)) # trials cannot be negative
  expect_error(bin_cumulative(2, 3.4, 0.5)) # trials cannot be non-integer
  expect_error(bin_cumulative(2, 3, 2)) # prob should be between 0 and 1
  expect_error(bin_cumulative(2, 3, -1)) # prob cannot be negative
})
