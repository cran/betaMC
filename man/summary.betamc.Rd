% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/betaMC-methods.R
\name{summary.betamc}
\alias{summary.betamc}
\title{Summary Method for an Object of Class \code{betamc}}
\usage{
\method{summary}{betamc}(object, alpha = c(0.05, 0.01, 0.001), digits = 4, ...)
}
\arguments{
\item{object}{Object of class \code{betamc}.}

\item{alpha}{Significance level.}

\item{digits}{Digits to print.}

\item{...}{additional arguments.}
}
\value{
Returns a matrix of standardized regression slopes,
standard errors, test statistics, p-values, and confidence intervals.
}
\description{
Summary Method for an Object of Class \code{betamc}
}
\examples{
object <- lm(QUALITY ~ NARTIC + PCTGRT + PCTSUPP, data = nas1982)
out <- BetaMC(object, R = 100)
# use a large R, for example, R = 20000 for actual research
summary(out)
}
\author{
Ivan Jacob Agaloos Pesigan
}
\keyword{methods}
