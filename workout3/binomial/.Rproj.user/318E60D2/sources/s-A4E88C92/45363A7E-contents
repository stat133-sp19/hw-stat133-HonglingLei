

library(testthat)


context("check checkers")

# check_prob
test_that("check_prob with prob between 0 and 1", {
  expect_true(check_prob(0.2))
  expect_error(check_prob(-1))
  expect_error(check_prob(2))
})

test_that("check_prob with prob of length 1",{
  expect_length(check_prob(1), 1)
})

test_that("check_prob gets an error if prob is invalid",{
  expect_error(check_prob(1:5))
  expect_error(check_prob("abc"))
})


# check_trials
test_that("check_trials with trials being a non-negative integer",{
  expect_true(check_trials(200))
  expect_true(check_trials(5))
  expect_true(check_trials(0))
})

test_that("check_trials with trials of length 1",{
  expect_length(check_trials(200), 1)
})

test_that("check_trials gets an error if trials is invalid",{
  expect_error(check_trials(-2))
  expect_error(check_trials(2.3))
  expect_error(check_trials("abc"))
  expect_error(check_trials(1:5))
})


# check_success
test_that("check_success with success in 0 <= k <= n",{
  expect_true(check_success(2, 3))
  expect_true(check_success(1:3, 4))
})

test_that("check_success with success being a vector of integers",{
  expect_true(check_success(3, 4))
  expect_true(check_success(3, 50))
  expect_true(check_success(1:20, 40))
  expect_true(check_success(c(2,3,6,7,5,8,4), 10))
})

test_that("check_success has length 1",{
  expect_length(check_success(3, 4), 1)
  expect_length(check_success(c(1,2,3), 4), 1)
})

test_that("check_success gets an error if inputs are invalid",{
  expect_error(check_success(4, 3))
  expect_error(check_success(4.5, 5))
  expect_error(check_success(-1, 3))
  expect_error(check_success("abc", 3))
})

