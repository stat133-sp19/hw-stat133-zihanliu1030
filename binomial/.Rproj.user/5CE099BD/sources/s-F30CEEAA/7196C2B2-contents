library(ggplot2)
library(testthat)

# Tests for stat_range()
success <- 2
trials <- 5
prob <- 0.5
context("Test for binomial functions")
test_that("bin_choose works as expected", {
  expect_equal(bin_choose(n = trials, k = success), 10)
  expect_length(bin_choose(n = trials, k = success), 1)
  expect_error(bin_choose(n = trials, k = prob))
})

test_that("bin_probability works as expected", {
  expect_equal(bin_probability(success = success, trials = trials, prob = prob), 0.3125)
  expect_length(bin_probability(success = success, trials = trials, prob = prob), 1)
  expect_error(bin_probability(success = prob, trials = trials, prob = prob))
})

test_that("bin_distribution works as expected", {
  expect_is(bin_distribution(trials = trials, prob = prob), c("bindis", "data.frame"))
  expect_length(bin_distribution(trials = trials, prob = prob), 2)
  expect_error(bin_distribution(trials = prob, prob = prob))
})

test_that("bin_variable works as expected", {
  expect_is(bin_variable(trials = trials, prob = prob), "binvar")
  expect_length(bin_variable(trials = trials, prob = prob), 2)
  expect_error(bin_variable(trials = prob, prob = prob))
})
