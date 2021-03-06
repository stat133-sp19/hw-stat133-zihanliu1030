% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/workout03-Zihan-Liu.R
\name{bin_cumulative}
\alias{bin_cumulative}
\title{binomial cumulative probability}
\usage{
bin_cumulative(trials, prob)
}
\arguments{
\item{trials}{number of trials (integer)}

\item{prob}{probability of success (numeric)}
}
\value{
a data.frame with two classes: c("bincum", "data.frame")
}
\description{
output a data.frame with two classes: c("bincum", "data.frame")
}
\examples{
bin_cumulative(trials = 5, prob = 0.5)
}
