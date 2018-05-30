context("Name of test context")
library(testthat)
library(Erosion)

State1 <- c(12,240,235,233,228,227,230,229,235,230,229,226,224,
                    180,179,176,175,183,185,189,188,190,192,189,190)
State2 <- c(12,180,180,180,180,180,180,180,180,180,180,180,180,
                   220,220,220,220,220,220,220,220,220,220,220,220)

test_that("High erosion risk when process flows are 20% more than motive flows", {
  expect_equal(round(VorTeq_RF(State1)[1],2),0.40)
})

test_that("Low erosion risk when process flows are 20% less than motive flows", {
  expect_equal(round(VorTeq_RF(State2)[1],2),0.11)
})

