context("Testing mene to stan conversion")

test_that("Simple mene", {
  mene.df <- data.frame(
  q1_binary = c(1, 0, 0, 1), car=as.factor(c("yes", "no", "yes", "no")),
  age=as.factor(c("1", "2", "3", "4")), sex=as.factor(c("M", "M", "M", "F")),
  seg=as.factor(c("AB", "AB", "CD", "CD")),
  genhealth=as.factor(c("Bad", "Good", "Good", "Good")),
  la_number=c(1, 2, 3, 4))
  y = mene.df$q1_binary
  individual_terms = c("age", "sex", "car", "seg", "genhealth")
  test_solution <- matrix(c(1, 1, 1, 1,
                            0, 1, 0, 0,
                            0, 0, 1, 0,
                            0, 0, 0, 1,
                            1, 1, 1, 0,
                            1, 0, 1, 0,
                            0, 0, 1, 1,
                            0, 1, 1, 1), 4, 8)
  expect_equal(sum(
      format_hierarchical(
          y, mene.df, individual_terms, c(1, 2, 3, 4))$X),
                          sum(test_solution))
})
