## ---- test-betaMC-beta-mc-est
lapply(
  X = 1,
  FUN = function(i,
                 text,
                 R,
                 tol) {
    message(text)
    set.seed(42)
    if (!exists("nas1982")) {
      try(
        data(
          "nas1982",
          package = "betaMC"
        ),
        silent = TRUE
      )
    }
    df <- nas1982
    object <- lm(QUALITY ~ NARTIC + PCTGRT + PCTSUPP, data = df)
    mc <- MC(object, R = R, type = "mvn")
    out <- BetaMC(mc)
    print.betamc(out)
    summary.betamc(out)
    coef.betamc(out)
    vcov.betamc(out)
    confint.betamc(out)
    testthat::test_that(
      paste(text, "standardized regression slopes"),
      {
        testthat::expect_true(
          all(
            abs(
              coef.betamc(out) - c(
                .4951,
                .3915,
                .2632
              )
            ) <= tol
          )
        )
      }
    )
    object <- lm(QUALITY ~ NARTIC, data = df)
    mc <- MC(object, R = R, type = "mvn")
    out <- BetaMC(mc)
    print.betamc(out)
    summary.betamc(out)
    coef.betamc(out)
    vcov.betamc(out)
    confint.betamc(out)
  },
  text = "test-betaMC-beta-mc-est",
  R = 5L,
  tol = 0.0001
)
