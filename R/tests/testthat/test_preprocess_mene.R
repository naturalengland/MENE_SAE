context("Testing data conversions")

test_that("Mene Q1 coded correctly", {
  test_fixture <- data.frame('q1'=c(0, 1, 5))
  test_solution <- c(0, 1, 1)
  expect_equal(mene_code_q1(test_fixture)$q1_binary, test_solution)
})


test_that("Mene Q17 coded correctly", {
  test_fixture <- data.frame('q17'=c(
    "Never", "Once or twice", "Once every 2-3 months", "Once or twice a month",
    "Once a week", "Several times a week", "Every day", "More than once per day"))
  test_solution <- c(0, 0, 1, 1, 1, 1, 1, 1)
  expect_equal(mene_code_q17(test_fixture)$q17_binary, test_solution)
})
